import org.masonacm.actorwars.ActorWarWorld;

public class ActorWarsRunner {

	public static void main (String[] args) {
		ActorWarWorld aww = new ActorWarWorld();
		
		aww.add(new ToreyPeon());
		
		aww.show();
	}
	
	
}
