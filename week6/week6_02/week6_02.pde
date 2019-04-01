// bryan ma for code 2 sp 19

int scene = 0;

int state = 0;

String[] questions = {
  "Q1. You are lost in a gloomy forest and couldn't find a way out. You encountered some other travelers in the forest, who would you trust?", 
  "Q2: You are home alone. You hear a baby crying outside.You look through the window and see a stroller facing away from you. What do you do?", 
  "Q3: If you have to choose horror movie villians to spend a night with, who would you choose?", 
  "Q4: You are in a haunted house with friends. Your friends are leading the way. Suddenly, your friends disappears after they turned right in a corner. What would you do?", 
  "Result: Your personality type is:"
};

String[][]options = {
  {"Nobody. I'm better off myself", "A college student who is a backpacker", "An old lady selling home baked cookies"}, 
  {"Go outside and approach the baby", "Grabs weapon and call 911", "Panicking, wait for somebody to come home"}, 
  {"Anything, I will beat the crap out of it", "Leatherface (from the Texas Chainsaw Massacre)", "Dracula (from Hotel Transylvania)"}, 
  {"'They must be pranking me.' You made yourself at home", "Praying for evil things not to happen", "Pee your pants"}
};

int[] optionTargets = {
  1, 2, 3, 4, 5
};

int[] scores = {
  1, 2, 3
};

String [] results = {
  "You are SUPER brave, BRAVO!", 
  "You are brave and also SMART", 
  "You are lacking a bit of courage. A guadian Angel will protect you."
};


void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  textSize(30);
  fill(0);
  text(questions[state], 40, 40, 450, 300);

  textSize(20);
  int i = 0;
  for (String option : options[state]) {
    text(option, 40, 450 + i * 50);
    i++;
  }
}

void keyPressed() {
    for (int i = 0; i < optionTargets.length; i++) {
    if (keyCode - 49 == i) {
       state = optionTargets[i];
    }
  }
}
