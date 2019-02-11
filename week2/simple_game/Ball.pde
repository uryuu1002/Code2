class Ball {
  float dx = random(1, 2);
  float dy = random(1, 2);

  PVector pos;
  PVector speed;
  int s;
  
  Ball() {
    s = 30;
    pos = new PVector(width/2,550);
    speed = new PVector (2,2);

  }

  void update() {
    if (pos.x > width || pos.x < 0) {
      speed.x = - speed.x;
    }

    if (pos.y > height || pos.y < 0) {
      speed.y = -speed.y;
    }

    pos.x += speed.x;
    pos.y += speed.y;
  }

  void show() {
    noStroke();
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, s, s);
  }
  
  void hitCheck(){
  float d = dist (paddle.pos.x, paddle.pos.y, pos.x, pos.y);
    if(d < 20){
    pos.x += speed.x;
    pos.y += speed.y;
    }
  
  }
}
