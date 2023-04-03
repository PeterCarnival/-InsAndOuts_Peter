PImage img; // declare a variable to hold our image

void setup() {
  size(600, 400); // set the size of the window
  img = loadImage("Robot-Art1.jpg"); // Image from week 1
  if (img == null) {
    println("Failed to load image");
  }
}

void draw() {
  background(255); // set the background color to white
  
  if (mouseX > width/2) { // if the mouse is on the right half of the screen
    fill(255, 0, 0); // set the fill color to red
  } else { // otherwise
    fill(0, 0, 255); // set the fill color to blue
  }
  
  ellipse(mouseX, mouseY, 50, 50); // draw a circle at the mouse position
  
  if (img != null) {
    float imgWidth = img.width;
    float imgHeight = img.height;
    float aspectRatio = imgWidth / imgHeight;
    
    if (width / height > aspectRatio) {
      imgWidth = height * aspectRatio;
      imgHeight = height;
    } else {
      imgHeight = width / aspectRatio;
      imgWidth = width;
    }
    
    image(img, (width - imgWidth) / 2, (height - imgHeight) / 2, imgWidth, imgHeight); // display the flower image centered and scaled to fit the window
  }
  
  textSize(32); // set the font size
  textAlign(CENTER); // center align the text
  fill(random(255), random(255), random(255)); // set the fill color to a random color
  text("Click anywhere to change the text color", width/2, 50); // display the text in the center of the screen
}

void mousePressed() {
  fill(random(255), random(255), random(255)); // set the fill color to a random color
}
