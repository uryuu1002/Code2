Table data;
void setup() {
  size(400, 400);
  data = loadTable("data.csv", "header");

  for (int i = 0; i < data.getRowCount(); i++) {
    TableRow row = data.getRow(i);
    int x = data.getRow(i).getInt("x");
    int y = data.getRow(i).getInt("y");
    int siz = data.getRow(i).getInt("size");
    int r = data.getRow(i).getInt("r");
    int g = data.getRow(i).getInt("g");
    int b = data.getRow(i).getInt("b");
    
    fill(r,g,b);
    ellipse(x,y,siz,siz);
  }
  //print string from csv file
  // get the first row info from csv files
  //TableRow row = data.getRow(0);
  //println(row.getString(2));
  //  for (int i = 0; i < row.getColumnCount(); i++){
  //    textSize(36);
  //    text(row.getString(i),100,100*1);
  //  }
}

void draw() {
}

void mousePressed(){
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
  
  
  //data name, then save it at the path of the original
  //saves data after click
  saveTable(data, "data.csv");
}
