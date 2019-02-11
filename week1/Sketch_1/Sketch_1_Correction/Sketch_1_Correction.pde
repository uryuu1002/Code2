//store positions, colors, active boolean

int ROWS = 30;
int COLS = 30;
int w = 600;
int h = 600;
int CELLSIZE = w/COLS;

PVector[][]pos = new PVector [COLS][ROWS];
color[][]colors = new color [COLS][ROWS];
boolean[][]isActive = new boolean[COLS][ROWS];


void setup() {
  size(600, 600);
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      pos[i][j] = new PVector(i*CELLSIZE, j*CELLSIZE);
      colors[i][j] = color(255, random(255), random(255));
      isActive[i][j] = false;
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      
      if (mouseX > pos[i][j].x && mouseX < pos[i][j].x + CELLSIZE &&
          mouseY > pos[i][j].y && mouseY < pos[i][j].y + CELLSIZE){
          isActive[i][j] = true;
          }
      
      if (isActive[i][j]) {
        noStroke();
        fill(colors[i][j]);
        rect(pos[i][j].x, pos[i][j].y, CELLSIZE, CELLSIZE);
      }
    }
  }
}
