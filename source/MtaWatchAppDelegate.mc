import Toybox.Lang;
import Toybox.WatchUi;

class MtaWatchAppDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new MtaWatchAppMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}