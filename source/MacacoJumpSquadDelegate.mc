import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.ActivityRecording;
import Toybox.FitContributor;
import Toybox.Sensor;

class MacacoJumpSquadDelegate extends WatchUi.BehaviorDelegate {

     hidden var session;

    function initialize() {
        BehaviorDelegate.initialize();
        Sensor.setEnabledSensors( [Sensor.SENSOR_HEARTRATE] );
        Sensor.enableSensorEvents( method( :onSensor ) );
    }

    function onSensor(sensorInfo as Sensor.Info) as Void {
    System.println( "Heart Rate: " + sensorInfo.heartRate );
}

    function onSelect() as Boolean {
        if (session) {
            System.println("Save, Delete, Continue Menu");
            WatchUi.pushView(new Rez.Menus.MainMenu(), new MacacoJumpSquadMenuDelegate(self), WatchUi.SLIDE_UP);

        } else {
            self.startActivity();
        }

        return false; // Return false to allow the default action to also occur.
    }

    function startActivity() {
        // Code to transition to the activity data screen and start the activity
        System.println("Activity Started");

        // Create a session object
        session = ActivityRecording.createSession({          // set up recording session
                 :name=>"Kitesurf",                              // set session name
                 :sport=>Activity.SPORT_KITESURFING,                // set sport type
           });
           session.start();   

        // var options = {
        //     :period => 1,               // 1 second sample time
        //     :accelerometer => {
        //         :enabled => true,       // Enable the accelerometer
        //         :sampleRate => 25       // 25 samples
        //     }
        //     :heartBeatIntervals => {
        //         :enabled => true
        //     }
        // };

        // Sensor.registerSensorDataListener(method(:accelCallback), options);

        // Start recording the session
        session.start();

    //     var kitesurfView = new KitesurfView(); 
    //    WatchUi.pushView(kitesurfView, null, WatchUi.SLIDE_LEFT);
    }

    function resumeActivity() {
        if (session) {
            System.println("Session resuming");
        session.start();
        }
    }


    function stopActivity() {
        if (session) {
            System.println("Session stopped");
            session.stop();
        }
    }

    function saveActivity() {
        if (session) {
            System.println("Session saved");
            session.save();
        }
    }

    function discardActivity() {
        if (session) {
            System.println("Session discarded");
            session.discard();
        }
    }

}