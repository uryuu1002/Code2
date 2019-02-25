final int NUM_SHAPES = 300;
float siz;
Waves waves;
float [] xpos = new float [NUM_SHAPES];
float [] ypos = new float [NUM_SHAPES];

void setup() {
  size(400, 400);
  noStroke();
  waves = new Waves();
}  

void draw() {
  background(244, 217, 66);
  waves.display();
  waves.update();
}
