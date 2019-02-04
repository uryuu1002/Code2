float amplitude = 360;
float period = 500;
float r = 150;
boolean click = false;

void setup() {
  size (500, 500);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  float x = amplitude * sin((frameCount/period)*TWO_PI);
  
  //float d = dist(0, x,mouseX,mouseY);
  //if (click && d <= r/2) {
  //Note: once I add the conditional of d, it does not work anymore
  
  if (click) {
    stroke(0);
    fill(255);
    ellipse(x, 0, r, r);
  } else {
    stroke(0);
    fill(255);
    ellipse(0, x, r, r);
  }
}

void mouseClicked(){
  click = true;
}
