import Toybox.Lang;
import Toybox.WatchUi;


class MacacoJumpSquadDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }


    function onSelect() as Boolean {
       return WatchUi.pushView(new KitesurfView(), new KitesurfViewDelegate(), WatchUi.SLIDE_LEFT);

    }
}