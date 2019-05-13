function setup() {
  createCanvas(800, 800);

  var mgr = new SceneManager();
  
  mgr.wire();
  mgr.showScene(Loading);
}