void setup() {
  size(600, 600, P3D);//let processing use another render system
}

void draw() {
  background(255);

  // Lighting
  //lights();

  // Different light types
  ambientLight(0, 0, 255);
  directionalLight(255, 0, 200, 0, 0, -1);
  pointLight(255, 255, 199, mouseX, mouseY, 100);

  //perspective camera;
  //float cameraZ = (height/2);
  //perspective(PI/3, float(mouseX)/float(mouseY), cameraZ/10, cameraZ*10);
  
  //orthographic Camera
    ortho(-width/2, width/2, -height/2, height/2);

  rectMode(CENTER);
  translate(width/2, height/2, -mouseX);
  //3D Rotation in differnt plane
  rotateX(radians(frameCount*0.3));
  rotateY(radians(frameCount*0.5));  
  rotateZ(radians(frameCount*0.1));

  // 2 planes of a box
  //fill(255);
  //rect(0, 0, 200, 200);

  //rotateY(radians(90));
  //translate(100,0,100);
  //fill(0);
  //rect(0,0,200,200);

  // Line made 3D sqaure frame, add the rotation will rotate it
  //line(-100, -100, 100, 100, -100, 100);
  //line(100, -100, 100, 100, 100, 100 );
  //line(100, 100, 100, -100, 100, 100);
  //line(-100, 100, 100, -100, -100, 100);

  //line(-100, -100, -100, 100, -100, -100);
  //line(100, -100, -100, 100, 100, -100 );
  //line(100, 100, -100, -100, 100, -100);
  //line(-100, 100, -100, -100, -100, -100);

  // box
  //box(100);

  // sphere, can make a simpler sphere using sphere Detail
  //sphereDetail(int(map(mouseX, 0, width, 0,12)));
  //sphere(80);


  fill(255);
  box(100);
}
