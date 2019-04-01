//class based approach
//global state
//move values to external data

//open
//child Button class
//have the button states represented more visually

int state = 0;
JSONArray values;

color c1 = #e6ffc8;
color c2 = #ffc8e6;
color [] bgColors = {
  c1, c2
};


int numOfButtons = 2;
Button [] buttons = new Button [numOfButtons];

int spacing = 240;
int buttonY = 200;
int buttonSize = 125;

String textToShow = "";

void setup() {
  size(600, 600);
  for (int i = 0; i < buttons.length; i++) {
    if (i == 1) {
      buttons[i] = new LargeButton(180 + i * spacing, buttonY);
    } else {
      buttons[i] = new SmallButton(180 + i * spacing, buttonY);
    }
  }

  values = new JSONArray();

  for (int i = 0; i < buttons.length; i++) {

    JSONObject value = new JSONObject();

    value.setInt("button#", i);
    value.setString("whichButtonisPressed", "button" + i + " is pressed!" );
    value.setInt("bgColors", bgColors[i]);

    values.setJSONObject(i, value);
  }

  saveJSONArray(values, "data/new.json");
}

void draw() {
  background(bgColors[state]);

  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    buttons[i].update();
    buttons[i].mousePressed();
  }
}

class Button {
  float x, y, s;
  color ecolor;
  Button(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    if (dist(mouseX, mouseY, x, y) < s/2 && mousePressed) {
      for (int i = 0; i < numOfButtons; i++) {
        textToShow = "button " + i + " pressed!";
      }
      ecolor = 0;
    } else {
      ecolor = 255;
    }
  }

  void display() {
    fill(ecolor);
    ellipse(x, y, s, s);
    fill(0);
    textAlign(CENTER);
    textSize(28);
    text(textToShow, width/2, 400);
  }

  void mousePressed() {
    switch (state) {
    case 0:
    case 1:
      if (dist(mouseX, mouseY, x, y) < s/2 && mousePressed) {
        advance();
        break;
      }
    }
  }
  void advance() {
    state ++;
    if (state > 1) {
      state = 0;
    }
  }
}
