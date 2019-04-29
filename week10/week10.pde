// based on class example code and Turtle library example code
// self generating ranches
import Turtle.*;
Turtle t;
float freq, freq2;
int colorset;
color[] colors = {
  #2f8727, 
  #7ea57a, 
  #60a559, 
  #ffffff
};

void setup() {
  size(700, 800);
  background(#f7d3c3);
  t = new Turtle(this);
  frameRate(30);
}

void draw() {
  println(frameCount);

  t.penUp();
  t.setY(height);
  t.setX(frameCount*(width/40));
  t.back(random(80, 150));
  t.penDown();

  colorset = colors[int(random(colors.length))];
  stroke(colorset);
  strokeWeight(random(1, 2));
  if (random(1) < 0.5) {
    t.right(random(1,5));
    branch(int(random(5, 10)), random(100, 250), int(random(5, 20)));
  } else {
    t.left(random(1,5));
    branch(int(random(5, 10)), random(100, 250), int(random(5, 20)));
  }



  if (frameCount > 80) {
    noLoop();
  }
}

void branch(int iteration, float len, float theta) {
  freq = random(0.3, 0.8);
  freq2 = random(0.5, 1.5);
  if (iteration == 0)
    return;
  t.forward(len);
  t.left(theta);
  branch(iteration-1, len * freq, theta*freq2);
  t.right(theta);
  t.right(theta);
  branch(iteration-1, len * freq, theta*freq2);
  t.left(theta);
  t.back(len);
}
