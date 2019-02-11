Paddle paddle;
Block blocks;
Ball ball;


void setup(){
  size(600,600);
  paddle = new Paddle();
  blocks = new Block();
  ball = new Ball();
}

void draw(){
  background(255);
  
  
  paddle.display();
  paddle.update();
  
  blocks.show();
  
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
