import Toybox.Lang;
import Toybox.WatchUi;

class MtaWatchAppInitialDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onTap(clickEvent) {
        System.println("Tapped");
        WatchUi.pushView(new Rez.Menus.MainMenu(), new MtaWatchAppMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}