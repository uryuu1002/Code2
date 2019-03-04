class Block{
  PVector pos;
  float c;
 
  Block(float x, float y){

    pos = new PVector (x,y);
    c = random(255);
  }
  
  void display(){
    stroke(0);
    fill(c);
    rect( pos.x , pos.y, 100,100);
  }
}
