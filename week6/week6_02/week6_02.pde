int state = 0;
int score = 0;
int result;
int whichLevel = 0;

String[] arrayOfImageFilenames = new String [4];
PImage[] arrayOfPImages = new PImage [arrayOfImageFilenames.length];

String[] resultPhotoNames = new String [3];
PImage[] resultPhotos = new PImage [resultPhotoNames.length];

String[] questions = {
  "Q1. You are lost in a gloomy forest and couldn't find a way out. You encountered some other travelers in the forest, who would you trust?", 
  "Q2: You are home alone. You hear a baby crying outside.You look through the window and see a stroller facing away from you. What do you do?", 
  "Q3: If you have to choose horror movie villians to spend a night with, who would you choose?", 
  "Q4: You are in a haunted house with friends. Your friends are leading the way. Suddenly, your friends disappears after they turned right in a corner. What would you do?", 
};

String[][]options = {
  {"Nobody. I'm better off myself", "A college student who is a backpacker", "An old lady selling home baked cookies"}, 
  {"Go outside and approach the baby", "Grabs weapon and call 911", "Panicking, wait for somebody to come home"}, 
  {"Anything, I will beat the crap out of it", "Leatherface (from the Texas Chainsaw Massacre)", "Dracula (from Hotel Transylvania)"}, 
  {"'They must be pranking me.' You made yourself at home", "Praying for evil things not to happen", "Pee your pants"}, 
};

String [] results = {
  "You are SUPER brave, BRAVO!", 
  "You are brave and also SMART!", 
  "You are lacking a bit of courage. A guadian Angel will protect you!"
};


void setup() {
  size(600, 600);
  for (int i = 0; i < arrayOfImageFilenames.length; i++) {
    arrayOfImageFilenames[i] = i + ".jpeg";
    arrayOfPImages[i] = loadImage(arrayOfImageFilenames[i]);
  }

  for (int i = 0; i < resultPhotoNames.length; i++) {
    resultPhotoNames[i] = "a" + i + ".jpeg";
    resultPhotos[i] = loadImage(resultPhotoNames[i]);
  }
}

void draw() {
  boolean shouldChangeLevel = true;

  switch(whichLevel) {
  case 0: 
    background(0);
    textSize(64);
    fill(255);
    text("How Brave Are You Actually?", 50, 100, 450, 300);

    textSize(12);
    text("Press 1 to select Option1", width/3, height/2 + 100);
    text("Press 2 to select Option2", width/3, height/2 + 130);
    text("Press 3 to select Option3", width/3, height/2 + 160);
    textSize(20);
    text("Press ENTER to continue", width/3-20, height/2 + 190);
    break;

  case 1:
  case 2: 
  case 3: 
  case 4: 
    background(0);
    textSize(25);
    fill(255);
    text(questions[state], 40, 40, 450, 300);

    textSize(20);
    int i = 0;
    for (String option : options[state]) {
      text(option, 40, 450 + i * 50);
      i++;
      for (int k = 0; k < arrayOfImageFilenames.length; k++) {
        float prop = arrayOfPImages[k].width/ arrayOfPImages[k].height;
        image (arrayOfPImages[state], width/3, height/2, 200, 120 * prop);
      }
    }

    break;

  case 5:
    background(0);
    fill(255);
    textSize(64);
    text("Your result is", 100, 100);

    textSize(20);
    text(results[result], width/5, height/2, 400, 350);
    text("Your score is:" + score, width/5, height/2 + 100, 400, 350);

    float prop = resultPhotos[result].width/ resultPhotos [result].height;
    image (resultPhotos[result], width/3, height/2-150, 200, 120 * prop);

    if (score >= 1 && score <=4) {
      result = 0;
    }
    if (score >= 5 && score <=8) {
      result = 1;
    }
    if (score >= 9 && score <=12) {
      result = 2;
    }
    break;
  default:
    break;
  }
}

void changeState() {
  whichLevel++;
  if (whichLevel >5){
    whichLevel = 0;
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    whichLevel = 1;
  }
  if (keyCode == 49 || keyCode == 50 || keyCode == 51) {
    changeState();
  }

  for (int i = 0; i < questions.length; i++) {
    if (i <= 3  && keyCode - 49 == i) {
      state ++;
      score = score + i + 1;
    }
  }
}
