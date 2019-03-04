String dataPos = "0,1,2,3,4,5";
String dataSiz = "50,75,100,25,30,80";

// data.length = how many char is in that string
// data.split = look through strings whenever the delimeter appears
// then create a new array of strings that made of whats in between
// the delimeters

void setup(){
  size (600,600);

  String[] splitData = dataPos.split(",");
  String[] splitDataSiz = dataSiz.split(",");
  // whole thing
  println(splitData);
  // Second character
  // println(splitData[1]);
  // How long is the aray
  // println(splitData.length);
  
  for (int i = 0; i < splitData.length; i++){
    print(splitData[i]);
    ellipse(50 + int(splitData[i]) * 100, height/2, int(splitDataSiz[i]), 
    int(splitDataSiz[i]));
  }
  
}

void draw(){

}
