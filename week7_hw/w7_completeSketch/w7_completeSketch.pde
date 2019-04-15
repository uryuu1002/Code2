// Ray's note: For some reason, in my API class Engine, the JSONArray docs
// can be printed using println(), and can be accessed and print out on canvas using text()
// BUT, after loading and printing the API out, the console gives me "NullPointerException",
// which also broke the code. I stoped styling my sketch since then. I think I completed more than 5 points
// to get the full grade for this sketch (correctly use API, visualize data, communicate rationally, wide range
// of data, interactive, classes/ objects as container and state machines), but I still want to talk to you in 
// class to fix this sketch..


import http.requests.*;

int state = 0;
int whichLevel = 0;

PFont f;
String typing = "";
String saved = "";

ScrollRect scrollRect;
float heightOfCanvas = 3000; 

SearchBox searchbox;


Engine engine;
String apiKey = "OY9L7eYd91XAHZ3u4XRTAVlaAQz2nD4v";
String query_term = "";
String beginDate = "20120101";
String endDate = "20190101";

void setup() {

  size(960, 540);
  scrollRect = new ScrollRect();
  searchbox = new SearchBox();
  engine = new Engine();
  background(90);
  smooth();

  f = createFont("Helvetica", 16);
}

void draw() {
  boolean shouldChangeLevel = true;

  switch(whichLevel) {
  case 0:
    background(90);
    searchbox.display();
    break;
  case 1:
    query_term = saved;
    background(90);
    scene();
    scrollRect.display();
    scrollRect.update();
    break;
  default:
    break;
  }
}

// Searching Engine using API

class Engine {
  Engine() {
  }
  void display() {
    float y = 130;
    float spacing = 50;

    GetRequest get = new GetRequest(
      "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=" + 
      query_term + "&facet_fields=source&facet=true&begin_date=" + beginDate + 
      "&end_date=" + endDate + "&api-key=" + apiKey);

    get.send();

    JSONObject data = parseJSONObject(get.getContent());
    JSONObject response = data.getJSONObject("response");
    JSONArray docs = response.getJSONArray("docs"); 
    println(docs);

    for (int i = 0; i < docs.size(); i++) {
      JSONObject element = docs.getJSONObject(i);

      // Article Title
      JSONObject headline = element.getJSONObject("headline");
      String title = headline.getString("main");
      textFont(f);
      textSize(20);
      fill(0);
      text("Title: "+ title, 50, y + spacing*i);

      // Article Leading Paragraph
      //String leadP = element.getString("lead_paragraph");
      ////println(leadP);
      //textFont(f);
      //textSize(20);
      //fill(0);
      //text("Abstract: "+ leadP, 50, y + spacing * 2);

      // Publish date
      //String pubDate = element.getString("pub_date");
      ////println(pubDate);
      //textFont(f);
      //textSize(20);
      //fill(0);
      //text("Publish Date: "+ pubDate, 50, y + spacing * 3);

      // Article type
      //String docType = element.getString("document_type");
      //println(docType);

      // Keywords contained
      //JSONArray keywords = element.getJSONArray("keywords");
      //for (int j = 0; j < keywords.size(); j++) {
      //  JSONObject element2 = keywords.getJSONObject(j);
      //  String value = element2.getString("value");
      //  //println(value);
      //  textFont(f);
      //  textSize(20);
      //  fill(0);
      //  text("Keywords: "+ value, 50, y + spacing * 4);
      //}

      // Article URL
      //String webURL = element.getString("web_url");
      ////println(webURL);
      //textFont(f);
      //textSize(20);
      //fill(0);
      //text("URL: "+ webURL, 50, y + spacing * 5);
    }
    textFont(f);
    textSize(35);
    fill(0);
    // Display everything
    text("Your Search Result is here", 250, 80);
    textSize(40);
    fill(255);
    text("Your Search Result is here", 250, 90);
  }
}

void changeState() {
  whichLevel++;
  if (whichLevel >1) {
    whichLevel = 0;
  }
}

// Text Input
// Original Code by: Daniel Shiffman
// Code from: http://learningprocessing.com/examples/chp18/example-18-01-userinput
// Modified by me, added backspace / delete function
void keyPressed() {
  // If the return key is pressed, save the String and clear it

  if (key == '\n' ) {
    saved = typing;
    changeState();
    // A String can be cleared by setting it equal to ""
    typing = "";
  } else if (key == BACKSPACE) {
    typing= typing.substring(0, max(0, typing.length()-1));
  } else if (key == DELETE) {
    typing= typing.substring(0, max(0, typing.length()-1));
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key;
  }
}

class SearchBox {
  SearchBox() {
  }
  void display() {
    textFont(f);
    textSize(35);
    fill(0);
    // Display everything
    text("Type any name you want to search using API ", 160, 80);

    textSize(40);
    fill(255);
    text("Type any name you want to search using API ", 100, 90);

    textSize(35);
    text("Please type: " + typing, 50, height/2);

    textSize(20);
    fill(0);
    text("Press ENTER to view Results", width/2-130, height/2 + 150);

    fill(255, 0, 0);
    rect(width/2-100, height/2+160, 200, 60);
    noStroke();

    textSize(40);
    fill(0);
    text("NEXT", width/2-85, height/2 + 205);
  }
}


// Scroll Bar Function
// Code by: Processing Forum User#: Chrisir
// Code from: https://forum.processing.org/two/discussion/27860/in-processing-
// how-to-add-a-scroll-bar-to-the-window

void scene() {
  pushMatrix();
 
  // reading scroll bar 
  float newYValue = scrollRect.scrollValue();  
  translate (0, newYValue);
 
  // The scene :
     engine.display();
  text("End of virtual canvas", 380, heightOfCanvas-16);    
  fill(122); 
  popMatrix();
}

void mousePressed() {
  scrollRect.mousePressedRect();
}

void mouseReleased() {
  scrollRect.mouseReleasedRect();
}

class ScrollRect {

  float rectPosX=0;
  float rectPosY=0;
  float rectWidth=14; 
  float rectHeight=30;

  boolean holdScrollRect=false; 

  float offsetMouseY; 

  //constr
  ScrollRect() {
    // you have to make a scrollRect in setup after size()
    rectPosX=width-rectWidth-1;
  }//constr

  void display() {
    fill(122);
    stroke(0);
    line (rectPosX-1, 0, 
      rectPosX-1, height);
    rect(rectPosX, rectPosY, 
      rectWidth, rectHeight);

    // Three small lines in the center   
    centerLine(-3); 
    centerLine(0);
    centerLine(3);
  }

  void centerLine(float offset) {
    line(rectPosX+3, rectPosY+rectHeight/2+offset, 
      rectPosX+rectWidth-3, rectPosY+rectHeight/2+offset);
  }

  void mousePressedRect() {
    if (mouseOver()) {
      holdScrollRect=true;
      offsetMouseY=mouseY-rectPosY;
    }
  }

  void mouseReleasedRect() {
    scrollRect.holdScrollRect=false;
  }

  void update() {
    // dragging of the mouse 
    if (holdScrollRect) {
      rectPosY=mouseY-offsetMouseY;
      if (rectPosY<0)
        rectPosY=0;
      if (rectPosY+rectHeight>height-1)
        rectPosY=height-rectHeight-1;
    }
  }

  float scrollValue() {
    return
      map(rectPosY, 
      0, height-rectHeight, 
      0, - (heightOfCanvas - height));
  }

  boolean mouseOver() {
    return mouseX>rectPosX&&
      mouseX<rectPosX+rectWidth&&
      mouseY>rectPosY&&
      mouseY<rectPosY+rectHeight;
  }
}
