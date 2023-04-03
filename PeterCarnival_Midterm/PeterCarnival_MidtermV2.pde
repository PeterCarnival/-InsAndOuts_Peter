Ball[] balls;
int numBalls = 10;
PImage[] images;
int index = 0;
int f = 0;

void setup() {
  size(400, 400);
  
  // Load the images and check for errors
  images = new PImage[3];
  try {
    images[0] = loadImage("image1.png");
    images[0].resize(400, 400);
    images[1] = loadImage("image2.png");
    images[1].resize(400, 400);
    images[2] = loadImage("image3.png");
    images[2].resize(400, 400);
  } catch (Exception e) {
    // Print an error message if the images could not be loaded
    println("Error loading image file: " + e.getMessage());
    e.printStackTrace();
  }

  smooth();
  restart();

  frameRate(60);
}

void draw() {
  index += int(random(0, 5)) % 2000;
  if ((index++ % 5000 != 0)) {
    smooth();
    background(images[f]);

  } else {
    smooth();
    background(images[f++ % images.length]);

    index = 0;
  }

  for (int i = 0; i < numBalls; i++) {
    balls[i].update();
    balls[i].display();
  }
}

void restart() {
  balls = new Ball[numBalls];
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), random(2, 5), color(random(255), random(255), random(255)));

  }
  f = (++f) % 3;
}

class Ball {
  float x, y, speedX, speedY;
  color c;

  Ball(float Xpos, float Ypos, float sx, color col) {
    x = Xpos;
    y = Ypos;
    speedX = sx;
    speedY = random(2, 5);
    c = col;
  }

  void update() {
    x += speedX;
    y += speedY;
    if (x < 0 || x > width) {
      speedX = -speedX;
    }
    if (y < 0 || y > height) {

      speedY = -speedY;
    }
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x, y, 20, 20);
  }
}

void mousePressed() {
  restart();
}
