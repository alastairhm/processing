var video;
var vScale = 8;
var particle = [];
var maxp = 50;
var slider;

function setup() {
  createCanvas(640, 480);
  pixelDensity(1);
  video = createCapture(VIDEO);
  video.size(width/vScale, height/vScale);
  for (var i=0; i < maxp; i++){
    particle[i] = new Particle(random(width), random(height));
  }
  background(51);
  slider = createSlider(0, 255, 127);
}

function draw() {
  video.loadPixels();
  for (var i=0;i<maxp;i++){
    particle[i].update();
    particle[i].show();
  }
}