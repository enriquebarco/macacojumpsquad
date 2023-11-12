import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class MacacoJumpSquadMenuDelegate extends WatchUi.MenuInputDelegate {
    var parentDelegate as MacacoJumpSquadDelegate;

    function initialize(parent as MacacoJumpSquadDelegate) {
        parentDelegate = parent;
    }

    function onMenuItem(item as Symbol) as Void {
        switch (item) {
            case :resume:
                    System.println("Resuming activity...");
                    parentDelegate.startActivity();
                break;
            case :save:
                    System.println("Saving activity...");
                    parentDelegate.saveActivity();
                break;
            case :discard:
                    System.println("Discarding activity...");
                    parentDelegate.discardActivity();
                break;
        }
    }
}

