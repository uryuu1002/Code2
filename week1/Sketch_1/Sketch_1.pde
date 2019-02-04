//Note: i can only make a sketch that changes every rect color, not each individual rect color :(

int rows = 30;
int columns = 30;
float w, h ;
float [][] posX = new float[rows][columns];
float [][] posY = new float[rows][columns];
boolean colorActive = false;
color c;

void setup(){
  size(600,600);
  w = width/rows;
  h = height/columns;
  for (int i = 0; i < posX.length; i++){
    for(int j = 0; j < posX[0].length;j++){
      posX[i][j] = i * w;
      posY[i][j] = j * h;
    }
  }
}

void draw(){
  for(int i = 0; i < posX.length; i++){
    for (int j = 0; j < posX[0].length; j++){
      rect(posX[i][j], posY[i][j], w, h);
      if (colorActive){
      fill (c);
      c = color(map(mouseX, 0, width, 0, 255), 
      map(mouseY, 0, height, 0, 255),
      blue(c), 10);
      } else {
      fill (255);
      }
    }
  }
}

void mousePressed(){
  colorActive = true;
}

void mouseReleased(){
  colorActive = false;
}
