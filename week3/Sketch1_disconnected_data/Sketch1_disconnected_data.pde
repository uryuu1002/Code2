final int NUM_SHAPES = 300;

float [] xpos = new float [NUM_SHAPES];
float [] ypos = new float [NUM_SHAPES];

void setup() {
  size(400, 400);
  noStroke();

  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = random(width);
  }

  for (int i = 0; i < ypos.length; i++) {
    ypos[i] = map(i, 0, ypos.length, height / 3, height * 4/ 5);
  }
}  

void draw() {
  background(244, 217, 66);
  for (int i = 0; i < xpos.length; i++) {
    float siz = map(i, 0, xpos.length, 200, 10);

    fill((map(i, 0, xpos.length, 10, 255)), 30, 100, 100);
    ellipse(xpos[i], ypos[i], siz, siz);
  }


  for (int i = 0; i < xpos.length; i++) {
    float siz = map(i, 0, xpos.length, 200, 10);
    xpos[i] -= map(i, 0, xpos.length, 1, 20);

    if (xpos[i] < -siz / 2) {
      xpos[i] = width + siz / 2;
    }
  }
  
}
