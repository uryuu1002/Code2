String [] data;

// data.length = how many char is in that string
// data.split = look through strings whenever the delimeter appears
// then create a new array of strings that made of whats in between
// the delimeters

void setup(){
  size (600,600);
  // load txt only reads array, therefore it has to be String[]
  data = loadStrings("dataPos.txt");
  String[] splitData = data[0].split(",");
  String[] splitDataSiz = data[1].split(",");
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
