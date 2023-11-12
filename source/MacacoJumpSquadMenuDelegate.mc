import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class MacacoJumpSquadMenuDelegate extends WatchUi.MenuInputDelegate {
    var parentDelegate as KitesurfViewDelegate;

    function initialize(parent as KitesurfViewDelegate) {
        parentDelegate = parent;
    }

    function onMenuItem(item as Symbol) as Void {
        switch (item) {
            case :resume:
                    System.println("Resuming activity...");
                    parentDelegate.resumeActivity();
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

