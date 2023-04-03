Ball [] balls;
int numBalls =10;
PImage[] images;
int startTime =0;

void setup(){
  size (400,400);
  images = new PImage[3];
  images[0] = loadImage("image1.png");
  images[0].resize(400,400);
  images[1] = loadImage("image2.png");
  images[1].resize(400,400);
  images[2] = loadImage("image3.png");
  images[2].resize(400,400);
  smooth ();
  restart ();
}

void draw (){
  int index = int (random(images.length));
  PImage img= images [index];
/*  if ((millis() - startTime) % 5000 ==0 )
  {
    
    background (img);
  } */
  
  background(160);
  for(int i =0; i< numBalls; i++ )
  {
    balls [i].update ();
    balls[i].display ();
  }
}

void restart (){
  balls = new Ball[numBalls];
  for(int i=0; i<numBalls; i++)
  {
    balls [i]= new Ball (random ( width), random (height), random( 2,5), color(random(255), random (255), random(255)));
 
  }
  
}

class Ball {
  float x,y, speedX, speedY;
  color c;
  Ball(float Xpos, float Ypos, float sx, color col)
  {
    x=Xpos;
    y=Ypos;
    speedX=sx;
    speedY= random (2,5);
    c=col;
  }
  
  void update()
  {
    x+= speedX;
    y+= speedY;
    if (x<0 || x > width )
    {
      speedX= - speedX;
    }
    if(y<0 || y > height)
    {
      
      speedY = -speedY;
    }
  }
  
  void display ()
  {
    fill(c);
    noStroke();
    ellipse(x,y,20,20);
  }
}

void mousePressed ()
{
 // startTime = millis();
  restart ();
}

  
  
  
