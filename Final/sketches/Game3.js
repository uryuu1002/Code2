var buildings;
var girls;
var coins;
var score;
var counter = 0;
var interval;

const sound2 = new Tone.Synth({
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
sound2.toMaster();

function Game3() {

  this.enter = function() {
    createCanvas(800, 800);
    buildings = new Group();
    girls = new Group();
    score = 0;
    
    var gif_bubbles = loadImage("https://media.giphy.com/media/ll5xqdq1kbh42zPbRE/giphy.gif");
    var gif_blossom = loadImage("https://media.giphy.com/media/c6XtUeeg3Kw5rsbxGa/giphy.gif");
    var gif_buttercup = loadImage("https://media.giphy.com/media/5aY2Nwzk7uXnoV3lgK/giphy.gif");

    coins = new Group();
    for (var i = 0; i < 10; i++) {
      var e = createSprite(
        random(100, width - 100),
        random(100, height / 2),
        20, 20);
      e.shapeColor = color(255, 255, 0);
      coins.add(e);
    }


    for (var i = 0; i < 10; i++) {
      var c = createSprite(
        random(width), height,
        random(50, 150), random(50, height / 2));
      c.shapeColor = color(random(200, 255));
      buildings.add(c);
    }
    var z = createSprite(
      random(width), random(height), 100, 100);
    z.addImage(gif_bubbles);
    z.maxSpeed = random(1, 6);
    z.scale = 0.3;
    z.rotateToDirection = false;

    var x = createSprite(
      random(width), random(height), 100, 100);
    x.addImage(gif_blossom);
    x.maxSpeed = random(1, 6);
    x.scale = 0.3;
    x.rotateToDirection = false;

    var v = createSprite(
      random(width), random(height), 100, 100);
    v.addImage(gif_buttercup);
    v.maxSpeed = random(1, 6);
    v.scale = 0.3;
    v.rotateToDirection = false;
    girls.add(x);
    girls.add(v);
    girls.add(z);

  }

  this.draw = function() {
    background(0);

    fill(255);
    noStroke();
    textSize(20);
    textAlign(CENTER, CENTER);
    if (coins.length > 0) {
      text("Move mouse to collect all coins!", 0, 0, 200, 200);
      textSize(72);
      text(score, 0, 100, 200, 200);
    } else {
      textSize(72);
      text("YOU WIN!", width / 2, height / 2);
      
      girls.removeSprites();
      buildings.removeSprites();
      
      interval = setInterval(timeIt, 500);
      if (counter > 200) {
        this.sceneManager.showScene(Game4);
      }
      
    }

    for (var i = 0; i < buildings.length; i++) {
      buildings[i].position.x += buildings[i].width * 0.01;
      if (buildings[i].position.x > width) {
        buildings[i].position.x = 0;
      }
    }
    for (var j = 0; j < girls.length; j++) {
      girls[j].attractionPoint(0.2, mouseX, mouseY);
      girls[j].overlap(coins, getCoin);
    }
    drawSprites();
  }

  function getCoin(player, coin) {
    coin.remove();
    score += 1;
    sound.triggerAttackRelease('A6', "16n");
  }

  function timeIt() {
    counter++;
  }

}