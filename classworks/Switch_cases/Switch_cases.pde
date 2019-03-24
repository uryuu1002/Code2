int num = 5;

void setup() {
  //if (num == 0) {
  //  background(0);
  //} else if (num == 1) {
  //  background(255);
  //} else if (num == 2) {
  //  background(255,0,255);
  //} else if (num == 3) {
  //  background(255,255,0);
  //}

  // an easier way for if statements

  switch(num) {
  case 0: background(0);
    break;
  case 1: background(255);
    break;
  case 2: background(255,0,255);
    break;
  case 3: background(255,255,0);
    break;
  default: background(255,0,0);
    break;
  }
}

void draw() {
}
