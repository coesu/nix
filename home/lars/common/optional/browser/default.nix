{ config, pkgs, inputs, ... }:
{
    programs.firefox = {
        enable = true;
        profiles.default = {
            settings = {
                "browser.disableResetPrompt" = true;
                "browser.shell.checkDefaultBrowser" = false;
                "browser.shell.defaultBrowserCheckCount" = 1;
                "browser.startup.homepage" = "about:blank";
                "browser.newtabpage.enabled" = false;
                # "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","urlbar-container","downloads-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":18,"newElementCount":4}'';
                "dom.security.https_only_mode" = true;
                "identity.fxaccounts.enabled" = false;
                "privacy.trackingprotection.enabled" = true;
                "browser.translations.neverTranslateLanguages" = "de";
            };

            extensions = with inputs.firefoxaddons.packages."x86_64-linux"; [
                bitwarden
                ublock-origin
                youtube-shorts-block
                vimium
            ];
        };
    };
}
