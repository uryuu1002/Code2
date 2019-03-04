// float [] x + float [] y = PVector [][] pos = new PVector [3][3]
//PVector[][] pos = new PVector[3][3];
//Color [][] c = new Color[3][3];
int rows = 12;
int cols = 8;
Block[][] blocks = new Block[rows][cols];
int cellSize = 100;

void setup() {
  size(500, 500);

  //1. loop through all positions
  // fill (c[i][j]) and do rect (pos[i][j].x,pos[i][j].y, cellsize, cellsize])
  //2.give starting values

  for (int i = 0; i < rows; i ++) {
    for (int j = 0; j < cols; j++) {

      // The Block constructor nees "rows and cols", when looping the values,
      // i and j became our rows and cols
      // horizontal line
      if (i % 2 == 1) {
        blocks[i][j] = new LightBlock (i, j );
      } else {
        blocks[i][j] = new DarkBlock (i, j );
      }
      //vertical line
      //if (i % 2 == 1) {
      //  blocks[i][j] = new LightBlock (i, j );
      //} else {
      //  blocks[i][j] = new DarkBlock (i, j );
      //}
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

  for (int i = 0; i < rows; i ++) {
    for (int j = 0; j < cols; j++) {

      // The Block constructor nees "rows and cols", when looping the values,
      // i and j became our rows and cols

      float r = random(1);
      if (r > 0.5) {
        blocks[i][j] = new LightBlock (i, j );
      } else {
        blocks[i][j] = new DarkBlock (i, j );
      }
    }
  }
}
