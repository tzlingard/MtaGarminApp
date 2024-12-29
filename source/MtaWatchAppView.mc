import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System;
using Toybox.Communications;

class MtaWatchAppView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        makeSubwayRequest("");
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        var view = View.findDrawableById("TestDisplay");
        makeSubwayRequest("");
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

       // set up the response callback function
   function onReceiveSubwayRequest(responseCode, data) {
       if (responseCode == 200) {
           System.println("Request Successful");                   // print success
       }
       else {
           System.println("Response: " + responseCode);            // print response code
       };
   };

   function makeSubwayRequest(trainLine) {
        System.println("Making request");                           // print making request
        //TODO: switch statement for specific train line data
       var url = "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-ace"; // set the url

       var options = {                                             // set the options
           :method => Communications.HTTP_REQUEST_METHOD_GET,      // set HTTP method
           :headers => {                                           // set headers
                   "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED},
                                                                   // set response type
           :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED
       };

       var responseCallback = method(:onReceiveSubwayRequest);     // set responseCallback to
                                                                   // onReceiveSubwayRequest() method
       // Make the Communications.makeWebRequest() call
       Communications.makeWebRequest(url, {}, options, responseCallback);
  }
}
