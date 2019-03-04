// bryan ma for code 2 sp 19 A
// couldn't figure out this one. My problem is that there is only data.getRow()
// but now data.getColumn(), therefore I when I tried to print out the int data
// stored for level, it gave me 144 "0".

int rows = 12;
int cols = 12;
int cellsize = 600/rows;

Table data;


void setup() {
  size(600, 600);
  data = loadTable("data.csv");
  Block[][] blocks = new Block[data.getRowCount()][data.getColumnCount()];
  int[][]level = new int[data.getRowCount()][data.getColumnCount()];
  
  for (int i = 0; i < data.getRowCount(); i++) {
    for (int j = 0; j < data.getColumnCount(); j++) {
      TableRow row = data.getRow(i);
      print(level[j][i]);

      if (level[j][i] == 0) {
        blocks[j][i] = new DarkBlock(i, j);
      } else {
        blocks[j][i] = new LightBlock(i, j);
      }
      blocks[j][i].display();
    }
  }
}

void draw() {

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
