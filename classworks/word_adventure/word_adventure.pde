// state = screen
// text to display for each screen (state representation)
// options to choose for each screen (state transitions)

// string for each text
// string for each option (describe what are users gonna pick) - which corresponds
// to a keypress
// modulus operator % (modulo pl.)

int state = 0;
String[] descriptions = {
  "State 0", 
  "State 1", 
  "State 2"
};

String[][] options = {
  {"try to wake up", "ask a question",}, 
  {"you sleep"}, 
  {"struggle to stay awake", "enjoy the sweet surrender of sleep"}
};

int[][] optionTargets = {
  {1,2},
  {0},
  {1,0}
};

void setup() {
  size (600, 600);
}

void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(descriptions[state], 40, 40, 450, 300);

  textSize(24);
  int i = 0;
  for (String option : options[state]) {
    text(option, 40, 400+i*50);
    i++;
  }
}

void keyPressed() {
  //  state = (state + 1) % 3;
  for (int i = 0; i < optionTargets[state].length; i++) {
    if (keyCode - 49 == i) {
      state = optionTargets[state][i];
    }
  }
}

class Scene{
  
}
