{ pkgs, ... }:

{
    nixpkgs.overlays = [
    (final: prev: {
      sddm-sugar-theme = pkgs.stdenv.mkDerivation rec {
        pname = "sddm-sugar-candy-theme";
        version = "1.6";
        dontBuild = true;

        installPhase = ''
          mkdir -p $out/share/sddm/themes/sugar-candy

          cp ${pkgs.writeText "$out/share/sddm/themes/sugar-candy/theme.conf" ''

[General]

Background="${
        (pkgs.fetchFromGitHub {
          owner = "NixieQueen";
          repo = "awesomeWM-setup";
          rev = "177425c9904f5cf7b714a8eb8d03f8b943d44ada";
          sha256 = "8U3J9N/fYviIdZYKmoNsHppo3blc7eEBtZFJ3zRZxWM=";
        })}/themes/nixie-theme/backgrounds/MountainDragon.png"
DimBackgroundImage="0.0"
ScaleImageCropped="true"
ScreenWidth="1440"
ScreenHeight="900"
FullBlur="false"
PartialBlur="true"
BlurRadius="100"
HaveFormBackground="false"
FormPosition="left"
BackgroundImageHAlignment="center"
BackgroundImageVAlignment="center"
MainColor="white"
AccentColor="#f4b8e4"
BackgroundColor="#444"
OverrideLoginButtonTextColor=""
InterfaceShadowSize="6"
InterfaceShadowOpacity="0.6"
RoundCorners="20"
ScreenPadding="0"
Font="Noto Sans"
FontSize=""
ForceRightToLeft="false"
ForceLastUser="true"
ForcePasswordFocus="true"
ForceHideCompletePassword="false"
ForceHideVirtualKeyboardButton="false"
ForceHideSystemButtons="false"
AllowEmptyPassword="false"
AllowBadUsernames="false"
Locale=""
HourFormat="HH:mm"
DateFormat="dddd, d of MMMM"
HeaderText="Greetings nya~!"
TranslatePlaceholderUsername=""
TranslatePlaceholderPassword=""
TranslateShowPassword=""
TranslateLogin=""
TranslateLoginFailedWarning=""
TranslateCapslockWarning=""
TranslateSession=""
TranslateSuspend=""
TranslateHibernate=""
TranslateReboot=""
TranslateShutdown=""
TranslateVirtualKeyboardButton=""

              ''} $out/share/sddm/themes/sugar-candy/theme.conf
          cp -Rn $src/* $out/share/sddm/themes/sugar-candy/
        '';

        nativeBuildInputs = with pkgs.libsForQt5.qt5; [
          wrapQtAppsHook
        ];

        propagatedUserEnvPkgs = with pkgs.libsForQt5.qt5; [
          qtbase
          qtsvg
          qtgraphicaleffects
          qtquickcontrols2
          qtquick3d
        ];

        src = pkgs.fetchFromGitHub {
          owner = "Kangie";
          repo = "sddm-sugar-candy";
          rev = "v1.6";
          sha256 = "sha256-p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
        };
      };
    })
  ];
}

#cp ${pkgs.writeText "$out/share/sddm/themes/sugar-candy/theme.conf" ''
#[General]
#
#Background="${
#        (pkgs.fetchFromGitHub {
#          owner = "NixieQueen";
#          repo = "awesomeWM-setup";
#          rev = "177425c9904f5cf7b714a8eb8d03f8b943d44ada";
#          sha256 = "8U3J9N/fYviIdZYKmoNsHppo3blc7eEBtZFJ3zRZxWM=";
#        })}/themes/nixie-theme/backgrounds/MountainDragon.png"
#          ''} $out/share/sddm/themes/sugar-candy/theme.conf
