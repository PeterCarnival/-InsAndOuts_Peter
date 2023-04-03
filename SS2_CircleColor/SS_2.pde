float circleSize = 30;
float circleX, circleY;
int circleColor = 0;

void setup() {
  size(400, 400);
  background(255);
  circleX = width / 2;
  circleY = height / 2;
  noStroke();
}

void draw() {
  // Draw circle
  fill(circleColor);
  ellipse(circleX, circleY, circleSize, circleSize);
  
  // Move circle if arrow keys are pressed
  if (keyPressed) {
    if (keyCode == LEFT) {
      circleX -= 5;
    } else if (keyCode == RIGHT) {
      circleX += 5;
    } else if (keyCode == UP) {
      circleY -= 5;
    } else if (keyCode == DOWN) {
      circleY += 5;
    }
  }
  
  // Change circle size randomly
  circleSize = random(10, 50);
}

void keyPressed() {
  // Change circle color based on key pressed
  if (key == 'r') {
    circleColor = color(255, 0, 0); // Red
  } else if (key == 'g') {
    circleColor = color(0, 255, 0); // Green
  } else if (key == 'b') {
    circleColor = color(0, 0, 255); // Blue
  } else if (key == 'y') {
    circleColor = color(255, 255, 0); // Yellow
  } else if (key == 'w') {
    circleColor = color(255); // White
  } else if (key == 'k') {
    circleColor = color(0); // Black
  }
}

void mousePressed() {
  // Move circle to mouse position
  circleX = mouseX;
  circleY = mouseY;
}
