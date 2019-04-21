//Check points: 3D, vertex, noise, physics + interesting (please think it is interesting)


import ddf.minim.*;
Minim minim;
AudioPlayer song;

PVector origin;

Mover n;
float restLength;

float offset = 0;
float incr = 0.001;
float freq = 0.005;

int spacing = 25; // space between lines in pixels
int amplification = 3; // frequency amplification factor

int rows = 100;
int cols = 100;

void setup() {
  size (600, 600, P3D);
  colorMode(HSB, 100);
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  song.play();
  origin = new PVector (width/2, 0);
  n = new Mover (width/2, 240);
  restLength = 200;
}

void draw() {
  background(0);

  int screenSize = int(width*height/spacing);
  int x = int(map(song.position(), 0, song.length(), 0, screenSize));
  int ySteps = x/width; 
  x -= width*ySteps; 

  float freqMix = song.mix.get(int(x));
  float freqLeft = song.left.get(int(x));
  float freqRight = song.right.get(int(x));
  float amplitude = song.mix.level();
  float size = freqMix * spacing/1.5 * amplification;
  float h = map(freqLeft, -1, 1, 75, 48);
  float s = map(freqRight, -1, 1, 0, 100);
  float b = map(freqMix, -1, 1, 90, 100);
  float opacity = map(amplitude, 0, 0.4, 0, 100);

  // rotating sphere
  PVector spring = PVector.sub(n.pos, origin);
  float currentLength = spring.mag();
  spring.normalize();
  float k = 0.05;
  float stretch = currentLength - restLength;
  spring.mult(-k * stretch);  
  n.applyForce(spring);
  PVector gravity = new PVector(0, 0.2);
  n.applyForce(gravity);
  n.update();
  n.display();


  // sound wave
  strokeWeight(3);
  stroke(255);
  rotateX(radians(-10));
  pushMatrix();
  translate(0, height/2);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float off = noise(i*0.04, j*0.04, frameCount * size/500)*200;
      pushMatrix();
      stroke(h, s, b, opacity);
      strokeWeight(3);
      translate(i*10, 2*off, j*10+off);
      point(amplitude, 0, size);
      popMatrix();
    }
  }
  popMatrix();

  beginShape();
  for (int i = 0; i < width; i += 20) {
    stroke(0, 100, 100);
    strokeWeight(10);
    vertex(i, map(noise(i*freq + offset), 0, 1, 0, 3*height/4+amplitude*100));
    offset += incr;
  }
  endShape();
}
