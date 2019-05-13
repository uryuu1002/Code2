var girl;
var enemies;
var lasers;
var move = 15;
var posx, posy;

const sound = new Tone.Synth({
  oscillator: {
    type: 'triangle', // sine, square, triangle, sawtooth, fat*
  },
  envelope: {
    attack: 0.1,
    decay: 0.1,
    sustain: 0.5,
    release: 2,
  },
});
sound.toMaster();

function Game2() {
  
  var counter = 0;
var interval;

  this.enter = function() {
    createCanvas(800, 800);
    var gif_buttercup = loadImage("https://media.giphy.com/media/5aY2Nwzk7uXnoV3lgK/giphy.gif");
    var mojojojo = loadImage("resource/mojo.png");

    enemies = new Group();
    for (var i = 0; i < 10; i++) {
      var enemy = createSprite(
        random(width),
        random(height - 300),
        20, 20);
      enemy.addImage(mojojojo);
      enemy.setSpeed = 0.1;
      enemy.scale = 0.2;
      enemies.add(enemy);
      enemy.immovable = true;
    }

    girl = createSprite(width / 2, height - 50, 100, 100);
    girl.addImage(gif_buttercup);
    girl.setSpeed = 10;
    girl.scale = 0.3;
    girl.immovable = true;

    lasers = new Group();

  }

  this.draw = function() {
    background(0);
    fill(255);
    noStroke();
    textSize(20);
    textAlign(CENTER, CENTER);

    if (enemies.length > 0) {
      text("Press X or Left-click mouse to shoot laser!", 10, 0, 200, 200);

    } else {
      textSize(72);
      text("YOU WIN!", width / 2, height / 2);
      girl.remove();
      enemies.removeSprites();
      interval = setInterval(timeIt, 500);
      if (counter > 200) {
        this.sceneManager.showScene(Game1);
      }

    }


    girl.position.x = constrain(mouseX, girl.width / 2, width - girl.width / 2);

    if (keyWentDown('x') || mouseWentDown(LEFT)) {
      var q = createSprite(girl.position.x, girl.position.y, 30, height * 2);
      q.shapeColor = color(255);
      q.life = 10;
      q.setSpeed(girl.getSpeed());
      var w = createSprite(girl.position.x, girl.position.y, 10, height * 2);
      w.shapeColor = color(127, 249, 102);
      w.life = 10;
      w.setSpeed(girl.getSpeed());
      lasers.add(q);
      lasers.add(w);
      sound.triggerAttackRelease('C4', "8n");
    }

    for (var i = 0; i < enemies.length; i++) {
      enemies[i].attractionPoint(0.002, girl.position.x, girl.position.y);
      enemies[i].overlap(lasers, enemyHit);
    }



    drawSprites();
  }


  function enemyHit(enemy, laser) {
    enemy.remove();
  }

  function timeIt() {
    counter++;
  }



}