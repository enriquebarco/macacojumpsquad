import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang;
import Toybox.Time;
import Toybox.Timer;
import Toybox.ActivityMonitor;

class KitesurfView extends WatchUi.View {

    private var _heartRateElement;
    private var _distanceElement;
    private var _jumpElement;
    private var _timeElement;

   private var _timer as Timer.Timer;


    function initialize() {
        View.initialize();
        _timer = new Timer.Timer();
    }

    function onShow() as Void {
        _timer.start(method(:onTimer), 1000, true);
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.KitesurfLayout(dc));
        _heartRateElement = findDrawableById("heart_rate");
        _distanceElement = findDrawableById("distance");
        _jumpElement = findDrawableById("highest_jump");
        _timeElement = findDrawableById("time");

    updateDistanceValue(20);
    }


    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        var info = ActivityMonitor.getInfo();

        var distance = info.distance;
        System.println(distance);
        updateDistanceValue(distance);
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        _timer.stop();
    }

    function onTimer() as Void {
        //Kick the display update
        // Update the time element with the current time
        var currentTime = System.getClockTime();
        // var timeString = Time.format(currentTime, "h:mm"); // Use "h:mm a" for AM/PM format
        // _timeElement.setText(timeString);
        var time = currentTime.hour.format("%d")+":"+currentTime.min.format("%02d");
        _timeElement.setText(time);
        WatchUi.requestUpdate();
    }

    function updateDistanceValue(distance as Number) as Void {
        _distanceElement.setText(distance.toString());
        WatchUi.requestUpdate();
    }

}
