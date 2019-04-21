int rows = 100;
int cols = 100;

void setup(){
  size (600,600,P3D);
}

void draw(){
  background(0);
  strokeWeight(3);
  stroke(255);
  rotateX(radians(-10));
  pushMatrix();
  translate(0,height/2);
  for (int i = 0; i < cols; i++){
    for (int j = 0; j < rows; j++){
      pushMatrix();
      // 3D sin wave
      //translate(i*5,sin(frameCount* 0.03 + i*0.1)*100, j*5);
      
      // generate wave,representing natural process
      translate(i*10, noise(i*0.04, j*0.04, frameCount * 0.01)*200, j*10);
      point(0,0,0);
      popMatrix();
    }
  }
  popMatrix();
}
