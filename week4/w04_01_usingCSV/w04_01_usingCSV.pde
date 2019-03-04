// bryan ma for code 2 sp19 A

// replace the sizes integer array with csv data loaded externally.

Table data;


void setup() {
  size(800, 600);
  data = loadTable("data.csv","header");
  
  Vert[]verts = new Vert[data.getRowCount()];

  
  for (int i = 0; i < data.getRowCount(); i++){
    TableRow row = data.getRow(i);
    int siz = data.getRow(i).getInt("siz");
    verts[i]= new Vert(i,siz);
    verts[i].display();
  }

  rectMode(CENTER);

}

void draw() {
}
