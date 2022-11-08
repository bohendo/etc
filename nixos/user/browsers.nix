{ config, inputs, pkgs, ... }:
{
  programs = {

    firefox = {
      enable = true;
      profiles.bohendo = {
        bookmarks = [ {
          name = "wikipedia";
          keyword = "wiki";
          url = "https://en.wikipedia.org";
        } ];
        search = {
          default = "DuckDuckGo";
          force = true;
          engines = {

            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "Bing".metaData.hidden = true;
            "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias

          };
          order = [ "DuckDuckGo" ];
        };
        settings = {
          "browser.startup.homepage" = "https://nixos.org";
          "browser.search.region" = "EN";
          "browser.search.isUS" = true;
          "distribution.searchplugins.defaultLocale" = "en-EN";
          "general.useragent.locale" = "en-EN";
          "browser.bookmarks.showMobileBookmarks" = false;
        };
      };
    };

    librewolf = {
      enable = true;
    };

  };
}

