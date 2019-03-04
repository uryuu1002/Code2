class Block{
  PVector pos;
  float c;
 
  Block(int row, int col){
    pos = new PVector(row * cellSize, col * cellSize);
  }
  
  void display(){
    stroke(0);
    fill(c);
    rect( pos.x , pos.y, cellSize,cellSize);
  }
}
