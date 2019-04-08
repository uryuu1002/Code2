import http.requests.*;

int state = 0;
int whichLevel = 0;

int indent = 25;
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
  scrollRect.display();
  scrollRect.update();

  boolean shouldChangeLevel = true;

  switch(whichLevel) {
  case 0:
    background(90);
    searchbox.display();
    break;
  case 1:
    query_term = saved;
  }
}

// Searching Engine using API

class Engine {
  Engine() {
    GetRequest get = new GetRequest(
      "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=" + 
      query_term + "&facet_fields=source&facet=true&begin_date=" + beginDate + 
      "&end_date=" + endDate + "&api-key=" + apiKey);

    get.send();
    JSONObject response = parseJSONObject(get.getContent());
    JSONObject response_obj = response.getJSONObject("response");
    JSONArray docs = response_obj.getJSONArray("docs"); 

    for (int i = 0; i < docs.size(); i++) {
      JSONObject element = docs.getJSONObject(i);

      // Article Title
      JSONObject headline = element.getJSONObject("headline");
      String title = headline.getString("main");
      //println(title);

      // Article Leading Paragraph
      String leadP = element.getString("lead_paragraph");
      //println(leadP);

      // Publish date
      String pubDate = element.getString("pub_date");
      //println(pubDate);

      // Article type
      String docType = element.getString("document_type");
      //println(docType);

      // Keywords contained
      JSONArray keywords = element.getJSONArray("keywords");
      for (int j = 0; j < keywords.size(); j++) {
        JSONObject element2 = keywords.getJSONObject(j);
        String value = element2.getString("value");
        //println(value);
      }

      // Article URL
      String webURL = element.getString("web_url");
      //println(webURL);
    }
  }
  void display() {
    textFont(f);
    fill(0);
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
    fill(0);
    // Display everything
    text("Type any name you want to search using API ", indent, 40);
    text("Input: " + typing, indent, 190);
    //text("Saved text: " + saved, indent, 230);
  }
}

// Scroll Bar Function
// Code by: Processing Forum User#: Chrisir
// Code from: https://forum.processing.org/two/discussion/27860/in-processing-
// how-to-add-a-scroll-bar-to-the-window
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
