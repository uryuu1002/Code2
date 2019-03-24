// bryan ma for code 2 sp 19 A
// couldn't figure out this one. My problem is that there is only data.getRow()
// but now data.getColumn(), therefore I when I tried to print out the int data
// stored for level, it gave me 144 "0".

int rows = 12;
int cols = 12;
int cellsize = 600/rows;
int MAX_LEVELS = 3;
int whichLevel = 0;

Table data;
Block[][] blocks = new Block[rows][cols];
int[][][] levels = new int[rows][cols][5];

void setup() {
  size(600, 600);
  data = loadTable("data.csv");


  for (int level = 0; level < MAX_LEVELS; level ++) {
    for (int i = 0; i < rows; i++) {
      TableRow row = data.getRow(i + cols * level);
      for (int j = 0; j < cols; j++) {
        levels[i][j][level] = row.getInt(j);
      }
    }
  }
  loadLevel();
}

void keyPressed() {
  changeState();
}

void loadLevel() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (levels[j][i][whichLevel] == 0) {
        blocks[j][i] = new DarkBlock(i, j);
      } else {
        blocks[j][i] = new LightBlock(i, j);
      }
    }
  }
}

void draw() {
  background (255);

  boolean shouldChangeLevel = true;

  switch(whichLevel) {
  case 0: 
    background(255);
    fill(0);
    textSize(64);
    text("Game BEGINS", 100, 100);
    break;
  case 1: 
  case 2: 
  case 3: 
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        blocks[j][i].display();
        blocks[j][i].update();
        if (blocks[j][i].c > 0) {
          shouldChangeLevel = false;
        }
      }
    }  
    if (shouldChangeLevel) {
      changeState();
    }
    break;
  case 4:
    background(255);
    fill(0);
    textSize(64);
    text("Game OVER", 100, 100);
    break;
  }
}

void changeState() {
  whichLevel++;
  loadLevel();
}

class Block {
  PVector pos;
  float c;

  Block(int row, int col) {
    pos = new PVector(row * cellsize, col * cellsize);
  }

  void display() {
    fill(c);
    rect(pos.x, pos.y, cellsize, cellsize);
  }

  void update() {
    if (mouseX > pos.x && mouseX < pos.x + cellsize &&
      mouseY > pos.y && mouseY < pos.y + cellsize) {
      c = 0;
    }
  }
}

class LightBlock extends Block {
  LightBlock(int row, int col) {
    super(row, col);
    c = 220;
  }
}

class DarkBlock extends Block {
  DarkBlock(int row, int col) {
    super(row, col);
    c = 50;
  }
}
