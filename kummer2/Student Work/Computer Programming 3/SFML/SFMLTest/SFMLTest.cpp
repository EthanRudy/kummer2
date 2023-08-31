#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>

int main() {
	// Create the window
	sf::RenderWindow window(sf::VideoMode(200, 200), "SFML works!");

	// Create the circle shape and set its color to green
	sf::CircleShape shape(100.f);
	shape.setFillColor(sf::Color::Green);

	// Create the sound buffer
	sf::SoundBuffer buffer;
	buffer.loadFromFile("explosion.wav");

	// Create the sound object using the sound buffer
	sf::Sound sound(buffer);

	// This is the main game loop, this will run until the window is closed
	while (window.isOpen()) {
		// Wait for an event
		sf::Event event;
		while (window.pollEvent(event)) {
			switch (event.type) {
				// Close the window if the program is closed
				case sf::Event::Closed:
					window.close();
					break;
				// A mouse button was pressed
				case sf::Event::MouseButtonPressed:
					sound.play();
					break;
				default:
					break;
			}
		}

		// Clear the screen, draw the circle, and update the window
		window.clear();
		window.draw(shape);
		window.display();
	}

	return EXIT_SUCCESS;
}
