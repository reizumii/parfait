/*
  Parfait - Default Configuration
  https://github.com/reizumii/parfait
*/

/* --- enable userchrome theming --- */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("svg.context-properties.content.enabled", true);

/* --- set default parfait preferences --- */

/* general */
user_pref("parfait.animations.enabled", true);

/* theme */
user_pref("parfait.theme.borderless", false);
user_pref("parfait.theme.blur.enabled", false);
user_pref("parfait.theme.roundness.preset", 0);

/* background */
user_pref("parfait.background.accent-color", false);
user_pref("parfait.background.accent-color.contrast", 2);
user_pref("parfait.background.accent-color.gradient", false);
user_pref("parfait.background.accent-color.opacity", 4);
user_pref("parfait.background.transparent", false);

/* tabs */
user_pref("parfait.tabs.groups.fx-colors-on-folders", false);

/* layout */
user_pref("parfait.layout.unified-sidebar", true);
user_pref("parfait.layout.unified-sidebar.width.preset", 2);

/* toolbar */
user_pref("parfait.toolbar.sidebar-gutter", true);

/* traffic lights */
user_pref("parfait.traffic-lights.enabled", false);
user_pref("parfait.traffic-lights.mono", false);

/* url bar */
user_pref("parfait.urlbar.center-url", false);

/* new tab */
user_pref("parfait.new-tab.logo.preset", 1);
user_pref("parfait.new-tab.background.pattern", false);
