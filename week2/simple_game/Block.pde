class Block {

  Block() {

    w = width/rows;
    h = 300/cols;
  }

  void update() {
  }

  void show() {  
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        fill(0);
        stroke(255);
        rect(i * w, j * h, w, h);
      }
    }
  }
}
