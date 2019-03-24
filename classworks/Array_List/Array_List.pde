ArrayList <Sprocket> sprockets;

void setup(){
  sprockets = new ArrayList<Sprocket>();
  for (int i = 0; i < 100; i++){
  Sprocket newSprocket = new Sprocket();
  sprockets.add(newSprocket);
  }
  
  //for (int i = 0; i < 100; i++){
  //call the report() method of all the sprockets, temporary
  //reference the class Sprocket
  
  //Sprocket s = sprockets.get(i);
  //s.report();
  //}
  
  for (Sprocket s : sprockets){
    s.report();
    
  }
  
// if want to remove, remove at position i; which position in the arraylist
// needs to be removed
//for (int i = 0; i < 100; i++){
//  sprockets.remove(i);
//}
  
}

void draw(){
}


class Sprocket{
  int num = 0;
  
  Sprocket(){  
  }
  
  void report(){
    println("sprockets!");
  }
}
