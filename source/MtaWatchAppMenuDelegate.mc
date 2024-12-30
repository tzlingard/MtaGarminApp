import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class MtaWatchAppMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) {
        if (item != :exit) {
            System.println("item 1");
            WatchUi.pushView(new MtaWatchAppTrainView(item), new MtaWatchAppMenuDelegate(), WatchUi.SLIDE_BLINK);
        } else {
            System.println("exit");
            WatchUi.popView(WatchUi.SLIDE_DOWN);
        }
    }

}