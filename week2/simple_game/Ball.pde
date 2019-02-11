class Ball {

  float x = width/2;
  float y = 550;
  float dx = 10;
  float dy = 10;
  
  int r;

  Ball() {
    r = 15;

  }

  void update() {
    if (x > width || x < 0) {
      dx = -dx;
    }

    if (y > height || y < 0) {
      dy = -dy;
    }

    x += dx;
    y += dy;
  }

  void show() {
    noStroke();
    fill(255, 0, 0);
    ellipse(x, y, r*2, r*2);
  }

  void hitCheck() {
     //if (x < paddle.pos.x + paddle.w/2 && x < paddle.pos.x - paddle.w/2 && y - r < paddle.pos.y+ paddle.h/2 && y + r > paddle.pos.y - paddle.h/2){
     //  dy *= -1;
     //}
     
     if (dist(x,y,paddle.pos.x, paddle.pos.y)<r){
     dy *= -1;
     }
    }

  }
