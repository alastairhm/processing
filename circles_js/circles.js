var circles = [];

function setup() {
  createCanvas(1024, 512);
  var protection = 0;
  var maxp = 10000;
  var maxc = 1000;

  while (circles.length < maxc && protection < maxp) {
    protection++;
    var circle = {
      x: random(width),
      y: random(height),
      r: random(5, width / 10),
      p: protection,
    };
    var overlapping = false;
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
    fill(255,100, 0, map(circles[i].p,0,maxp,0,255));
    ellipse(circles[i].x, circles[i].y, circles[i].r * 2, circles[i].r * 2);
  }
}

function draw() {
}

