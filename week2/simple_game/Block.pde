int rows = 10;
int cols = 20;
float w, h;
float[][]posX = new float[rows][cols];
float[][]posY = new float[rows][cols];

class Block {

  float x, y;

  Block() {

    w = width/rows;
    h = 300/cols;

    for (int i = 0; i < posX.length; i++) {
      for (int j = 0; j < posX[0].length; j++) {
        posX[i][j] = i * w;
        posY[i][j] = j * h;
      }
    }
  }

  void update() {
  }

  void show() {  
    for (int i = 0; i < posX.length; i++) {
      for (int j = 0; j < posX[0].length; j++) {
        fill(0);
        stroke(255);
        rect(posX[i][j], posY[i][j], w, h);
      }
    }
  }
  
}
