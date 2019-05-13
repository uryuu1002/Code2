var girl;

//it's advisable (but not necessary) to load the images in the preload function
//of your sketch otherwise they may appear with a little delay
function preload() {

  //create an animation from a sequence of numbered images
  //pass the first and the last file name and it will try to find the ones in between
  girl = loadAnimation('frames/frame_001.png','frames/frame_002.png','frames/frame_003.png','frames/frame_004.png','frames/frame_005.png','frames/frame_006.png','frames/frame_007.png','frames/frame_008.png','frames/frame_009.png','frames/frame_010.png','frames/frame_011.png','frames/frame_012.png','frames/frame_013.png','frames/frame_014.png','frames/frame_015.png');
}

  function Loading() {

    this.draw = function() {
  background(0);
  // animation(girl, width/2, height/2-50);
  fill(255);
  noStroke();
  textSize(72);
  textAlign(CENTER, CENTER);
  text("Press 1 to start Game", 100, height/2-200, 600,300);
  text("Loading...", width/2, height-150);

    }
    this.keyPressed = function() {
      if (key == '1') {
        this.sceneManager.showScene(Game1, key);
      }
    }
  }