function setup() {
	createCanvas(1025, 1025);
	background(255);
	shapes();
}

function shapes() {
	var spacing = 25;
	var length = spacing * 0.90;
	strokeWeight(1);
	stroke(0);
	for (var y = spacing; y < width - spacing; y = y + spacing) {
		for (var x = spacing; x < width - spacing; x = x + spacing) {
			fill(random(255), random(255), random(255), random(127));
			r = floor(random(0, 4));
			switch (r) {
				case 0:
					shape1(x, y, length);
					break;
				case 1:
					shape2(x, y, length);
					break;
				case 2:
					shape3(x, y, length);
					break;
				case 3:
					shape4(x, y, length);
					break;
				default:
					circle(x, y, length);
					break;
			}
		}
	}
}

function shape1(x, y, l) {
	beginShape();
	vertex(x, y);
	vertex(x + l / 2, y);
	vertex(x + l / 2, y + l / 2);
	vertex(x + l, y + l / 2);
	vertex(x + l, y + l);
	vertex(x, y + l);
	vertex(x, y);
	endShape(CLOSE);
}

function shape2(x, y, l) {
	beginShape();
	vertex(x, y);
	vertex(x, y + l / 2);
	vertex(x + l / 2, y + l / 2);
	vertex(x + l / 2, y + l);
	vertex(x + l, y + l);
	vertex(x + l, y);
	endShape(CLOSE);
}

function shape3(x, y, l) {
	beginShape();
	vertex(x + l / 2, y);
	vertex(x + l, y);
	vertex(x + l, y + l);
	vertex(x, y + l);
	vertex(x, y + l / 2);
	vertex(x + l / 2, y + l / 2);
	endShape(CLOSE);
}

function shape4(x, y, l) {
	beginShape();
	beginShape();
	vertex(x, y);
	vertex(x + l, y);
	vertex(x + l, y + l / 2);
	vertex(x + l / 2, y + l / 2);
	vertex(x + l / 2, y + l);
	vertex(x, y + l);
	endShape(CLOSE);
}

function draw() {}