ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  size(600,600);
}

void draw(){
  background(255);
  
  //line(0,0,width,height);
  beginShape();
  for (PVector point : points){
    vertex(point.x, point.y);
  }
  endShape();
}

void mousePressed(){
  points.add(new PVector(mouseX, mouseY));
}
