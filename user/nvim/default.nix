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

  luaConfig = combineFilesRecursive pwd luaFile;
  themes = import ../theme "nvim";
in
{
  inherit (themes) catppuccin;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      telescope-nvim
      telescope-fzf-native-nvim
      telescope-ui-select-nvim
      telescope-fzf-native-nvim
      conform-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      which-key-nvim
      neodev-nvim
    ];
    extraLuaConfig = luaConfig;
  };
}
