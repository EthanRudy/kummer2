import org.masonacm.actorwars.LocationFinder;
import org.masonacm.actorwars.Peon;
import org.masonacm.actorwars.Wheat;

import com.gawdl3y.util.DynamicValue;

import info.gridworld.grid.Location;

public class ToreyPeon extends Peon {

	@Override
	public void peonAct() {
		if (myactions.size() == 0) {
			DynamicValue<Location> l = LocationFinder
					.findClosestInstanceDynamicLocation(getDynamicLocation(), Wheat.class, getGrid());
			if (l.getValue() != null) {
				add(Peon.moveToGradual(l));
			}		
		}
	}

}
