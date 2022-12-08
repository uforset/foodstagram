<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../common/error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link href="/foodstagram/resources/css/reset.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style nonce="L0sKbXvX">:root,.__ig-light-mode{--fds-black:#000000;--fds-black-alpha-05:rgba(0, 0, 0, 0.05);--fds-black-alpha-10:rgba(0, 0, 0, 0.1);--fds-black-alpha-15:rgba(0, 0, 0, 0.15);--fds-black-alpha-20:rgba(0, 0, 0, 0.2);--fds-black-alpha-30:rgba(0, 0, 0, 0.3);--fds-black-alpha-40:rgba(0, 0, 0, 0.4);--fds-black-alpha-50:rgba(0, 0, 0, 0.5);--fds-black-alpha-60:rgba(0, 0, 0, 0.6);--fds-black-alpha-80:rgba(0, 0, 0, 0.8);--fds-blue-05:#ECF3FF;--fds-blue-30:#AAC9FF;--fds-blue-40:#77A7FF;--fds-blue-60:#1877F2;--fds-blue-70:#2851A3;--fds-blue-80:#1D3C78;--fds-button-text:#444950;--fds-comment-background:#F2F3F5;--fds-dark-mode-gray-35:#CCCCCC;--fds-dark-mode-gray-50:#828282;--fds-dark-mode-gray-70:#4A4A4A;--fds-dark-mode-gray-80:#373737;--fds-dark-mode-gray-90:#282828;--fds-dark-mode-gray-100:#1C1C1C;--fds-gray-00:#F5F6F7;--fds-gray-05:#F2F3F5;--fds-gray-10:#EBEDF0;--fds-gray-20:#DADDE1;--fds-gray-25:#CCD0D5;--fds-gray-30:#BEC3C9;--fds-gray-45:#8D949E;--fds-gray-70:#606770;--fds-gray-80:#444950;--fds-gray-90:#303338;--fds-gray-100:#1C1E21;--fds-green-55:#00A400;--fds-highlight:#3578E5;--fds-highlight-cell-background:#ECF3FF;--fds-primary-icon:#1C1E21;--fds-primary-text:#1C1E21;--fds-red-55:#FA383E;--fds-soft:cubic-bezier(.08,.52,.52,1);--fds-spectrum-aluminum-tint-70:#E4F0F6;--fds-spectrum-blue-gray-tint-70:#CFD1D5;--fds-spectrum-cherry:#F35369;--fds-spectrum-cherry-tint-70:#FBCCD2;--fds-spectrum-grape-tint-70:#DDD5F0;--fds-spectrum-grape-tint-90:#F4F1FA;--fds-spectrum-lemon-dark-1:#F5C33B;--fds-spectrum-lemon-tint-70:#FEF2D1;--fds-spectrum-lime:#A3CE71;--fds-spectrum-lime-tint-70:#E4F0D5;--fds-spectrum-orange-tint-70:#FCDEC5;--fds-spectrum-orange-tint-90:#FEF4EC;--fds-spectrum-seafoam-tint-70:#CAEEF9;--fds-spectrum-slate-dark-2:#89A1AC;--fds-spectrum-slate-tint-70:#EAEFF2;--fds-spectrum-teal:#6BCEBB;--fds-spectrum-teal-dark-1:#4DBBA6;--fds-spectrum-teal-dark-2:#31A38D;--fds-spectrum-teal-tint-70:#D2F0EA;--fds-spectrum-teal-tint-90:#F0FAF8;--fds-spectrum-tomato:#FB724B;--fds-spectrum-tomato-tint-30:#F38E7B;--fds-spectrum-tomato-tint-90:#FDEFED;--fds-strong:cubic-bezier(.12,.8,.32,1);--fds-white:#FFFFFF;--fds-white-alpha-05:rgba(255, 255, 255, 0.05);--fds-white-alpha-10:rgba(255, 255, 255, 0.1);--fds-white-alpha-20:rgba(255, 255, 255, 0.2);--fds-white-alpha-30:rgba(255, 255, 255, 0.3);--fds-white-alpha-40:rgba(255, 255, 255, 0.4);--fds-white-alpha-50:rgba(255, 255, 255, 0.5);--fds-white-alpha-60:rgba(255, 255, 255, 0.6);--fds-white-alpha-80:rgba(255, 255, 255, 0.8);--fds-yellow-20:#FFBA00;--accent:#0095F6;--always-white:#FFFFFF;--always-black:black;--always-dark-gradient:linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.6));--always-dark-overlay:rgba(0, 0, 0, 0.4);--always-light-overlay:rgba(255, 255, 255, 0.4);--always-gray-40:#65676B;--always-gray-75:#BCC0C4;--always-gray-95:#F0F2F5;--attachment-footer-background:#F0F2F5;--background-deemphasized:#F0F2F5;--base-blue:#1877F2;--base-cherry:#F3425F;--base-grape:#9360F7;--base-lemon:#F7B928;--base-lime:#45BD62;--base-pink:#FF66BF;--base-seafoam:#54C7EC;--base-teal:#2ABBA7;--base-tomato:#FB724B;--blue-link:#00376B;--border-focused:#65676B;--card-background:#FFFFFF;--card-background-flat:#F7F8FA;--comment-background:#F0F2F5;--comment-footer-background:#F6F9FA;--dataviz-primary-1:rgb(48,200,180);--disabled-button-background:rgba(0, 149, 246, 0.3);--disabled-button-text:#FFFFFF;--disabled-icon:#BCC0C4;--disabled-text:#BCC0C4;--divider:#DBDBDB;--event-date:#F3425F;--fb-wordmark:#1877F2;--filter-accent:invert(39%) sepia(57%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(147.75%) hue-rotate(202deg) brightness(97%) contrast(96%);--filter-always-white:invert(100%);--filter-disabled-icon:invert(80%) sepia(6%) saturate(200%) saturate(120%) hue-rotate(173deg) brightness(98%) contrast(89%);--filter-placeholder-icon:invert(59%) sepia(11%) saturate(200%) saturate(135%) hue-rotate(176deg) brightness(96%) contrast(94%);--filter-primary-icon:invert(8%) sepia(10%) saturate(200%) saturate(200%) saturate(166%) hue-rotate(177deg) brightness(104%) contrast(91%);--filter-secondary-icon:invert(39%) sepia(21%) saturate(200%) saturate(109.5%) hue-rotate(174deg) brightness(94%) contrast(86%);--filter-warning-icon:invert(77%) sepia(29%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(128%) hue-rotate(359deg) brightness(102%) contrast(107%);--filter-blue-link-icon:invert(30%) sepia(98%) saturate(200%) saturate(200%) saturate(200%) saturate(166.5%) hue-rotate(192deg) brightness(91%) contrast(101%);--filter-positive:invert(37%) sepia(61%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(115%) hue-rotate(91deg) brightness(97%) contrast(105%);--filter-negative:invert(25%) sepia(33%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(110%) hue-rotate(345deg) brightness(132%) contrast(96%);--glimmer-spinner-icon:#65676B;--hero-banner-background:#FFFFFF;--hosted-view-selected-state:rgba(45, 136, 255, 0.1);--highlight-bg:#E7F3FF;--hover-overlay:rgba(0, 0, 0, 0.05);--list-cell-chevron:#65676B;--media-hover:rgba(68, 73, 80, 0.15);--media-inner-border:rgba(0, 0, 0, 0.1);--media-outer-border:#FFFFFF;--media-pressed:rgba(68, 73, 80, 0.35);--messenger-card-background:#FFFFFF;--messenger-reply-background:#F0F2F5;--overlay-alpha-80:rgba(0, 0, 0, 0.65);--overlay-on-media:rgba(0, 0, 0, 0.6);--nav-bar-background:#FFFFFF;--nav-bar-background-gradient:linear-gradient(to top, #FFFFFF, rgba(255,255,255.9), rgba(255,255,255,.7), rgba(255,255,255,.4), rgba(255,255,255,0));--nav-bar-background-gradient-wash:linear-gradient(to top, #F0F2F5, rgba(240,242,245.9), rgba(240,242,245,.7), rgba(240,242,245,.4), rgba(240,242,245,0));--negative:hsl(350, 87%, 55%);--negative-background:hsl(350, 87%, 55%, 20%);--new-notification-background:#E7F3FF;--non-media-pressed:rgba(68, 73, 80, 0.15);--non-media-pressed-on-dark:rgba(255, 255, 255, 0.3);--notification-badge:#e41e3f;--placeholder-icon:#65676B;--placeholder-image:rgb(164, 167, 171);--placeholder-text:#65676B;--placeholder-text-on-media:rgba(255, 255, 255, 0.5);--popover-background:#FFFFFF;--positive:#31A24C;--positive-background:#DEEFE1;--press-overlay:rgba(0, 0, 0, 0.10);--primary-button-background:#0095F6;--primary-button-icon:#FFFFFF;--primary-button-pressed:#77A7FF;--primary-button-text:#FFFFFF;--primary-deemphasized-button-background:rgba(0, 149, 246, 0.1);--primary-deemphasized-button-pressed:rgba(0, 149, 246, 0.05);--primary-deemphasized-button-pressed-overlay:rgba(0, 149, 246, 0.15);--primary-deemphasized-button-text:#0095F6;--primary-icon:#262626;--primary-text:#262626;--primary-text-on-media:#FFFFFF;--primary-web-focus-indicator:#D24294;--progress-ring-neutral-background:rgba(0, 0, 0, 0.2);--progress-ring-neutral-foreground:#000000;--progress-ring-on-media-background:rgba(255, 255, 255, 0.2);--progress-ring-on-media-foreground:#FFFFFF;--progress-ring-blue-background:rgba(24, 119, 242, 0.2);--progress-ring-blue-foreground:hsl(214, 89%, 52%);--progress-ring-disabled-background:rgba(190,195,201, 0.2);--progress-ring-disabled-foreground:#BEC3C9;--rating-star-active:#EB660D;--scroll-thumb:#BCC0C4;--scroll-shadow:0 1px 2px rgba(0, 0, 0, 0.1), 0 -1px rgba(0, 0, 0, 0.1) inset;--secondary-button-background:transparent;--secondary-button-background-floating:#ffffff;--secondary-button-background-on-dark:rgba(0, 0, 0, 0.4);--secondary-button-pressed:rgba(0, 0, 0, 0.05);--secondary-button-stroke:transparent;--secondary-button-text:#0095F6;--secondary-icon:#8E8E8E;--secondary-text:#8E8E8E;--secondary-text-on-media:rgba(255, 255, 255, 0.9);--section-header-text:#4B4C4F;--shadow-1:rgba(0, 0, 0, 0.1);--shadow-2:rgba(0, 0, 0, 0.2);--shadow-5:rgba(0, 0, 0, 0.5);--shadow-8:rgba(0, 0, 0, 0.8);--shadow-inset:rgba(255, 255, 255, 0.5);--shadow-elevated:0px 5px 12px rgba(52, 72, 84, 0.2);--shadow-persistent:0px 0px 12px rgba(52, 72, 84, 0.05);--shadow-primary:0px 5px 12px rgba(52, 72, 84, 0.2);--surface-background:#FFFFFF;--switch-active:hsl(214, 89%, 52%);--text-highlight:rgba(24, 119, 242, 0.2);--text-input-background:#FFFFFF;--toast-background:#FFFFFF;--toast-text:#1C2B33;--toast-text-link:#216FDB;--toggle-active-background:#E7F3FF;--toggle-active-icon:rgb(24, 119, 242);--toggle-active-text:rgb(24, 119, 242);--toggle-button-active-background:#E7F3FF;--wash:#FAFAFA;--web-wash:#FAFAFA;--warning:hsl(40, 89%, 52%);--fb-logo-color:#2D88FF;--dialog-anchor-vertical-padding:56px;--header-height:0px;--global-panel-width:0px;--global-panel-width-expanded:0px;--alert-banner-corner-radius:8px;--button-corner-radius:4px;--button-corner-radius-medium:10px;--button-corner-radius-large:12px;--button-height-large:40px;--button-height-medium:36px;--button-padding-horizontal-large:16px;--button-padding-horizontal-medium:16px;--button-icon-padding-large:16px;--button-icon-padding-medium:16px;--button-inner-icon-spacing-large:3px;--button-inner-icon-spacing-medium:3px;--blueprint-button-height-medium:40px;--blueprint-button-height-large:48px;--card-corner-radius:4px;--card-box-shadow:0 12px 28px 0 var(--shadow-2), 0 2px 4px 0 var(--shadow-1);--card-padding-vertical:20px;--chip-corner-radius:6px;--dialog-corner-radius:8px;--glimmer-corner-radius:8px;--image-corner-radius:4px;--input-corner-radius:4px;--nav-list-cell-corner-radius:8px;--list-cell-corner-radius:8px;--list-cell-min-height:52px;--list-cell-padding-vertical:20px;--list-cell-padding-vertical-with-addon:14px;--nav-list-cell-min-height:0px;--nav-list-cell-padding-vertical:16px;--nav-list-cell-padding-vertical-with-addon:16px;--text-input-multi-padding-between-text-scrollbar:20px;--text-input-multi-padding-scrollbar:16px;--toast-corner-radius:4px;--text-input-caption-margin-top:10px;--text-input-label-top:22px;--text-input-min-height:64px;--text-input-padding-vertical:12px;--fds-animation-enter-exit-in:cubic-bezier(0.14, 1, 0.34, 1);--fds-animation-enter-exit-out:cubic-bezier(0.45, 0.1, 0.2, 1);--fds-animation-swap-shuffle-in:cubic-bezier(0.14, 1, 0.34, 1);--fds-animation-swap-shuffle-out:cubic-bezier(0.45, 0.1, 0.2, 1);--fds-animation-move-in:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-move-out:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-expand-collapse-in:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-expand-collapse-out:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-passive-move-in:cubic-bezier(0.5, 0, 0.1, 1);--fds-animation-passive-move-out:cubic-bezier(0.5, 0, 0.1, 1);--fds-animation-quick-move-in:cubic-bezier(0.1, 0.9, 0.2, 1);--fds-animation-quick-move-out:cubic-bezier(0.1, 0.9, 0.2, 1);--fds-animation-fade-in:cubic-bezier(0, 0, 1, 1);--fds-animation-fade-out:cubic-bezier(0, 0, 1, 1);--fds-duration-extra-extra-short-in:100ms;--fds-duration-extra-extra-short-out:100ms;--fds-duration-extra-short-in:200ms;--fds-duration-extra-short-out:150ms;--fds-duration-short-in:280ms;--fds-duration-short-out:200ms;--fds-duration-medium-in:400ms;--fds-duration-medium-out:350ms;--fds-duration-long-in:500ms;--fds-duration-long-out:350ms;--fds-duration-extra-long-in:1000ms;--fds-duration-extra-long-out:1000ms;--fds-duration-none:0ms;--fds-fast:200ms;--fds-slow:400ms;--font-family-apple:system-ui, -apple-system, BlinkMacSystemFont, '.SFNSText-Regular', sans-serif;--font-family-code:ui-monospace, Menlo, Consolas, Monaco, monospace;--font-family-default:Helvetica, Arial, sans-serif;--font-family-segoe:Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif;--body-font-family:Placeholder Font;--body-font-size:0.9375rem;--body-font-weight:400;--body-line-height:1.3333;--body-emphasized-font-family:Placeholder Font;--body-emphasized-font-size:0.9375rem;--body-emphasized-font-weight:600;--body-emphasized-line-height:1.3333;--headline1-font-family:Optimistic Display Bold, system-ui, sans-serif;--headline1-font-size:1.75rem;--headline1-font-weight:700;--headline1-line-height:1.2143;--headline2-font-family:Optimistic Display Bold, system-ui, sans-serif;--headline2-font-size:1.5rem;--headline2-font-weight:700;--headline2-line-height:1.25;--headline3-font-family:Optimistic Display Bold, system-ui, sans-serif;--headline3-font-size:1.0625rem;--headline3-font-weight:700;--headline3-line-height:1.2941;--meta-font-family:Placeholder Font;--meta-font-size:0.8125rem;--meta-font-weight:400;--meta-line-height:1.3846;--meta-emphasized-font-family:Placeholder Font;--meta-emphasized-font-size:0.8125rem;--meta-emphasized-font-weight:600;--meta-emphasized-line-height:1.3846;--primary-label-font-family:Optimistic Display Medium, system-ui, sans-serif;--primary-label-font-size:1.0625rem;--primary-label-font-weight:500;--primary-label-line-height:1.2941;--secondary-label-font-family:Placeholder Font;--secondary-label-font-size:0.9375rem;--secondary-label-font-weight:500;--secondary-label-line-height:1.3333;--text-input-field-font-family:Placeholder Font;--text-input-field-font-size:1rem;--text-input-field-font-weight:500;--text-input-field-line-height:1.2941;--text-input-label-font-family:Placeholder Font;--text-input-label-font-size:17px;--text-input-label-font-size-scale-multiplier:0.75;--text-input-label-font-weight:400;--text-input-label-line-height:1.2941;--dataviz-primary-2:rgb(134,218,255);--dataviz-primary-3:rgb(95,170,255);--dataviz-secondary-1:rgb(118,62,230);--dataviz-secondary-2:rgb(147,96,247);--dataviz-secondary-3:rgb(219,26,139);--dataviz-supplementary-1:rgb(255,122,105);--dataviz-supplementary-2:rgb(241,168,23);--dataviz-supplementary-3:rgb(49,162,76);--dataviz-supplementary-4:rgb(50,52,54);--base-unit:4px;--blue-0:#f5fbff;--blue-2:#b3dbff;--blue-4:#47afff;--blue-5:#0095f6;--blue-6:#0074cc;--blue-7:#0057a3;--blue-8:#00376b;--blue-9:#002952;--breakpoint-medium-width:1536px;--breakpoint-small-width:1024px;--challenge-width:460px;--clr-separator:#efefef;--clr_red_dark_30:#af2634;--cluster-card-border-radius:8px;--creation-composer-height:81px;--creation-header-composer-height:126px;--creation-header-height:43px;--creation-min-padding-x:32px;--creation-modal-max-height:898px;--creation-modal-min-height:391px;--creation-padding-x:64px;--creation-padding-y:112px;--creation-settings-width:340px;--cyan-5:#27c4f5;--desktop-center-feed-min-width-breakpoint:1500px;--desktop-cluster-card-height:89px;--desktop-cluster-card-width:140px;--desktop-collapsed-nav-height:52px;--desktop-grid-item-margin:28px;--desktop-in-feed-story-item-height:208px;--desktop-in-feed-story-item-width:116px;--desktop-large-modal-max-height:781px;--desktop-large-modal-max-width:1491px;--desktop-large-modal-min-height:664px;--desktop-large-modal-min-width:908px;--desktop-nav-anim-duration:0.2s;--desktop-nav-height:60px;--desktop-nav-search-box-large-width:268px;--desktop-nav-search-box-width:215px;--desktop-regular-nav-height:77px;--desktop-skinny-nav-height:60px;--direct-attachment-image-grid-border-size:1px;--direct-attachment-image-grid-item-size:78px;--direct-attachment-image-grid-width:236px;--direct-attachment-story-height:150px;--direct-attachment-story-large-height:256px;--direct-attachment-story-large-width:164px;--direct-attachment-story-width:84px;--direct-message-margin:8px;--direct-message-max-width:236px;--extra-small-screen-max:413px;--fb-connect-blue:#4f67b0;--fb-signup-page-profile-pic-size:88px;--feed-sidebar-padding:32px;--feed-sidebar-width:319px;--feed-polaris-padding-small:32px;--feed-polaris-padding-med:70px;--feed-polaris-padding-large:96px;--feed-polaris-sidebar-width:268px;--feed-width-wide:614px;--feed-with-padding-threshold-min:640px;--font-family-system:-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;--font-weight-system-bold:700;--font-weight-system-extra-bold:800;--font-weight-system-extra-light:200;--font-weight-system-light:300;--font-weight-system-medium:500;--font-weight-system-regular:400;--font-weight-system-semibold:600;--gradient-lavender:#d300c5;--gradient-orange:#ff7a00;--gradient-pink:#ff0169;--gradient-purple:#7638fa;--gradient-yellow:#ffd600;--green-4:#78de45;--green-5:#58c322;--green-6:#37a600;--grey-0:#f5f5f5;--grey-1:#efefef;--grey-2:#dbdbdb;--grey-4:#a8a8a8;--grey-5:#8e8e8e;--grey-6:#737373;--grey-8:#363636;--grey-9:#262626;--grid-column-width-modal:6.25%;--grid-column-width:5.555555555555555%;--hscc-collapse-transition-duration:0.3s;--ig-badge:255, 48, 64;--ig-close-friends-refreshed:28, 209, 79;--ig-disabled-action-text:169, 219, 255;--ig-error-or-destructive:237, 73, 86;--ig-facebook-blue:53, 121, 234;--ig-full-screen-background:54, 54, 54;--ig-live-badge:255, 1, 105;--ig-primary-button:0, 149, 246;--ig-primary-button-hover:24, 119, 242;--ig-secondary-button-background:239, 239, 239;--ig-secondary-button-hover:219, 219, 219;--ig-secondary-button-focused:224, 241, 255;--ig-tertiary-button-background:255, 255, 255;--ig-tertiary-button-border:219, 219, 219;--ig-tertiary-button-hover:245, 245, 245;--ig-tertiary-button-text:38, 38, 38;--ig-subscribers-only:118, 56, 250;--ig-success:88, 195, 34;--ig-text-on-color:255, 255, 255;--ig-text-on-media:255, 255, 255;--igui-border-radius:3px;--in-feed-story-item-height:240px;--in-feed-story-item-width:135px;--input-border-radius:6px;--large-layout-min:1500px;--large-screen-min:876px;--like-animation-duration:1000ms;--live-video-border-radius:4px;--live-video-right-col-width:336px;--media-content-card-width:350px;--media-content-card-width-small:300px;--media-info:335px;--medium-layout-max:1499px;--medium-layout-min:1080px;--medium-screen-max:875px;--medium-screen-min:736px;--mobile-cluster-card-height:74px;--mobile-cluster-card-width:108px;--mobile-grid-item-margin:2px;--mobile-nav-height:45px;--modal-backdrop-dark:rgba(0, 0, 0, 0.85);--modal-backdrop-default:rgba(0, 0, 0, 0.65);--modal-border-radius:12px;--modal-padding:16px;--modal-z-index:100;--nav-narrow-width:72px;--nav-medium-width:244px;--nav-wide-width:335px;--nav-narrow-screen-min:768px;--nav-medium-screen-min:1264px;--nav-wide-screen-min:1920px;--orange-5:#fd8d32;--photo:600px;--pink-5:#d10869;--post-modal-large-screen-min:1536px;--post-modal-small-screen-max:1366px;--post-step-indicator:168, 168, 168;--purple-5:#a307ba;--red-4:#ff6874;--red-5:#ed4956;--red-6:#c62330;--red-7:#a70311;--reels-large-screen-min:1366px;--refinement-section-height:50px;--revamp-nav-bottom-toolbar-height:50px;--revamp-feed-card-max-height:758px;--revamp-feed-card-min-height:615px;--revamp-feed-card-min-width:661px;--revamp-feed-card-details-section-width:314px;--revamp-feed-horizontal-padding-small-screen:32px;--revamp-feed-horizontal-padding-large-screen:60px;--revamp-feed-vertical-padding:32px;--right-rail-width:300px;--scrollable-content-header-height-large:56px;--scrollable-content-header-height-med:49px;--scrollable-content-header-height:44px;--search-box-height:40px;--search-modal-height-expanded:450px;--search-modal-height:362px;--search-modal-top-offset:12px;--search-result-height:50px;--search-result-inline-top-offset:60px;--search-result-list-width:375px;--site-padding-top:30px;--site-width-narrow:600px;--site-width-wide:935px;--small-layout-max:1079px;--small-layout-min:800px;--small-screen-max:735px;--small-screen-min:414px;--story-cube-shading-duration:200ms;--story-desktop-margin-bottom:26px;--story-desktop-margin-top:82px;--story-gallery-preview-scale-correction:2.5;--story-progressbar-update-tick:0.1s;--story-swap-animation-duration:350ms;--system-10-font-size:10px;--system-10-line-height:12px;--system-11-font-size:11px;--system-11-line-height:13px;--system-12-font-size:12px;--system-12-line-height:16px;--system-14-font-size:14px;--system-14-line-height:18px;--system-16-font-size:16px;--system-16-line-height:24px;--system-18-font-size:18px;--system-18-line-height:24px;--system-20-font-size:20px;--system-20-line-height:25px;--system-22-font-size:22px;--system-22-line-height:26px;--system-24-font-size:24px;--system-24-line-height:27px;--system-26-font-size:26px;--system-26-line-height:28px;--system-28-font-size:28px;--system-28-line-height:32px;--system-30-font-size:30px;--system-30-line-height:36px;--system-32-font-size:32px;--system-32-line-height:40px;--web-always-black:0, 0, 0;--web-always-white:255, 255, 255;--web-overlay-on-media:38, 38, 38;--web-secondary-action:224, 241, 255;--yellow-5:#fdcb5c;--challenge-link:54,54,54;--docpen-lightgrey:243,243,243;--ig-banner-background:255,255,255;--ig-elevated-background:255,255,255;--ig-elevated-separator:219,219,219;--ig-focus-stroke:168,168,168;--ig-highlight-background:239,239,239;--ig-link:0,55,107;--ig-primary-background:255,255,255;--ig-primary-text:38,38,38;--ig-secondary-background:250,250,250;--ig-secondary-button:38,38,38;--ig-secondary-text:142, 142, 142;--ig-separator:219,219,219;--ig-stroke:219,219,219;--ig-temporary-highlight:245,251,255;--ig-tertiary-text:199,199,199;--post-separator:239,239,239;--tos-box-shadow:0,0,0;}.__ig-dark-mode{--fds-black:black;--fds-black-alpha-05:rgba(0, 0, 0, 0.05);--fds-black-alpha-10:rgba(0, 0, 0, 0.1);--fds-black-alpha-15:rgba(0, 0, 0, 0.15);--fds-black-alpha-20:rgba(0, 0, 0, 0.2);--fds-black-alpha-30:rgba(0, 0, 0, 0.3);--fds-black-alpha-40:rgba(0, 0, 0, 0.4);--fds-black-alpha-50:rgba(0, 0, 0, 0.5);--fds-black-alpha-60:rgba(0, 0, 0, 0.6);--fds-black-alpha-80:rgba(0, 0, 0, 0.8);--fds-blue-05:black;--fds-blue-30:black;--fds-blue-40:black;--fds-blue-60:black;--fds-blue-70:black;--fds-blue-80:black;--fds-button-text:black;--fds-comment-background:black;--fds-dark-mode-gray-35:black;--fds-dark-mode-gray-50:black;--fds-dark-mode-gray-70:black;--fds-dark-mode-gray-80:black;--fds-dark-mode-gray-90:black;--fds-dark-mode-gray-100:black;--fds-gray-00:black;--fds-gray-05:black;--fds-gray-10:black;--fds-gray-20:black;--fds-gray-25:black;--fds-gray-30:black;--fds-gray-45:black;--fds-gray-70:black;--fds-gray-80:black;--fds-gray-90:black;--fds-gray-100:black;--fds-green-55:black;--fds-highlight:black;--fds-highlight-cell-background:black;--fds-primary-icon:white;--fds-primary-text:white;--fds-red-55:black;--fds-soft:cubic-bezier(.08,.52,.52,1);--fds-spectrum-aluminum-tint-70:black;--fds-spectrum-blue-gray-tint-70:black;--fds-spectrum-cherry:black;--fds-spectrum-cherry-tint-70:black;--fds-spectrum-grape-tint-70:black;--fds-spectrum-grape-tint-90:black;--fds-spectrum-lemon-dark-1:black;--fds-spectrum-lemon-tint-70:black;--fds-spectrum-lime:black;--fds-spectrum-lime-tint-70:black;--fds-spectrum-orange-tint-70:black;--fds-spectrum-orange-tint-90:black;--fds-spectrum-seafoam-tint-70:black;--fds-spectrum-slate-dark-2:black;--fds-spectrum-slate-tint-70:black;--fds-spectrum-teal:black;--fds-spectrum-teal-dark-1:black;--fds-spectrum-teal-dark-2:black;--fds-spectrum-teal-tint-70:black;--fds-spectrum-teal-tint-90:black;--fds-spectrum-tomato:black;--fds-spectrum-tomato-tint-30:black;--fds-spectrum-tomato-tint-90:black;--fds-strong:cubic-bezier(.12,.8,.32,1);--fds-white:black;--fds-white-alpha-05:rgba(255, 255, 255, 0.05);--fds-white-alpha-10:rgba(255, 255, 255, 0.1);--fds-white-alpha-20:rgba(255, 255, 255, 0.2);--fds-white-alpha-30:rgba(255, 255, 255, 0.3);--fds-white-alpha-40:rgba(255, 255, 255, 0.4);--fds-white-alpha-50:rgba(255, 255, 255, 0.5);--fds-white-alpha-60:rgba(255, 255, 255, 0.6);--fds-white-alpha-80:rgba(255, 255, 255, 0.8);--fds-yellow-20:black;--accent:#0095F6;--always-white:white;--always-black:black;--always-dark-gradient:linear-gradient(rgba(0,0,0,0), rgba(0,0,0,0.6));--always-dark-overlay:rgba(0, 0, 0, 0.4);--always-light-overlay:rgba(255, 255, 255, 0.4);--always-gray-40:#65676B;--always-gray-75:#BCC0C4;--always-gray-95:#F0F2F5;--attachment-footer-background:rgba(255,255,255,0.1);--background-deemphasized:rgba(255,255,255,0.1);--base-blue:#1877F2;--base-cherry:#F3425F;--base-grape:#9360F7;--base-lemon:#F7B928;--base-lime:#45BD62;--base-pink:#FF66BF;--base-seafoam:#54C7EC;--base-teal:#2ABBA7;--base-tomato:#FB724B;--blue-link:#00376B;--border-focused:#8A8D91;--card-background:#242526;--card-background-flat:#323436;--comment-background:#3A3B3C;--comment-footer-background:#4E4F50;--dataviz-primary-1:rgb(48,200,180);--disabled-button-background:rgba(255, 255, 255, 0.2);--disabled-button-text:rgba(255, 255, 255, 0.3);--disabled-icon:rgba(255, 255, 255, 0.3);--disabled-text:rgba(255, 255, 255, 0.3);--divider:#3E4042;--event-date:#F3425F;--fb-wordmark:#FFFFFF;--filter-accent:invert(40%) sepia(52%) saturate(200%) saturate(200%) saturate(200%) saturate(189%) hue-rotate(191deg) brightness(103%) contrast(102%);--filter-always-white:invert(100%);--filter-disabled-icon:invert(100%) opacity(30%);--filter-placeholder-icon:invert(59%) sepia(11%) saturate(200%) saturate(135%) hue-rotate(176deg) brightness(96%) contrast(94%);--filter-primary-icon:invert(89%) sepia(6%) hue-rotate(185deg);--filter-secondary-icon:invert(62%) sepia(98%) saturate(12%) hue-rotate(175deg) brightness(90%) contrast(96%);--filter-warning-icon:invert(77%) sepia(29%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(128%) hue-rotate(359deg) brightness(102%) contrast(107%);--filter-blue-link-icon:invert(73%) sepia(29%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(103.25%) hue-rotate(189deg) brightness(101%) contrast(101%);--filter-positive:invert(37%) sepia(61%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(115%) hue-rotate(91deg) brightness(97%) contrast(105%);--filter-negative:invert(25%) sepia(33%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(200%) saturate(110%) hue-rotate(345deg) brightness(132%) contrast(96%);--glimmer-spinner-icon:white;--hero-banner-background:#E85D07;--hosted-view-selected-state:rgba(45, 136, 255, 0.1);--highlight-bg:rgba(24, 119, 242, .31);--hover-overlay:rgba(255, 255, 255, 0.1);--list-cell-chevron:#B0B3B8;--media-hover:rgba(68, 73, 80, 0.15);--media-inner-border:rgba(255, 255, 255, 0.05);--media-outer-border:#33363A;--media-pressed:rgba(68, 73, 80, 0.35);--messenger-card-background:#242526;--messenger-reply-background:#18191A;--overlay-alpha-80:rgba(0, 0, 0, 0.65);--overlay-on-media:rgba(0, 0, 0, 0.6);--nav-bar-background:#242526;--nav-bar-background-gradient:linear-gradient(to top, #242526, rgba(36,37,38,.9), rgba(36,37,38,.7), rgba(36,37,38,.4), rgba(36,37,38,0));--nav-bar-background-gradient-wash:linear-gradient(to top, #18191A, rgba(24,25,26,.9), rgba(24,25,26,.7), rgba(24,25,26,.4), rgba(24,25,26,0));--negative:hsl(350, 87%, 55%);--negative-background:hsl(350, 87%, 55%, 20%);--new-notification-background:#E7F3FF;--non-media-pressed:rgba(68, 73, 80, 0.15);--non-media-pressed-on-dark:rgba(255, 255, 255, 0.3);--notification-badge:#e41e3f;--placeholder-icon:#8A8D91;--placeholder-image:rgb(164, 167, 171);--placeholder-text:#8A8D91;--placeholder-text-on-media:rgba(255, 255, 255, 0.5);--popover-background:#3E4042;--positive:#31A24C;--positive-background:#1F3520;--press-overlay:rgba(255, 255, 255, 0.1);--primary-button-background:#0095F6;--primary-button-icon:#FFFFFF;--primary-button-pressed:#77A7FF;--primary-button-text:#FFFFFF;--primary-deemphasized-button-background:rgba(45, 136, 255, 0.2);--primary-deemphasized-button-pressed:rgba(24, 119, 242, 0.2);--primary-deemphasized-button-pressed-overlay:rgba(25, 110, 255, 0.15);--primary-deemphasized-button-text:#2D88FF;--primary-icon:#E4E6EB;--primary-text:#E4E6EB;--primary-text-on-media:white;--primary-web-focus-indicator:#D24294;--progress-ring-neutral-background:rgba(255, 255, 255, 0.2);--progress-ring-neutral-foreground:#ffffff;--progress-ring-on-media-background:rgba(255, 255, 255, 0.2);--progress-ring-on-media-foreground:#FFFFFF;--progress-ring-blue-background:rgba(45, 136, 255, 0.2);--progress-ring-blue-foreground:hsl(214, 100%, 59%);--progress-ring-disabled-background:rgba(122,125,130, 0.2);--progress-ring-disabled-foreground:#7A7D82;--rating-star-active:#FF9831;--scroll-thumb:rgba(255, 255, 255, 0.3);--scroll-shadow:0 1px 2px rgba(0, 0, 0, 0.1), 0 -1px rgba(255, 255, 255, 0.05) inset;--secondary-button-background:rgba(255,255,255,.1);--secondary-button-background-floating:#4B4C4F;--secondary-button-background-on-dark:rgba(255, 255, 255, 0.4);--secondary-button-pressed:rgba(0, 0, 0, 0.05);--secondary-button-stroke:transparent;--secondary-button-text:#E4E6EB;--secondary-icon:#B0B3B8;--secondary-text:#B0B3B8;--secondary-text-on-media:rgba(255, 255, 255, 0.9);--section-header-text:#BCC0C4;--shadow-1:rgba(0, 0, 0, 0.1);--shadow-2:rgba(0, 0, 0, 0.2);--shadow-5:rgba(0, 0, 0, 0.5);--shadow-8:rgba(0, 0, 0, 0.8);--shadow-inset:rgba(255, 255, 255, 0.05);--shadow-elevated:0px 5px 12px rgba(28, 43, 51, 0.6);--shadow-persistent:0px 0px 12px rgba(28, 43, 51, 0.6);--shadow-primary:0px 0px 12px rgba(28, 43, 51, 0.1);--surface-background:#242526;--switch-active:hsl(214, 100%, 59%);--text-highlight:rgba(24, 119, 242, 0.45);--text-input-background:#242526;--toast-background:#242526;--toast-text:#FFFFFF;--toast-text-link:#4599FF;--toggle-active-background:rgb(45, 136, 255);--toggle-active-icon:#FFFFFF;--toggle-active-text:#FFFFFF;--toggle-button-active-background:#E6F2FF;--wash:#3E4042;--web-wash:#18191A;--warning:hsl(40, 89%, 52%);--fb-logo-color:#2D88FF;--dialog-anchor-vertical-padding:56px;--header-height:0px;--global-panel-width:0px;--global-panel-width-expanded:0px;--alert-banner-corner-radius:8px;--button-corner-radius:4px;--button-corner-radius-medium:10px;--button-corner-radius-large:12px;--button-height-large:40px;--button-height-medium:36px;--button-padding-horizontal-large:16px;--button-padding-horizontal-medium:16px;--button-icon-padding-large:16px;--button-icon-padding-medium:16px;--button-inner-icon-spacing-large:3px;--button-inner-icon-spacing-medium:3px;--blueprint-button-height-medium:40px;--blueprint-button-height-large:48px;--card-corner-radius:4px;--card-box-shadow:0 12px 28px 0 var(--shadow-2), 0 2px 4px 0 var(--shadow-1);--card-padding-vertical:20px;--chip-corner-radius:6px;--dialog-corner-radius:8px;--glimmer-corner-radius:8px;--image-corner-radius:4px;--input-corner-radius:4px;--nav-list-cell-corner-radius:8px;--list-cell-corner-radius:8px;--list-cell-min-height:52px;--list-cell-padding-vertical:20px;--list-cell-padding-vertical-with-addon:14px;--nav-list-cell-min-height:0px;--nav-list-cell-padding-vertical:16px;--nav-list-cell-padding-vertical-with-addon:16px;--text-input-multi-padding-between-text-scrollbar:20px;--text-input-multi-padding-scrollbar:16px;--toast-corner-radius:4px;--text-input-caption-margin-top:10px;--text-input-label-top:22px;--text-input-min-height:64px;--text-input-padding-vertical:12px;--fds-animation-enter-exit-in:cubic-bezier(0.14, 1, 0.34, 1);--fds-animation-enter-exit-out:cubic-bezier(0.45, 0.1, 0.2, 1);--fds-animation-swap-shuffle-in:cubic-bezier(0.14, 1, 0.34, 1);--fds-animation-swap-shuffle-out:cubic-bezier(0.45, 0.1, 0.2, 1);--fds-animation-move-in:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-move-out:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-expand-collapse-in:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-expand-collapse-out:cubic-bezier(0.17, 0.17, 0, 1);--fds-animation-passive-move-in:cubic-bezier(0.5, 0, 0.1, 1);--fds-animation-passive-move-out:cubic-bezier(0.5, 0, 0.1, 1);--fds-animation-quick-move-in:cubic-bezier(0.1, 0.9, 0.2, 1);--fds-animation-quick-move-out:cubic-bezier(0.1, 0.9, 0.2, 1);--fds-animation-fade-in:cubic-bezier(0, 0, 1, 1);--fds-animation-fade-out:cubic-bezier(0, 0, 1, 1);--fds-duration-extra-extra-short-in:100ms;--fds-duration-extra-extra-short-out:100ms;--fds-duration-extra-short-in:200ms;--fds-duration-extra-short-out:150ms;--fds-duration-short-in:280ms;--fds-duration-short-out:200ms;--fds-duration-medium-in:400ms;--fds-duration-medium-out:350ms;--fds-duration-long-in:500ms;--fds-duration-long-out:350ms;--fds-duration-extra-long-in:1000ms;--fds-duration-extra-long-out:1000ms;--fds-duration-none:0ms;--fds-fast:200ms;--fds-slow:400ms;--font-family-apple:system-ui, -apple-system, BlinkMacSystemFont, '.SFNSText-Regular', sans-serif;--font-family-code:ui-monospace, Menlo, Consolas, Monaco, monospace;--font-family-default:Helvetica, Arial, sans-serif;--font-family-segoe:Segoe UI Historic, Segoe UI, Helvetica, Arial, sans-serif;--body-font-family:Placeholder Font;--body-font-size:0.9375rem;--body-font-weight:400;--body-line-height:1.3333;--body-emphasized-font-family:Placeholder Font;--body-emphasized-font-size:0.9375rem;--body-emphasized-font-weight:600;--body-emphasized-line-height:1.3333;--headline1-font-family:Optimistic Display Bold, system-ui, sans-serif;--headline1-font-size:1.75rem;--headline1-font-weight:700;--headline1-line-height:1.2143;--headline2-font-family:Optimistic Display Bold, system-ui, sans-serif;--headline2-font-size:1.5rem;--headline2-font-weight:700;--headline2-line-height:1.25;--headline3-font-family:Optimistic Display Bold, system-ui, sans-serif;--headline3-font-size:1.0625rem;--headline3-font-weight:700;--headline3-line-height:1.2941;--meta-font-family:Placeholder Font;--meta-font-size:0.8125rem;--meta-font-weight:400;--meta-line-height:1.3846;--meta-emphasized-font-family:Placeholder Font;--meta-emphasized-font-size:0.8125rem;--meta-emphasized-font-weight:600;--meta-emphasized-line-height:1.3846;--primary-label-font-family:Optimistic Display Medium, system-ui, sans-serif;--primary-label-font-size:1.0625rem;--primary-label-font-weight:500;--primary-label-line-height:1.2941;--secondary-label-font-family:Placeholder Font;--secondary-label-font-size:0.9375rem;--secondary-label-font-weight:500;--secondary-label-line-height:1.3333;--text-input-field-font-family:Placeholder Font;--text-input-field-font-size:1rem;--text-input-field-font-weight:500;--text-input-field-line-height:1.2941;--text-input-label-font-family:Placeholder Font;--text-input-label-font-size:17px;--text-input-label-font-size-scale-multiplier:0.75;--text-input-label-font-weight:400;--text-input-label-line-height:1.2941;--dataviz-primary-2:rgb(134,218,255);--dataviz-primary-3:rgb(95,170,255);--dataviz-secondary-1:rgb(129,77,231);--dataviz-secondary-2:rgb(168,124,255);--dataviz-secondary-3:rgb(219,26,139);--dataviz-supplementary-1:rgb(255,122,105);--dataviz-supplementary-2:rgb(241,168,23);--dataviz-supplementary-3:rgb(49,162,76);--dataviz-supplementary-4:rgb(228,230,235);--base-unit:4px;--blue-0:#f5fbff;--blue-2:#b3dbff;--blue-4:#47afff;--blue-5:#0095f6;--blue-6:#0074cc;--blue-7:#0057a3;--blue-8:#00376b;--blue-9:#002952;--breakpoint-medium-width:1536px;--breakpoint-small-width:1024px;--challenge-width:460px;--clr-separator:#efefef;--clr_red_dark_30:#af2634;--cluster-card-border-radius:8px;--creation-composer-height:81px;--creation-header-composer-height:126px;--creation-header-height:43px;--creation-min-padding-x:32px;--creation-modal-max-height:898px;--creation-modal-min-height:391px;--creation-padding-x:64px;--creation-padding-y:112px;--creation-settings-width:340px;--cyan-5:#27c4f5;--desktop-center-feed-min-width-breakpoint:1500px;--desktop-cluster-card-height:89px;--desktop-cluster-card-width:140px;--desktop-collapsed-nav-height:52px;--desktop-grid-item-margin:28px;--desktop-in-feed-story-item-height:208px;--desktop-in-feed-story-item-width:116px;--desktop-large-modal-max-height:781px;--desktop-large-modal-max-width:1491px;--desktop-large-modal-min-height:664px;--desktop-large-modal-min-width:908px;--desktop-nav-anim-duration:0.2s;--desktop-nav-height:60px;--desktop-nav-search-box-large-width:268px;--desktop-nav-search-box-width:215px;--desktop-regular-nav-height:77px;--desktop-skinny-nav-height:60px;--direct-attachment-image-grid-border-size:1px;--direct-attachment-image-grid-item-size:78px;--direct-attachment-image-grid-width:236px;--direct-attachment-story-height:150px;--direct-attachment-story-large-height:256px;--direct-attachment-story-large-width:164px;--direct-attachment-story-width:84px;--direct-message-margin:8px;--direct-message-max-width:236px;--extra-small-screen-max:413px;--fb-connect-blue:#4f67b0;--fb-signup-page-profile-pic-size:88px;--feed-sidebar-padding:32px;--feed-sidebar-width:319px;--feed-polaris-padding-small:32px;--feed-polaris-padding-med:70px;--feed-polaris-padding-large:96px;--feed-polaris-sidebar-width:268px;--feed-width-wide:614px;--feed-with-padding-threshold-min:640px;--font-family-system:-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;--font-weight-system-bold:700;--font-weight-system-extra-bold:800;--font-weight-system-extra-light:200;--font-weight-system-light:300;--font-weight-system-medium:500;--font-weight-system-regular:400;--font-weight-system-semibold:600;--gradient-lavender:#d300c5;--gradient-orange:#ff7a00;--gradient-pink:#ff0169;--gradient-purple:#7638fa;--gradient-yellow:#ffd600;--green-4:#78de45;--green-5:#58c322;--green-6:#37a600;--grey-0:#f5f5f5;--grey-1:#efefef;--grey-2:#dbdbdb;--grey-4:#a8a8a8;--grey-5:#8e8e8e;--grey-6:#737373;--grey-8:#363636;--grey-9:#262626;--grid-column-width-modal:6.25%;--grid-column-width:5.555555555555555%;--hscc-collapse-transition-duration:0.3s;--ig-badge:255, 48, 64;--ig-close-friends-refreshed:28, 209, 79;--ig-disabled-action-text:169, 219, 255;--ig-error-or-destructive:237, 73, 86;--ig-facebook-blue:53, 121, 234;--ig-full-screen-background:54, 54, 54;--ig-live-badge:255, 1, 105;--ig-primary-button:0, 149, 246;--ig-primary-button-hover:24, 119, 242;--ig-secondary-button-background:239, 239, 239;--ig-secondary-button-hover:219, 219, 219;--ig-secondary-button-focused:224, 241, 255;--ig-tertiary-button-background:255, 255, 255;--ig-tertiary-button-border:219, 219, 219;--ig-tertiary-button-hover:245, 245, 245;--ig-tertiary-button-text:38, 38, 38;--ig-subscribers-only:118, 56, 250;--ig-success:88, 195, 34;--ig-text-on-color:255, 255, 255;--ig-text-on-media:255, 255, 255;--igui-border-radius:3px;--in-feed-story-item-height:240px;--in-feed-story-item-width:135px;--input-border-radius:6px;--large-layout-min:1500px;--large-screen-min:876px;--like-animation-duration:1000ms;--live-video-border-radius:4px;--live-video-right-col-width:336px;--media-content-card-width:350px;--media-content-card-width-small:300px;--media-info:335px;--medium-layout-max:1499px;--medium-layout-min:1080px;--medium-screen-max:875px;--medium-screen-min:736px;--mobile-cluster-card-height:74px;--mobile-cluster-card-width:108px;--mobile-grid-item-margin:2px;--mobile-nav-height:45px;--modal-backdrop-dark:rgba(0, 0, 0, 0.85);--modal-backdrop-default:rgba(0, 0, 0, 0.65);--modal-border-radius:12px;--modal-padding:16px;--modal-z-index:100;--nav-narrow-width:72px;--nav-medium-width:244px;--nav-wide-width:335px;--nav-narrow-screen-min:768px;--nav-medium-screen-min:1264px;--nav-wide-screen-min:1920px;--orange-5:#fd8d32;--photo:600px;--pink-5:#d10869;--post-modal-large-screen-min:1536px;--post-modal-small-screen-max:1366px;--post-step-indicator:168, 168, 168;--purple-5:#a307ba;--red-4:#ff6874;--red-5:#ed4956;--red-6:#c62330;--red-7:#a70311;--reels-large-screen-min:1366px;--refinement-section-height:50px;--revamp-nav-bottom-toolbar-height:50px;--revamp-feed-card-max-height:758px;--revamp-feed-card-min-height:615px;--revamp-feed-card-min-width:661px;--revamp-feed-card-details-section-width:314px;--revamp-feed-horizontal-padding-small-screen:32px;--revamp-feed-horizontal-padding-large-screen:60px;--revamp-feed-vertical-padding:32px;--right-rail-width:300px;--scrollable-content-header-height-large:56px;--scrollable-content-header-height-med:49px;--scrollable-content-header-height:44px;--search-box-height:40px;--search-modal-height-expanded:450px;--search-modal-height:362px;--search-modal-top-offset:12px;--search-result-height:50px;--search-result-inline-top-offset:60px;--search-result-list-width:375px;--site-padding-top:30px;--site-width-narrow:600px;--site-width-wide:935px;--small-layout-max:1079px;--small-layout-min:800px;--small-screen-max:735px;--small-screen-min:414px;--story-cube-shading-duration:200ms;--story-desktop-margin-bottom:26px;--story-desktop-margin-top:82px;--story-gallery-preview-scale-correction:2.5;--story-progressbar-update-tick:0.1s;--story-swap-animation-duration:350ms;--system-10-font-size:10px;--system-10-line-height:12px;--system-11-font-size:11px;--system-11-line-height:13px;--system-12-font-size:12px;--system-12-line-height:16px;--system-14-font-size:14px;--system-14-line-height:18px;--system-16-font-size:16px;--system-16-line-height:24px;--system-18-font-size:18px;--system-18-line-height:24px;--system-20-font-size:20px;--system-20-line-height:25px;--system-22-font-size:22px;--system-22-line-height:26px;--system-24-font-size:24px;--system-24-line-height:27px;--system-26-font-size:26px;--system-26-line-height:28px;--system-28-font-size:28px;--system-28-line-height:32px;--system-30-font-size:30px;--system-30-line-height:36px;--system-32-font-size:32px;--system-32-line-height:40px;--web-always-black:0, 0, 0;--web-always-white:255, 255, 255;--web-overlay-on-media:38, 38, 38;--web-secondary-action:224, 241, 255;--yellow-5:#fdcb5c;--challenge-link:219,219,219;--docpen-lightgrey:38,38,38;--ig-banner-background:38,38,38;--ig-elevated-background:38,38,38;--ig-elevated-separator:54,54,54;--ig-focus-stroke:85,85,85;--ig-highlight-background:38,38,38;--ig-link:224,241,255;--ig-primary-background:0,0,0;--ig-primary-text:250,250,250;--ig-secondary-background:18,18,18;--ig-secondary-button:250,250,250;--ig-secondary-text:168, 168, 168;--ig-separator:38,38,38;--ig-stroke:85,85,85;--ig-temporary-highlight:0,149,246;--ig-tertiary-text:115,115,115;--post-separator:38,38,38;--tos-box-shadow:255,255,255;}</style>





<link type="text/css" rel="stylesheet" href="https://static.cdninstagram.com/rsrc.php/v3/yW/l/0,cross/GRBLtORsLSv68D1ULvQ1ZXlWNJTd1nq3EyhmpWE7yj6sPrzZdOfaaOJGNIqRzhKKJ4G1MYIIw_sSJ.css?_nc_x=Ij3Wp8lg5Kz" data-bootloader-hash="d4wCzse" crossorigin="anonymous" data-p=":24,48,9,25,4,108,53" data-c="1" onload="" onerror="" />
<link type="text/css" rel="stylesheet" href="data:text/css; charset=utf-8,body._a3wf&#123;background:rgb(var(--ig-primary-background));color:rgb(var(--ig-primary-text));font-family:var(--font-family-system);font-size:var(--system-14-font-size);line-height:var(--system-14-line-height);margin:0;overflow-y:visible&#125;%23bootloader_Fm4crfp&#123;height:42px;&#125;.bootloader_Fm4crfp&#123;display:block!important;&#125;" data-bootloader-hash="Fm4crfp" data-p=":0" data-c="1" onload="" onerror="" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">    

<script type="text/javascript">
// 선택한 userid 저장용도임
var users = [];
function visibleUsers() {
	$('._aa2u > div._ab8m').remove();
	users.forEach(function(element) {
		$('._aa2u > input').before('<div class=" _ab8m  _ab8p _ab8w  _ab94 _ab99 _ab9h _ab9k _ab9p _abaj _aba_ _abbh _abbz  _ab9z _abcm" style="height: 26px;"><button class="_acan _acao _acas _aj1-" type="button"><div class="_aacl _aaco _aacu _aad0 _aad6">'
		+element+
		'</div></button><div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9p  _abb0 _abcm"><button class="_abl- _abm2" type="button"><div class="_abm0"><svg aria-label="물품 삭제" class="_ab6-" color="#0095f6" fill="#0095f6" height="12" role="img" viewBox="0 0 24 24" width="12"><polyline fill="none" points="20.643 3.357 12 12 3.353 20.647" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3"></polyline><line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="3" x1="20.649" x2="3.354" y1="20.649" y2="3.354"></line></svg></div></button></div></div>')
	})
	$('._ab8w > ._abl-._abm2').click(function (){
		console.log(this);
		var name = $(this).parent().parent().find('div._aacl').html()
		console.log(name);
		//먼져 users배열에 삭제해쥼,,,
		let idx = users.indexOf(name);
		users.splice(idx, 1);
		console.log('유저추가목록에서 제거완료 리스트에 있으면 체크 제거함.');
		
		//위에 찾음 배열에 userid 찾은거 삭제하고 체크표시도 풀어쥼....
		var tmp= $('div._abm4[role=button]').find('#f35c4a31fcb4da').find('div._aad6');
		
		for(i=0; i<tmp.length; i++) {
			console.log(tmp[i].innerHTML);
			if(tmp[i].innerHTML == name) {
				console.log('같은거발견 단숨에 지워줄게');
				name=tmp[i].innerHTML;
				//checked=$(tmp[i]).parent().parent();
				checked=$(tmp[i]).closest('._abm4').find('._abm0');
				console.log(checked);
				//let idx = users.indexOf(name);
        		//users.splice(idx, 1);
        		//console.log('유저추가목록에서 제거완료 체크도제거함.');
        		checked.html('');
        		checked.html(`<svg aria-label="선택 여부 변경" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
                        <circle cx="12.008" cy="12" fill="none" r="11.25" stroke="currentColor" stroke-linejoin="round" stroke-width="1.5"></circle>
	                    </svg>`);
        		console.log(users);
			}
		}
		visibleUsers();
	});
}

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/nav.jsp" />
    <script type="application/json" data-content-len="91" data-sjs>
    {
        "require": [
            ["injectQPLTagsServerJSIntoWindow", "injectQPLTagsServerJSIntoWindow", null, []]
        ]
    }
    </script>
    <div style="height: 100%; width: 100%;">
        <section class="x78zum5 xdt5ytf x1iyjqo2 x6ikm8r x5yr21d xh8yej3">
            <div class="xnz67gz x78zum5 xdt5ytf x1iyjqo2 x5yr21d xmz0i5r x1jbp7et">
                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _abcm" style="height: 100%; width: 100%;">
                    <div class="_aa5b">
                        <div class="_ab8j _ab8l _ab8w  _ab94 _ab99 _ab9h _ab9k _ab9o _ab9s _abcm" style="height: 100%; width: 100%; max-width: 935px;">
                            <div class="_aa5c">
                                <div class="_aa4j" style="position: static; z-index: inherit;" >
                                    <div class="_aa4k">
                                        <div class="_aa4m _aa4n"></div>
                                        <div class="_aa4o">
                                            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" style="width: 100%;"><button aria-label="계정 전환 - tjgyqo2" class="_acan _acao _acas" type="button" tabindex="0">
                                                    <div class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p _abcm" style="width: 100%;">
                                                        <div class="_abyj">
                                                            <div class="_aacl _aacp _aacw _aacx _aada _aade">tjgyqo2</div>
                                                        </div>
                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9y _aba8 _abcm"><span style="display: inline-block; transform: rotate(180deg);"><svg aria-label="아래쪽 V자형 아이콘" class="_ab6-" color="#262626" fill="#262626" height="20" role="img" viewBox="0 0 24 24" width="20">
                                                                    <path d="M21 17.502a.997.997 0 0 1-.707-.293L12 8.913l-8.293 8.296a1 1 0 1 1-1.414-1.414l9-9.004a1.03 1.03 0 0 1 1.414 0l9 9.004A1 1 0 0 1 21 17.502Z"></path>
                                                                </svg></span></div>
                                                    </div>
                                                </button></div>
                                        </div>
                                        <div class="_aa4m _aa4p"><a href="#ex1" rel="modal:open"><button class="_abl- _abm2" type="button">
                                                <div class="_abm0"><svg aria-label="새로운 메시지" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
                                                        <path d="M12.202 3.203H5.25a3 3 0 0 0-3 3V18.75a3 3 0 0 0 3 3h12.547a3 3 0 0 0 3-3v-6.952" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                                                        <path d="M10.002 17.226H6.774v-3.228L18.607 2.165a1.417 1.417 0 0 1 2.004 0l1.224 1.225a1.417 1.417 0 0 1 0 2.004Z" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                                                        <line fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" x1="16.848" x2="20.076" y1="3.924" y2="7.153"></line>
                                                    </svg></div>
                                            </button></a></div>
                                    </div>
                                </div>
                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _ab9s _abcm" style="height: 100%;">
                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _abcm" style="height: 100%;">
                                        <div class="_abyl">
                                            <div class="_abyk" style="height: 100%; overflow: hidden auto;">
                                                <div style="position: relative; display: flex; flex-direction: column; padding-bottom: 0px; padding-top: 0px;">
                                                	
                                                    <div class=" _ab8s _ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm">
                                                        <div class="_abm4"><a class="x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz _a6hd" href="/direct/t/340282366841710300949128196905805855503" role="link" tabindex="0">
                                                                <div aria-labelledby="f31ad56cacbb6a4 f3baa4da491f23 f2889a7ac87d5a f3c41205ec58798" class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p  _ab9_ _aba8 _abcm">
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbj _abcm">
                                                                        <div class="_ab8w  _ab94 _ab96 _ab9g _ab9k _ab9p _abcm"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 56px; height: 56px;"><img alt="tjgyqo2님의 프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span></div>
                                                                    </div>
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9o _abcm">
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" id="f3baa4da491f23">
                                                                            <div class="_aacl _aaco _aacu _aacx _aada">
                                                                                <div class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p _abcm">
                                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9q _ab9s _abcm">
                                                                                        <div class="_aacl _aaco _aacu _aacx _aada">서상원</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb- _abcm" id="f2889a7ac87d5a">
                                                                            <div class="_aacl _aaco _aacu _aacy _aada">
                                                                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9k _ab9p _abcm"><span class="_ab6a"><span class="_aacl _aaco _aacu _aacy _aad7">ㅁㄴㅇㄹㄴㅁㅇㄹㄴ</span></span><span class="_ab68 _ac6e _ac6f _ac6h">·</span><time class="_ab69" datetime="2022-10-28T07:58:51.863Z" title="10월 28, 2022">5주</time></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a></div>
                                                    </div>
                                                    <!-- 챗방 추가 -->
                                                    <div class=" _ab8s _ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm">
                                                        <div class="_abm4"><a class="x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz _a6hd" href="/direct/t/340282366841710300949128196905805855503" role="link" tabindex="0">
                                                                <div aria-labelledby="f31ad56cacbb6a4 f3baa4da491f23 f2889a7ac87d5a f3c41205ec58798" class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p  _ab9_ _aba8 _abcm">
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbj _abcm">
                                                                        <div class="_ab8w  _ab94 _ab96 _ab9g _ab9k _ab9p _abcm"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 56px; height: 56px;"><img alt="tjgyqo2님의 프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span></div>
                                                                    </div>
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9o _abcm">
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" id="f3baa4da491f23">
                                                                            <div class="_aacl _aaco _aacu _aacx _aada">
                                                                                <div class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p _abcm">
                                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9q _ab9s _abcm">
                                                                                        <div class="_aacl _aaco _aacu _aacx _aada">서상원</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb- _abcm" id="f2889a7ac87d5a">
                                                                            <div class="_aacl _aaco _aacu _aacy _aada">
                                                                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9k _ab9p _abcm"><span class="_ab6a"><span class="_aacl _aaco _aacu _aacy _aad7">ㅁㄴㅇㄹㄴㅁㅇㄹㄴ</span></span><span class="_ab68 _ac6e _ac6f _ac6h">·</span><time class="_ab69" datetime="2022-10-28T07:58:51.863Z" title="10월 28, 2022">5주</time></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a></div>
                                                    </div>
                                                    <!-- 챗방 추가 -->
                                                    <div class=" _ab8s _ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm">
                                                        <div class="_abm4"><a class="x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz _a6hd" href="/direct/t/340282366841710300949128196905805855503" role="link" tabindex="0">
                                                                <div aria-labelledby="f31ad56cacbb6a4 f3baa4da491f23 f2889a7ac87d5a f3c41205ec58798" class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p  _ab9_ _aba8 _abcm">
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbj _abcm">
                                                                        <div class="_ab8w  _ab94 _ab96 _ab9g _ab9k _ab9p _abcm"><span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 56px; height: 56px;"><img alt="tjgyqo2님의 프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span></div>
                                                                    </div>
                                                                    <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9o _abcm">
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" id="f3baa4da491f23">
                                                                            <div class="_aacl _aaco _aacu _aacx _aada">
                                                                                <div class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p _abcm">
                                                                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9q _ab9s _abcm">
                                                                                        <div class="_aacl _aaco _aacu _aacx _aada">서상원</div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb- _abcm" id="f2889a7ac87d5a">
                                                                            <div class="_aacl _aaco _aacu _aacy _aada">
                                                                                <div class="_ab8w  _ab94 _ab99 _ab9f _ab9k _ab9p _abcm"><span class="_ab6a"><span class="_aacl _aaco _aacu _aacy _aad7">ㅁㄴㅇㄹㄴㅁㅇㄹㄴ</span></span><span class="_ab68 _ac6e _ac6f _ac6h">·</span><time class="_ab69" datetime="2022-10-28T07:58:51.863Z" title="10월 28, 2022">5주</time></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </a></div>
                                                    </div>

                                                    <div class="_ab8w  _ab94 _ab97 _ab9h _ab9m _ab9p  _aba8 _abcm" style="height: 72px;"></div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" _ab8s _ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _abcm" style="height: auto;">
                                <div class="_ab8w  _ab94 _ab97 _ab9h _ab9m _ab9p  _aba0 _abac _abcm" style="height: 100%; width: 100%;"><svg aria-label="Direct" class="_ab6-" color="#262626" fill="#262626" height="96" role="img" viewBox="0 0 96 96" width="96">
                                        <circle cx="48" cy="48" fill="none" r="47" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></circle>
                                        <line fill="none" stroke="currentColor" stroke-linejoin="round" stroke-width="2" x1="69.286" x2="41.447" y1="33.21" y2="48.804"></line>
                                        <polygon fill="none" points="47.254 73.123 71.376 31.998 24.546 32.002 41.448 48.805 47.254 73.123" stroke="currentColor" stroke-linejoin="round" stroke-width="2"></polygon>
                                    </svg>
                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abc0 _abcm">
                                        <h2 class="_aacl _aacr _aact _aacx _aad6 _aadb">내 메시지</h2>
                                    </div>
                                    <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abc0 _abcm">
                                        <div class="_aacl _aaco _aacu _aacy _aad6 _aadb">친구나 그룹에 비공개 사진과 메시지를 보내보세요.</div>
                                    </div>
                                    <!-- Modal HTML embedded directly into document -->
									<div id="ex1" class="modal" style="max-width: 440px;" >
										<div 
											class="x7r02ix xf1ldfh x131esax xdajt7p xxfnqb6 xb88tzc xw2csxc x1odjw0f x5fp0pe x5yr21d"
											role="dialog" style="overflow: hidden;">
											<div
												style="display: flex; flex-direction: column; height: 100%; max-width: 100%;">
												<div class="x1qjc9v5 x78zum5 xdt5ytf">
													<div class="_ac76">
														<div
															class="_ab8w  _ab94 _ab97 _ab9h _ab9m _ab9p  _abch _abcm"
															style="height: 100%; width: 100%;">
															<h1 class="_ac78" tabindex="-1"
																style="width: calc(100% - 0px);">
																<div class="_ac7a">새로운 메시지</div>
															</h1>
														</div>
														<div class="_ac7b _ac7c">
															<div
																class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9- _abcm">
																
															</div>
														</div>
														<div class="_ac7b _ac7d">
															<div
																class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9- _abcm">
																<button class="_acan _acao _acas _acav" disabled=""
																	type="button">
																	<div class="_aagz">다음</div>
																</button>
															</div>
														</div>
													</div>
												</div>
												<div
													class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o _ab9s _abcm">
													<div class="_aag-">
														<div class="_aa2s">
															<div
																class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _ab9z _aba7 _abcm">
																<h4 class="_aacl _aacp _aacw _aacx _aad8 _aade">받는사람:</h4>
															</div>
															<div class=" _aa2u">
																
																<input autocomplete="off" id="memberSearch"
																	class="_aaie _aaif _aaid _ag7n" name="queryBox"
																	placeholder="검색..." spellcheck="false" type="text"
																	value="" data-focus-visible-added>
																<div></div>
															</div>
														</div>
													</div>
													<div id="memberList"
														class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9o  _ab9v _abcm" style="height: 450px">
														
													</div>
												</div>
											</div>
										</div>
									</div>
									
                                    <div class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p  _abc2 _abcm">
                                    
                                        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _ab9x _aba7 _abcm"><a href="#ex1" rel="modal:open"><button class="_acan _acap _acas" onclick="toggleDialog('show')" type="button" tabindex="0">메시지 보내기</button></a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
<script type="text/javascript">
function toggleDialog(sh) {
    dialog = document.getElementById("ex1");
    //okbutton = document.getElementById("ok");
    pagebackground = document.getElementById("bg");

    if (sh == "show") {
        dialogOpen = true;

        // 다이얼로그 표시
        dialog.style.display = 'block';

        // 다이얼로그 표시 이후, 그 안의 요소에 포커스하기
        okbutton.focus();

        // "숨겨질" 콘텐츠로에서 포커스가 나간 *후에* 배경을 숨깁니다.
        pagebackground.setAttribute("aria-hidden","true");

    } else {
        dialogOpen = false;
        dialog.style.display = 'none';
        pagebackground.setAttribute("aria-hidden","false");
        lastFocus.focus(); 
    }
}

</script>

<script type="text/javascript">
$(function (){
	$("#memberSearch").keyup(function(){
		if($('#memberSearch').val().length == 0) {
			return false;
		}
		$.ajax({
		    url: "/foodstagram/chat/getMembers.do", // 호출할 주소
		    type: "post",
		    data: { keyword: $('#memberSearch').val() }, // 넘길 데이터
		    dataType: "json", // 데이터 타입 json으로 설정 <- 이걸 안하면 밑에 처럼 JSON.parse를 해야함
		    success: function(data) { // 결과 받기
		        //data = JSON.parse(data); // JSON 형태로 파싱
		        console.log(data);
		        $('#memberList').html(" ") //비우기
		        if( data.length > 0) {
			        for(i=0; i< data.length; i++) {
			        	//$('#memberList').append(
			        	var str=`<div class="_abm4" aria-disabled="false" role="button" tabindex="0" style="cursor: pointer;">
			        		    <div aria-labelledby="f22a28fc103805c f35c4a31fcb4da f12ffed1465434 f10dca3efcffcf8" class="_ab8w  _ab94 _ab97 _ab9f _ab9k _ab9p  _ab9- _aba8 _abcm">
			        	        <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abbj _abcm">
			        	            <span class="xnz67gz x14yjl9h xudhj91 x18nykt9 xww2gxu x9f619 x1lliihq x2lah0s x6ikm8r x10wlt62 x1n2onr6 x1ykvv32 xougopr x159fomc xnp5s1o x194ut8o x1vzenxt xd7ygy7 xt298gk x1xrz1ek x1s928wv x162n7g1 x2q1x1w x1j6awrg x1n449xj x1m1drc7" role="link" tabindex="-1" style="width: 44px; height: 44px;"><img alt="프로필 사진" class="x6umtig x1b1mbwd xaqea5y xav7gou xk390pu x5yr21d xpdipgo xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x11njtxf xh8yej3" crossorigin="anonymous" draggable="false" src="/foodstagram/resources/images/userImage.jpg"></span>
			        	        </div>
			        	        <div class="_ab8w  _ab94 _ab99 _ab9h _ab9m _ab9o _abcm">
			        	            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p _abcm" id="f35c4a31fcb4da">
			        	                <div class="_aacl _aaco _aacu _aacx _aada">
			        	                    <div class="_aacl _aaco _aacw _aacx _aad6">`+data[i].userid+`</div>
			        	                </div>
			        	            </div>
			        	            <div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abb- _abcm" id="f12ffed1465434">
			        	                <div class="_aacl _aaco _aacu _aacy _aada">`+data[i].username+`</div>
			        	            </div>
			        	        </div>
			        	        <div class="_ab8w  _ab94 _ab97 _ab9h _ab9k _ab9p  _abb0 _abcm" id="f22a28fc103805c">
			        	            <button class="_abl-" type="button">
			        	                <div class="_abm0">`;
			        	if(!users.includes(data[i].userid)){
			        		console.log('없음');
				        	str+=`<svg aria-label="선택 여부 변경" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
				        	                        <circle cx="12.008" cy="12" fill="none" r="11.25" stroke="currentColor" stroke-linejoin="round" stroke-width="1.5"></circle>
				        	                    </svg>
				        	                </div>
				        	            </button>
				        	        </div>
				        	    </div>
				        	</div>`;
			        	} else {
			        		console.log('존재함 체크표시해줌');
			        		str+=`<svg aria-label="선택 여부 변경" class="_ab6-" color="#0095f6" fill="#0095f6" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M12.001.504a11.5 11.5 0 1 0 11.5 11.5 11.513 11.513 0 0 0-11.5-11.5Zm5.706 9.21-6.5 6.495a1 1 0 0 1-1.414-.001l-3.5-3.503a1 1 0 1 1 1.414-1.414l2.794 2.796L16.293 8.3a1 1 0 0 1 1.414 1.415Z"></path></svg>
					        				</div>
				        	            </button>
				        	        </div>
				        	    </div>
				        	</div>`;
			        	}
			        	$('#memberList').append(str);
			        }
			        $('div._abm4[role=button]').click(function userClick() {
			        	console.log(this);
			        	var name = $(this).find('._aad6').html();
			        	var checked = $(this).find('._abm0');
			        	if ( !users.includes(name) ) {//없으면
			        		console.log(name);
			        		users[users.length] = name;
			        		console.log(users);
			        		checked.html('<svg aria-label="선택 여부 변경" class="_ab6-" color="#0095f6" fill="#0095f6" height="24" role="img" viewBox="0 0 24 24" width="24"><path d="M12.001.504a11.5 11.5 0 1 0 11.5 11.5 11.513 11.513 0 0 0-11.5-11.5Zm5.706 9.21-6.5 6.495a1 1 0 0 1-1.414-.001l-3.5-3.503a1 1 0 1 1 1.414-1.414l2.794 2.796L16.293 8.3a1 1 0 0 1 1.414 1.415Z"></path></svg>');
			        	} else {
			        		console.log('존재함 제거진행');
			        		let idx = users.indexOf(name);
			        		users.splice(idx, 1);
			        		console.log('유저추가목록에서 제거완료 체크도제거함.');
			        		checked.html(`<svg aria-label="선택 여부 변경" class="_ab6-" color="#262626" fill="#262626" height="24" role="img" viewBox="0 0 24 24" width="24">
        	                        <circle cx="12.008" cy="12" fill="none" r="11.25" stroke="currentColor" stroke-linejoin="round" stroke-width="1.5"></circle>
	        	                    </svg>`);
			        		console.log(users);
			        	}
			        	
			        	//참여자목록 보여주기
			        	visibleUsers();
			        })
		        }
		        else {
		        	$('#memberList').append(`<div class="_ab8w  _ab94 _ab99 _ab9f _ab9m _ab9p  _abam _abb2 _abbk _abc0 _abcm"><div class="_aacl _aaco _aacu _aacy _aad6">계정을 찾을 수 없습니다.</div></div>`);
		        }
		    }
		});
	});
	
});	
</script>
<script type="text/javascript">



$(function (){
	$('div._abm4[role=button]').click(function() {
		console.log(this);
	})

});
</script>
<form id="form1" action="">

</form>
</html>