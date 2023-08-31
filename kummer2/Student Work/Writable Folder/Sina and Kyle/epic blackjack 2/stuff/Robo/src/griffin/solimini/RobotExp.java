package griffin.solimini;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;

public class RobotExp {

	public static void main(String[] args) {

		try {

			Robot robot = new Robot();
			// Creates the delay of 5 sec so that you can open notepad before
			// Robot start writting
			robot.delay(5000);
			int i;
			for (i=1;i<=50;i++){
				robot.keyPress(KeyEvent.VK_ENTER);
				robot.keyPress(KeyEvent.VK_R);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_B);
				robot.keyPress(KeyEvent.VK_I);
				robot.keyPress(KeyEvent.VK_N);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_H);
				robot.keyPress(KeyEvent.VK_O);
				robot.delay(10);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_D);
				robot.delay(20);
				robot.keyPress(KeyEvent.VK_ENTER);
			}
			for (i=1;i<=50;i++){
				robot.keyPress(KeyEvent.VK_ENTER);
				robot.keyPress(KeyEvent.VK_L);
				robot.keyPress(KeyEvent.VK_U);
				robot.keyPress(KeyEvent.VK_M);
				robot.keyPress(KeyEvent.VK_B);
				robot.keyPress(KeyEvent.VK_E);
				robot.keyPress(KeyEvent.VK_R);
				robot.keyPress(KeyEvent.VK_J);
				robot.keyPress(KeyEvent.VK_A);
				robot.keyPress(KeyEvent.VK_C);
				robot.keyPress(KeyEvent.VK_K);
				robot.delay(20);
				robot.keyPress(KeyEvent.VK_ENTER);
			}
			for (i=1;i<=50;i++){
				robot.keyPress(KeyEvent.VK_ENTER);
				robot.keyPress(KeyEvent.VK_R);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_C);
				robot.keyPress(KeyEvent.VK_K);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_N);
				robot.delay(20);
				robot.keyPress(KeyEvent.VK_ENTER);
			}
			for (i=1;i<=50;i++){
				robot.keyPress(KeyEvent.VK_ENTER);
				robot.keyPress(KeyEvent.VK_C);
				robot.keyPress(KeyEvent.VK_H);
				robot.keyPress(KeyEvent.VK_E);
				robot.keyPress(KeyEvent.VK_E);
				robot.keyPress(KeyEvent.VK_S);
				robot.keyPress(KeyEvent.VK_E);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_S);
				robot.keyPress(KeyEvent.VK_T);
				robot.keyPress(KeyEvent.VK_E);
				robot.keyPress(KeyEvent.VK_A);
				robot.keyPress(KeyEvent.VK_K);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_J);
				robot.keyPress(KeyEvent.VK_I);
				robot.keyPress(KeyEvent.VK_M);
				robot.delay(10);
				robot.keyPress(KeyEvent.VK_M);
				robot.keyPress(KeyEvent.VK_Y);
				robot.keyPress(KeyEvent.VK_QUOTE);
				robot.keyPress(KeyEvent.VK_S);
				robot.delay(20);
				robot.keyPress(KeyEvent.VK_ENTER);
			}
			for (i=1;i<=75;i++){
				robot.keyPress(KeyEvent.VK_ENTER);
				robot.keyPress(KeyEvent.VK_H);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_W);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_D);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_Y);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_U);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_T);
				robot.keyPress(KeyEvent.VK_U);
				robot.keyPress(KeyEvent.VK_R);
				robot.keyPress(KeyEvent.VK_N);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_T);
				robot.keyPress(KeyEvent.VK_H);
				robot.keyPress(KeyEvent.VK_I);
				robot.keyPress(KeyEvent.VK_S);
				robot.keyPress(KeyEvent.VK_SPACE);
				robot.keyPress(KeyEvent.VK_O);
				robot.keyPress(KeyEvent.VK_N);
				robot.delay(20);
				robot.keyPress(KeyEvent.VK_ENTER);
			}

		} catch (AWTException e) {
			e.printStackTrace();
		}
	}
}