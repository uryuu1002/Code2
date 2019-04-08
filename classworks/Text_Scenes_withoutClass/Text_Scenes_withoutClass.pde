// state = screen
// text to display for each screen   (state representation)
// options to choose for each screen (state transitions)

// string for each text
// string for each option - corresponds to a keypress

// without class

int state = 0;

String[] descriptions = {
  "You wake up in Code 2 class and don't know what is going on",
  "your eyelids feel so heavy, and you fail to wake up",
  "you feel enlightened by the answer, but still fall asleep",
};

String[][] options = {
  {"try to wake up", "ask a question"},
  {"you sleep"},
  {"struggle to stay awake", "enjoy the sweet surrender of sleep"}
};

int[][] optionTargets = {
  {1, 2},
  {0},
  {1, 0},
};

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  textSize(40);
  fill(0);
  text(descriptions[state], 40, 40, 450, 300);
  
  textSize(24);
  int i = 0;
  for (String option : options[state]) {
    text(option, 40, 450 + i * 50);
    i++;
  }
}

void keyPressed() {
  //state = (state + 1) % descriptions.length;
  //if (keyCode == 49) {
  //  state = optionTargets[state][0];
  //}
  //if (keyCode == 50) {
  //  state = optionTargets[state][1];
  //}
  //if (keyCode == 51) {
  //  state = optionTargets[state][2];
  //}
  
  for (int i = 0; i < optionTargets[state].length; i++) {
    if (keyCode - 49 == i) {
       state = optionTargets[state][i];
    }
  }
}
