PVector position;
float [] pos = new float[4];
String [] text= {"hello", "hi", "how are you", "I'm fine."};

void setup() {
  size (600, 250);

  for (int i = 0; i < pos.length; i++) {
    pos[i] = map (i, 0, pos.length, 100, width);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < pos.length; i++) {
    float d = dist(pos[i], height/3, mouseX, mouseY);
    if (mousePressed && d <= 50) {
      fill(255);
    } else {
      fill(0);
    }
    position = new PVector(pos[i], height/3);
    ellipse(position.x, position.y, 100, 100);
    
    PVector diff = new PVector (mouseX - position.x, mouseY - position.y);
    if (diff.x > 100){
    textSize(30);
    fill(0);
    text(" IDK how to do this :<", 200, 200);
    }
    
  }
}
