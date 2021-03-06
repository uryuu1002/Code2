// float [] x + float [] y = PVector [][] pos = new PVector [3][3]
//PVector[][] pos = new PVector[3][3];
//Color [][] c = new Color[3][3];
int rows = 8;
int cols = 12;
Block[][] blocks = new Block[rows][cols];

int cellSize = 50;

int [][] level = {
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0}, 
  {0, 0, 2, 0, 2, 0, 0, 2, 0, 2, 0, 0}, 
  {0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
};


void setup() {
  size(500, 500);

  //1. loop through all positions
  // fill (c[i][j]) and do rect (pos[i][j].x,pos[i][j].y, cellsize, cellsize])
  //2.give starting values

  for (int i = 0; i < cols; i ++) {
    for (int j = 0; j < rows; j++) {

      if (level[j][i] == 0) {
        blocks[j][i] = new LightBlock (i, j );
      } else if (level[j][i] == 1) {
        blocks[j][i] = new DarkBlock (i, j );
      } else {
        blocks[j][i] = new BlueBlock (i, j );
      }
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
