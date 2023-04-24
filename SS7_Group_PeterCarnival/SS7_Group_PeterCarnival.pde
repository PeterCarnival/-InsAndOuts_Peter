// Arturo,Peter, Cynthia 
// the eye becomes bigger and the hat changes into 3 different colors the higher you put it
import processing.serial.*; //imports Serial library from Processing
Serial myPort; // creates object from Serial class
int val=0; // creates variable for data coming from serial port
void setup() {
  size (1080,720);
  /*
   IMPORTANT: We must tell Processing which port to read from.
   Run the sketch and check your console to see the results of printArray(Serial.list());
   and that is how you know the port to use.
   On my Mac, it is port 1 and so I open Serial.list()[1].
   */
  printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[1]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
}
void draw() {
  if ( myPort.available() > 0) { // If data is available,
    val = myPort.read(); // read it and store it in val
  }
   color black = #080808;
color purple = #3203AA;
  //draws an ellipse that grows and shrinks in relation to val
  background(black);
  fill (0);
  //println (val); //prints to Processing console
  color r = color(255,0,0);
fill(r);
rect(500, 290, 200, 200);
circle(550, 530, 100);
circle(450, 530, 100);
circle(500, 400, 250);
color c = color(20, 75, 200);
fill(c);
ellipse(490, 400, 110,val);
color g = color(0, 75, 0);
fill(g);
triangle(360, 300, 500, 200, 630, 300);
if (val <= 20){
  fill(r);
triangle(360, 300, 500, 200, 630, 300);
} else if (val >= 120){
  fill(purple);
triangle(360, 300, 500, 200, 630, 300);
}
}
