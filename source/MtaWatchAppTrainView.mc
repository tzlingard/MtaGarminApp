import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System;
using Toybox.Communications;

class MtaWatchAppTrainView extends WatchUi.View {

    var _selectedTrain as Symbol;
    var _trainData as Dictionary = {};

    function initialize(selectedTrain) {
        View.initialize();
        _selectedTrain = selectedTrain;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onUpdate(dc as Dc) as Void {
        var view = View.findDrawableById("TestDisplay") as Text;
        switch (_selectedTrain) {
            case :train_1:
                makeSubwayRequest("1");
                view.setText("Train data: " + _trainData);
                break;
            case :train_2:
                view.setText("Train name: 2");
                break;
            //TODO: Add more cases
        }
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    // function onShow() as Void {
    //     makeSubwayRequest("");
    // }

    // Update the view
    // function onUpdate(dc as Dc) as Void {
    //     // Call the parent onUpdate function to redraw the layout
    //     var view = View.findDrawableById("TestDisplay");
    //     if (view != null) {
    //         view.setText("Hello World");
    //     }
    //     makeSubwayRequest("");
    //     View.onUpdate(dc);
    // }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

   // set up the response callback function
   function onReceiveSubwayRequest(responseCode as Number, data as Dictionary or String or Null) as Void {
       if (responseCode == 200) {
           System.println("Request Successful");                   // print success
           _trainData = data;                                      // set _trainData to data
       }
       else {
           System.println("Response code: " + responseCode + ", data = " + data);            // print response code
       }
   }

   function makeSubwayRequest(trainLine) {
        System.println("Making request");                           // print making request
        //TODO: switch statement for specific train line data
       var url = "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-ace"; // set the url


       var responseCallback = method(:onReceiveSubwayRequest);     // set responseCallback to
                                                                   // onReceiveSubwayRequest() method
       // Make the Communications.makeWebRequest() call
       Communications.makeWebRequest(url, {}, {}, responseCallback);
  }
}

// Lang.Method(responseCode as Lang.Number, data as Lang.Dictionary or Lang.String or PersistedContent.Iterator or Null) as Void or Lang.Method(responseCode as Lang.Number, data as Lang.Dictionary or Lang.String or PersistedContent.Iterator or Null, context as Lang.Object) as Void) as Void
