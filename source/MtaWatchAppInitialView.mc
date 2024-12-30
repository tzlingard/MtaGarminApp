import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System;
using Toybox.Communications;

class MtaWatchAppInitialView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() as Void {
        var view = View.findDrawableById("TestDisplay") as Text;
        view.setText("Click here to view the menu");
    }
}
