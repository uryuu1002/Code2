float offset = 0;
float incr = 0.001;
float freq = 0.005;
void setup() {
  size(600, 600);
}

void draw() {
  background (255);

  beginShape();
  for (int i = 0; i < width; i += 20) {
      //random circles
      //ellipse(i, map(random(1),0,1,0,height),20,20);

      //random vertex
      //vertex(i, map(random(1),0,1,0,height));

      //noise vertex
      vertex(i, map(noise(i*freq + offset), 0, 1, 0, height));
      offset += incr;

      ellipse(width/2, map(noise(frameCount * 0.02), 0, 1, 0, map(noise(1*freq + offset), 0, 1, 0, height) ), 50, 50);
    }
    endShape();

}
