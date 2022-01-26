var circles = [];

function setup() {
  createCanvas(1024, 512);
  var protection = 0;
  var maxp = 20000;
  var maxc = 3000;

  while (circles.length < maxc && protection < maxp) {
    protection++;
    var circle = {
      x: random(width),
      y: random(height),
      r: random(3, width / 10),
      p: protection,
    };
    var overlapping = false;
    if (circle.x < circle.r || (circle.x+circle.r) > width){
      overlapping = true;
    }
    if (circle.y < circle.r || (circle.y+circle.r) > height){
      overlapping = true;
    }
    for (var j = 0; j < circles.length; j++) {
      var other = circles[j];
      var d = dist(circle.x, circle.y, other.x, other.y);
      if (d < circle.r + other.r) {
        overlapping = true;
        break;
      }
    }
    if (!overlapping) circles.push(circle);
  }

  for (var i = 0; i < circles.length; i++) {
    fill(255,100,0,map(circles[i].p,0,maxp,0,255))
    ellipse(circles[i].x, circles[i].y, circles[i].r * 2, circles[i].r * 2);
  }
}

function draw() {}
