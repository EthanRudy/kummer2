import java.util.ArrayList;

import info.gridworld.actor.Actor;
import info.gridworld.actor.Critter;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Location;


public class Swartz extends Critter{
	
	
	public Swartz(){
	}

	
	public void act(){
		processActors(getActors());
		
	}
	
	
	public void processActors(ArrayList<Actor> actors){
		for(int i=0; i<actors.size(); i++){
			if(!(actors.get(i) instanceof Swartz)){
				if(actors.get(i) instanceof Rock){
					getGrid().remove(actors.get(i).getLocation());
				}
				else{
					actors.get(i).removeSelfFromGrid();
				}
			}
		}
	}
	
	
	
	public String toString(){
		return null;
	}
}
