int rows = 10;
int cols = 20;
float w, h;

Paddle paddle;
Ball ball;
BlockSystem bs;


void setup() {
  size(600, 600);
  paddle = new Paddle();

  ball = new Ball();

  bs = new BlockSystem();
}

void draw() {
  background(255);


  bs.addBlock();
  //bs.blockStatus();

  paddle.display();
  paddle.update();

  ball.show();
  ball.update();
  ball.hitCheck();
}

void keyPressed() {
  if (keyCode == LEFT) {
    paddle.mLeft();
  } else {
    if (keyCode == RIGHT) {
      paddle. mRight();
    }
  }
}
