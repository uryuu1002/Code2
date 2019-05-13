var girl;
var walls;
var animal;
var move = 50;

const sound3 = new Tone.Synth({
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
sound3.toMaster();

function Game4() {
  
  var counter = 0;
  var interval;

  this.enter = function() {
createCanvas(800, 800);
  var gif_bubbles = loadImage("https://media.giphy.com/media/ll5xqdq1kbh42zPbRE/giphy.gif");
  var octi = loadImage("resource/octi.gif");
  
  girl = createSprite(
      35, height-25,25, 25);
    girl.addImage(gif_bubbles);
    girl.maxSpeed = 6;
    girl.scale = 0.15;
  
  animal= createSprite(
    35, height-50, 25,25);
    animal.addImage(octi);
    animal.maxSpeed = 6;
    animal.scale = 0.3;
  
  walls = new Group();
    var w1 = createSprite(475, height-75, width, 200);
    var w2 = createSprite(250,height-150,350,50);
    var w3 = createSprite(0,height-325,550,50);
    var w4 = createSprite(300,height-525,50,450);
    var w5 = createSprite(625,height-375,400,500);
    var w6 = createSprite(675,height-775,800,100);
    var w7 = createSprite(825,height-600,800,50);
  walls.add(w1);
  walls.add(w2);
  walls.add(w3);
  walls.add(w4);
  walls.add(w5);
  walls.add(w6);
  walls.add(w7);

  }

  this.draw = function() {
    background(0);
  
  fill(255);
  noStroke();
  textSize(20);
  textAlign(CENTER, CENTER);
  
  if(animal.position.x < height){
      text("Move mouse to help Octi escape with in the tunnel!", 10, 0, 250,200);
      
    } else{
      textSize(72);
      text("YOU WIN!", width/2, height/2);
      girl.remove();
      animal.remove();
      walls.removeSprites();
      interval = setInterval(timeIt, 500);
      if (counter > 200) {
        this.sceneManager.showScene(Game2);
      }
    
    }
  
  girl.position.x = mouseX;
  girl.position.y = mouseY;
  girl.collide(walls);
  girl.displace(animal);
  animal.collide(walls);

    drawSprites();
  }

  function timeIt() {
    counter++;
  }



}