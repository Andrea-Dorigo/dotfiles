
import System.IO
import System.Exit
import XMonad
import Data.Monoid
-- import System.Exit
import XMonad.Layout.Spacing
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
-- import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog
-- import XMonad.Actions.Volume
import XMonad.Util.EZConfig(additionalKeys, additionalKeysP)
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.ManageHelpers
import System.IO
import XMonad.Config.Desktop
import XMonad.Hooks.FadeInactive


import qualified XMonad.StackSet as W
import qualified Data.Map        as M

myWorkspaces    = ["1","2","3","4","5","6"]

myKeys  =
          [ ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +2%")
          , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@  -2%")
          , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
          , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
          , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
          , ("M-p", spawn "exe=`dmenu-recent-aliases`")
          , ("M-b", spawn "exe=`qutebrowser`")
          , ("M-a", spawn "exe=`atom`")
          , ("<Print>", spawn "exe=`escrotum -s -C`")
          ]

myLayout =
  spacingRaw False (Border 30 15 15 15) True (Border 15 15 15 15) True $ layoutHook def

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1.0

main = do
    xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobarrc "
    xmonad $ defaultConfig {
      terminal = "kitty"
    , workspaces = myWorkspaces
    , borderWidth = 1
    , layoutHook = myLayout
    , normalBorderColor = "#232831"
    , focusedBorderColor = "#82A2C3"
    , logHook = myLogHook <+> dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc x
                        , ppCurrent = xmobarColor "#ff5c57" ""  -- Current workspace in xmobar
                        , ppHidden = xmobarColor "#9aedfe" ""
                        , ppWsSep = " "
                        , ppHiddenNoWindows = xmobarColor "#9aedfe" ""
                        , ppOrder  = \(ws:l:t) -> [ws]
                        }
    } `additionalKeysP` myKeys
