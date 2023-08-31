
import java.awt.Color;
import java.util.ArrayList;

import info.gridworld.actor.*;
import info.gridworld.grid.Location;
/**
 * A <code>BoxBug</code> traces out a square "box" of a given size. <br />
 * The implementation of this class is testable on the AP CS A and AB exams.
 */
public class Herp_A_Derp extends Bug
{
    private int steps;
    private int sideLength;
    Herp_A_Derp tempbug;
    public boolean fertile=true;
	public static int MinAge=5;
	ArrayList<Location> joe;
	private int colorpick;
	private int gender = (int)(Math.random()*10);
	public int totalsteps=0;
	public int getDist(Location loc) {
		Location myloc = getLocation();
		int x1, y1, x2, y2;
		x1=myloc.getCol();
		y1=myloc.getRow();
		x2=loc.getCol();
		y2=loc.getRow();
		double dist=((y2-y1)^2) +((x2-x1)^2);
		dist=Math.sqrt(dist);
		if (y2==y1)
			dist=Math.abs(x2-x1);
		else if (x2==x1)
			dist=Math.abs(y2-y1);
		if ((int)dist==0) {

			return 1;
		}
		else {

			return (int)dist;
		}
	}
	public void setTotalSteps(int s) {
		totalsteps=s;
	}
	public int getTotalSteps() {
		return totalsteps;
	}
	public int getGender() {
		return gender;
	}
	public int die=(int)(Math.random()*10)+20;
    /**
     * Constructs a box bug that traces a square of a given side length
     * @param length the side length
     */
    public Herp_A_Derp(int length)
    {
    	Recolor();
        steps = 0;
        sideLength = length;
        if (gender>5) 
    		gender=1;
    	else 
    		gender=-1;
    }

    /**
     * Moves to the next location of the square.
     */
    public void act()
    {
    	Recolor();
    	totalsteps++;
    	
    	if (totalsteps>5 && fertile==true)
    		Breed();//attempt to breed
    	if (totalsteps>=die) 
    		removeSelfFromGrid();
        if (steps < sideLength && canMove())
        {
        	move();
            steps++;
        }
        else if (steps==sideLength) {
        	int k=(int)(Math.random()*5)+1;
        	for (int i=1;i<=k;i++) {
        		turn();
        	}
        	steps=0;
        	sideLength=(int)(Math.random()*5);
        }
        else
        {
            turn();
            steps = 0;
        }
    }

	public void Breed() {
		ArrayList<Location> bob = super.getGrid().getOccupiedLocations();
		if (bob.size()>0) {
			
			for (int i=0;i<=bob.size()-1;i++) {
				if (getGrid().get(bob.get(i)).getClass()== Herp_A_Derp.class &&getGrid().get(bob.get(i)).getLocation()!=getLocation()) {//if it's even a bug
					tempbug = (Herp_A_Derp) getGrid().get(bob.get(i)) ;
					
						//passes min age requirement and is of opposite gender
						if (getDist(tempbug.getLocation())<=2 && tempbug.getGender()==getGender()*-1 && tempbug.getTotalSteps()>MinAge) {
							joe = getGrid().getEmptyAdjacentLocations(getLocation());
							if (joe.size()>0) {
								Actor newbug = new Herp_A_Derp((int)(Math.random()*5)+1);
								newbug.putSelfInGrid(getGrid(), joe.get(0));

							}
						}
					
				}
			}
		}
	}
	public void Recolor() {
		colorpick=(int)(Math.random()*10);
    	switch (colorpick) {
    	case 0:
    		setColor(Color.blue);
    		break;
    	case 1:
    		setColor(Color.red);
    		break;
    	case 2:
    		setColor(Color.green);
    		break;
    	case 3:
    		setColor(Color.cyan);
    		break;
    	case 4:
    		setColor(Color.DARK_GRAY);
    	case 5:
    		setColor(Color.gray);
    		break;
    	case 6:
    		setColor(Color.PINK);
    		break;
    	case 7:
    		setColor(Color.WHITE);
    		break;
    	case 8:
    		setColor(Color.YELLOW);
    		break;
    	case 9:
    		setColor(Color.BLACK);
    		break;
    	}
	}
}
