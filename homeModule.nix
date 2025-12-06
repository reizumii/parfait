{ lib, ... }:
let
  perProfile =
    f:
    map
      (variant: {
        options.programs.${variant}.profiles = lib.mkOption {
          type = lib.types.attrsOf (lib.types.submodule (f variant));
        };
      })
      [
        "firefox"
        "librewolf"
      ];

  settings = lib.mkMerge [
    # required settings
    {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "svg.context-properties.content.enabled" = true;
      "sidebar.position_start" = true;
    }
    # parfait defaults
    (lib.mapAttrs (_name: value: lib.mkOptionDefault value) {
      "parfait.animations.enabled" = true;
      "parfait.blur.enabled" = false;

      "parfait.bg.accent-color" = false;
      "parfait.bg.contrast" = 2;
      "parfait.bg.gradient" = false;
      "parfait.bg.opacity" = 4;
      "parfait.bg.transparent" = false;

      "parfait.tabs.groups.color" = false;

      "parfait.sidebar.width.preset" = 2;

      "parfait.theme.lwt.alt" = false;
      "parfait.theme.roundness.preset" = 1;

      "parfait.toolbar.sidebar-gutter" = true;
      "parfait.toolbar.unified-sidebar" = true;

      "parfait.traffic-lights.enabled" = false;
      "parfait.traffic-lights.mono" = false;

      "parfait.urlbar.url.center" = false;
      "parfait.urlbar.results.compact" = false;
      "parfait.urlbar.search-mode.glow" = true;

      "parfait.window.borderless" = false;

      "parfait.new-tab.logo" = 1;
      "parfait.new-tab.bg.pattern" = false;
    })
  ];
in
{
  imports = perProfile (
    variant:
    (
      { config, ... }:
      {
        options.parfait.enable = lib.mkEnableOption "A tasty theme modification for ${lib.toUpper variant}";
        config = lib.mkIf config.parfait.enable {
          userChrome = ''
            @import "${./parfait}/parfait.css";
          '';
          userContent = ''
            @import "${./parfait}/pages.css";
          '';
          inherit settings;
        };
      }
    )
  );
}
