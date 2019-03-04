// float [] x + float [] y = PVector [][] pos = new PVector [3][3]
//PVector[][] pos = new PVector[3][3];
//Color [][] c = new Color[3][3];

Block[][] blocks = new Block[3][3];
int rows, cols;
//int cellSize = 100;

void setup() {
  size(500, 500);
  rows = 3;
  cols = 3;
  //1. loop through all positions
  // fill (c[i][j]) and do rect (pos[i][j].x,pos[i][j].y, cellsize, cellsize])
  //2.give starting values

  for (int i = 0; i < rows; i ++) {
    for (int j = 0; j < cols; j++) {
      // The Block constructor nees "rows and cols", when looping the values,
      // i and j became our rows and cols
      blocks[i][j] = new Block (i * 100, j * 100);
    }
  }
}

void draw() {
  background(255);
  for (int i = 0; i < rows; i ++) {
    for (int j = 0; j < cols; j++) {
      blocks[i][j].display();
    }
  }
}

void mousePressed() {
  //By coping setup blocks code, the color of blocks will change each time when mouse is pressed
  blocks [0][0] = new Block(mouseX,mouseY);
}
