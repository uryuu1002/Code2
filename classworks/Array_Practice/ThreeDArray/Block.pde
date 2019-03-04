class Block{
  PVector pos;
  float r;
  float g;
  float b;

  Block(int row, int col){
    pos = new PVector(row * cellSize, col * cellSize);
  }
  
  void display(){
    stroke(0);
    fill(r,g,b);
    rect( pos.x , pos.y, cellSize,cellSize);
  }
}
