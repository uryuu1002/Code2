// bryan ma for code 2 sp 19 A
// couldn't figure out this one. My problem is that there is only data.getRow()
// but now data.getColumn(), therefore I when I tried to print out the int data
// stored for level, it gave me 144 "0".

int rows = 12;
int cols = 12;
int cellsize = 600/rows;
Block[][] blocks = new Block[cols][rows];
int[][]level = new int[cols][rows];

Table data;

void setup() {
  size(600, 600);
  data = loadTable("data.csv");

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      TableRow row = data.getRow(i);
      level[j][i] = row.getInt(j);

      print(level[j][i] + " ");

      if (level[j][i] == 0) {
        blocks[j][i] = new DarkBlock(j, i);
      } else {
        blocks[j][i] = new LightBlock(j, i);
      }
      blocks[j][i].display();
    }
    println("");
  }
}

void draw() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      blocks[j][i].display();
    }
  }
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
