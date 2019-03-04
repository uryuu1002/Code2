// float [] x + float [] y = PVector [][] pos = new PVector [3][3]
//PVector[][] pos = new PVector[3][3];
//Color [][] c = new Color[3][3];
int rows = 8;
int cols = 12;
Block[][] blocks = new Block[rows][cols];

int cellSize = 50;

int [][][] level = {{
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0}, 
    {0, 0, 2, 0, 2, 0, 0, 2, 0, 2, 0, 0}, 
    {0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  }, 
  {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0}, 
    {0, 0, 2, 0, 2, 0, 0, 2, 0, 2, 0, 0}, 
    {0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0}, 
    {0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
  }, 
  {
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0}, 
    {0, 0, 2, 0, 2, 0, 0, 2, 0, 2, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0}, 
    {0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0}
}};

int whichLevel = 0;


void setup() {
  size(500, 500);
  createLevels();

  //1. loop through all positions
  // fill (c[i][j]) and do rect (pos[i][j].x,pos[i][j].y, cellsize, cellsize])
  //2.give starting values
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
  whichLevel = whichLevel + 1;
  if (whichLevel > 2){
    whichLevel = 0;
  }
  createLevels();
}

void createLevels() {
  for (int i = 0; i < cols; i ++) {
    for (int j = 0; j < rows; j++) {

      if (level[whichLevel][j][i] == 0) {
        blocks[j][i] = new LightBlock (i, j );
      } else if (level[whichLevel][j][i] == 1) {
        blocks[j][i] = new DarkBlock (i, j );
      } else {
        blocks[j][i] = new BlueBlock (i, j );
      }
    }
  }
}
