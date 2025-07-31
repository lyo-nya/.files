{ pkgs, ... }:
let
  inherit (pkgs.lib.strings) hasSuffix concatStringsSep;
  inherit (builtins) readDir attrNames readFile;
  inherit (pkgs.lib.attrsets) filterAttrs;
  joinNewLine = concatStringsSep "\n";
  combineFilesRecursive =
    dir: fileFilter:
    let
      contents = readDir dir;
      files = attrNames (filterAttrs (name: type: (type == "regular") && (fileFilter name)) contents);
      dirs = attrNames (filterAttrs (name: type: type == "directory") contents);
      filesWithPath = joinNewLine (map (f: readFile "${dir}/${f}") files);
      filesInSubdirs = joinNewLine (map (d: combineFilesRecursive "${dir}/${d}" fileFilter) dirs);
    in
    joinNewLine [
      filesWithPath
      filesInSubdirs
    ];
  pwd = (builtins.toString ./.);
  luaFile = hasSuffix ".lua";

in
combineFilesRecursive pwd luaFile
