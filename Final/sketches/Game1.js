let idx;
let data = {};
let keyboards = [];


var player = new Tone.Players({
  "kick": 'https://cdn.jsdelivr.net/gh/Tonejs/Tone.js/examples/audio/505/kick.mp3',
  "snare": 'https://cdn.jsdelivr.net/gh/Tonejs/Tone.js/examples/audio/505/snare.mp3',
  "hihat": 'https://cdn.jsdelivr.net/gh/Tonejs/Tone.js/examples/audio/505/hh.mp3',
  "clap": 'resource/applause.mp3',

}, function() {});

const synth = new Tone.Synth({
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
synth.toMaster();

var vol = new Tone.Volume(-12).toMaster();

var reverb = new Tone.Freeverb(0.4).connect(vol);
var vibrato = new Tone.Vibrato(4, 0.3).connect(vol);

var polySynth = new Tone.PolySynth(3, Tone.FMSynth);
polySynth.connect(vibrato);
player.connect(vibrato);

var seq = new Tone.Sequence(function(time, idx) {
  if ([15].indexOf(idx) >= 0)
    player.get('clap').start();
  if ([5, 13].indexOf(idx) >= 0)
    player.get('snare').start();
  if ([1, 2, 7, 9, 10, 12].indexOf(idx) >= 0)
    player.get('kick').start();
  if ([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14].indexOf(idx) >= 0)
    player.get('hihat').start();


  var chords = [
    ['C3', 'D3', 'E3'],
    ['F3', 'G3', 'A3'],
  ];

  var chordIndex = -1;
  if (idx === 1) chordIndex = 0;
  if (idx === 9) chordIndex = 1;


  if (chordIndex >= 0) {
    polySynth.triggerAttackRelease(chords[chordIndex][0], '8n');
    polySynth.triggerAttackRelease(chords[chordIndex][1], '8n', '+4n');
    polySynth.triggerAttackRelease(chords[chordIndex][2], '8n', '+2n');
  }

}, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], "8n");


function preload() {
  data = loadJSON('resource/keyboard.json');
  img = loadImage('resource/hand.png');
}

function loadData() {
  var keyData = data['keyboard'];
  for (var i = 0; i < keyData.length; i++) {
    // Get each object in the array
    let piano = keyData[i];
    // Get a position object
    let position = piano['position'];
    // Get x,y from position
    let x = position['x'];
    let y = position['y'];

    // Get diameter and label
    let size = piano['size'];
    let sizx = size['sx'];
    let sizy = size['sy'];
    let label = piano['label'];
    // Put object in array
    keyboards.push(new Keyboard(x, y, sizx, sizy, label));
  }
}

function Game1() {
  this.setup = function() {
    loadData();
    button = createButton('Add beat');
    button.position(width / 2 - 75, height - 100);
    button.mousePressed(playSong);
    



  }

  this.draw = function() {
    rectMode(CENTER);
    background(0);

    fill(255);
    textSize(20);
    text("Good job! Lets play some piano and rest!", width / 2, 200, 600, 200);
    text("Play with the keys first, then add beats!", width / 2, 230, 600, 200);


    for (let i = 0; i < keyboards.length; i++) {
      keyboards[i].display();
      keyboards[i].rollover(mouseX, mouseY);
    }

    image(img, mouseX, mouseY);
  

  }

  this.mouseClicked = function() {
    for (let i = 0; i < keyboards.length; i++) {
      keyboards[i].checkClicked();
    }
  }
}

function playSong() {
  Tone.context.latencyHint = 'fastest';
  Tone.Transport.bpm.value = 150;
  Tone.Transport.start('+0.2');
  seq.start();
}


class Keyboard {
  constructor(x, y, sizx, sizy, name) {
    this.x = x;
    this.y = y;
    this.sizx = sizx;
    this.sizy = sizy;
    this.name = name;
    this.over = false;
  }

  rollover(px, py) {
    if (px < this.x + this.sizx / 2 && px > this.x - this.sizx / 2 && py < this.y + this.sizy / 2 && py > this.y - this.sizy / 2) {
      this.over = true;
    } else {
      this.over = false;
    }
  }

  display() {
    stroke(0);
    strokeWeight(3);
    fill(255);
    rect(this.x, this.y, this.sizx, this.sizy);
    if (this.over) {
      fill(0);
      textAlign(CENTER);
      textSize(45);
      text(this.name, this.x, this.y + 30);
    }
  }

  checkClicked() {
    if (this.over) {
      synth.triggerAttackRelease(this.name, "8n");
    }
  }
}