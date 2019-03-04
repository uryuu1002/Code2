// bryan ma for code 2 sp 19 A

Table data;

void setup() {
  size(600,600);
  data = loadTable("data.csv", "header");
  
  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    int x = row.getInt("x");
    int y = row.getInt("y");
    int size = row.getInt("size");
    int r = data.getRow(i).getInt("r");
    int g = data.getRow(i).getInt("g");
    int b = data.getRow(i).getInt("b");
    
    fill(r,g,b);
    ellipse(x, y, size, size);
  }
}

void draw() {}

void mousePressed() {
int s = int(random (100,200));
  fill(int(map(mouseX, 0, width, 0, 255)),int(map(mouseY, 0, height, 0, 255)),int(map(mouseX, 0, width, 0, 255)));
  ellipse(mouseX, mouseY, s, s);
  
  TableRow newRow = data.addRow();
  newRow.setInt("x", mouseX);
  newRow.setInt("y", mouseY);
  newRow.setInt("size",s);
  newRow.setInt("r", int(map(mouseX, 0, width, 0, 255)));
  newRow.setInt("g", int(map(mouseY, 0, height, 0, 255)));
  newRow.setInt("b", int(map(mouseX, 0, width, 0, 255)));
  
  saveTable(data, "data/data.csv");
}
