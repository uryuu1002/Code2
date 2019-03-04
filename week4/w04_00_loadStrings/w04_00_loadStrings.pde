// bryan ma for code 2 sp 19 A
// used class Vert from week 3 HW



String[] data;

void setup() {
  data = loadStrings("dataPos.txt");
  String[] splitData = data[0].split(",");
  String[] splitDataSiz = data[1].split(",");
  Vert[] verts = new Vert[splitData.length];

  size(600, 600);
  
  for (int i = 0; i < splitData.length; i++) {
    verts[i] = new Vert(int(splitData[i]), int(splitDataSiz[i]));
    verts[i].display();

  }
}

void draw() {

}
