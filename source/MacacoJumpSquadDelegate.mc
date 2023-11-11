import Toybox.Lang;
import Toybox.WatchUi;

class MacacoJumpSquadDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new MacacoJumpSquadMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}