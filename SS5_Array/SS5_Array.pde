// click on screen to move balls
int numEllipses = 10;
float[] xPos = new float[numEllipses];
float[] yPos = new float[numEllipses];
float[] xSpeed = new float[numEllipses];
float[] ySpeed = new float[numEllipses];
int[] colors = new int[numEllipses];

void setup() {
  size(600, 400);
  for (int i = 0; i < numEllipses; i++) {
    xPos[i] = random(width);
    yPos[i] = random(height);
    xSpeed[i] = random(-2, 2);
    ySpeed[i] = random(-2, 2);
    colors[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < numEllipses; i++) {
    fill(colors[i]);
    ellipse(xPos[i], yPos[i], 50, 50);
    xPos[i] += xSpeed[i];
    yPos[i] += ySpeed[i];
    if (xPos[i] < 0 || xPos[i] > width) {
      xSpeed[i] *= -1;
    }
    if (yPos[i] < 0 || yPos[i] > height) {
      ySpeed[i] *= -1;
    }
  }
}

void mousePressed() {
  for (int i = 0; i < numEllipses; i++) {
    float d = dist(mouseX, mouseY, xPos[i], yPos[i]);
    if (d < 25) {
      xPos[i] = random(width);
      yPos[i] = random(height);
    }
  }
}
