{ ... }:
{
  programs.zen-browser = {
    enable = true;
    profiles.lyonya = {
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "zen.welcome-screen.seen" = true;
        "zen.view.window.scheme" = 0;
      };
      userChrome = ./userChrome.css;
      userContent = ./userContent.css;
    };

  };
}
