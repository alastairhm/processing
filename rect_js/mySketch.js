var shapes = [];
var maxp = 20000;
var maxc = 3000;
var counter = 0;

class Rectangle {
	constructor(x, y, w, h, p) {
		this.x = x;
		this.y = y;
		this.w = w;
		this.h = h;
		this.p = p;
		this.s = 1.1;
	}

	draw() {
		this.drawShape(this.x, this.y, this.w, this.h,map(this.p,0,maxp,200,0));
	}
	
	drawShape(x,y,w,h,a) {
		rectMode(CENTER);
		noStroke();
		fill(50,50,200,200-a);
		rect(x, y, w, h,10);
		if ( w > 10 && h > 10){
			this.drawShape(x,y,w/this.s,h/this.s,a/this.s);
		}
	}

	intersect(other) {
		return (other.x - other.w / 2 < this.x + this.w / 2) &&
			(other.x + other.w / 2 > this.x - this.w / 2) &&
			(other.y - other.h / 2 < this.y + this.h / 2) &&
			(other.y + other.h / 2 > this.y - this.h / 2);
	}
}


function setup() {
	createCanvas(1024, 512);
	frameRate(10);

	var protection = 0;

	while (shapes.length < maxc && protection < maxp) {
		protection++;
		var rec = new Rectangle(random(width), random(height), random(10,width/3), random(10,height/3), protection);
		var overlapping = false;
		for (var j = 0; j < shapes.length; j++) {
			if (rec.intersect(shapes[j])) {
				overlapping = true;
				break;
			}
		}
		if (!overlapping) shapes.push(rec);
	}
}

function draw() {
	shapes[counter].draw();
	if (counter < shapes.length-1) counter++;
}