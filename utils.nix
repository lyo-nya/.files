{ pkgs, ... }:
let
  inherit (builtins) readDir attrNames readFile;
  inherit (pkgs.lib.attrsets) filterAttrs;
  inherit (pkgs.lib.strings) concatStringsSep;
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
in
{
  combineFilesRecursive = combineFilesRecursive;
}
