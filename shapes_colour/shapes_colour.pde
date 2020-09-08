// Alastair Montgomery
// http://0x32.uk/

PShape s;  // The PShape object
int fudge_factor = 4;
int iterations = 3;
int alpha = 32;
boolean filled = false;


void setup() {
  size(1000, 600);
  background(255,255,255);

  int spacing = 50;
  float length = spacing * 0.95;

  strokeWeight(1);

  for (int z = 0; z < iterations; z++){
  for (int y = 0; y < height; y=y+spacing) {
    for (int x = 0; x < width; x=x+spacing) {

      stroke(0);
      strokeWeight(1);
      fill(255/(iterations-z),255/(iterations-z),255/(iterations-z));
      
      double selector = 14 * Math.random();
      if ( selector < 1) {
        shape11(x, y, length);
      }
      else if (selector > 1 && selector < 2){
        shape12(x, y, length);
      }
      else if (selector > 2 && selector < 3){
        shape13(x,y,length);
      }
      else if (selector > 3 && selector < 4){
        shape14(x,y,length);
      }
      else if (selector > 4 && selector < 5){
        shape2(x,y,length);
      }
      else if (selector > 5 && selector < 6){
        shape3(x,y,length);
      }
      else if (selector > 6 && selector < 7){
        shape4(x,y,length);
      }
      else if (selector > 7 && selector < 8){
        shape5(x,y,length);
      }
      else if (selector > 8 && selector < 9){
        shape6(x,y,length);
      }
      else if (selector > 9 && selector < 10){
        shape7(x,y,length);
      }
      else if (selector > 10 && selector < 11){
        shape8(x,y,length);
      }
      else if (selector > 11 && selector < 12){
        shape9(x,y,length);
      }
      else if (selector > 12 && selector < 13){
        shape10(x,y,length);
      }
      else {
        shape1(x,y,length);
      }
    }
  }
  }
  save("Example/shape_colour4.png");
}

void randomFill(int a){
  fill(random(128,255),random(128,255),random(128,255),random(a,a*2));
}

float randomFudge() {
  return random(-fudge_factor,fudge_factor);
}


void shape1(int x, int y, float l){
  rect(x,y,l,l,l/5);
  if (filled) {
    noStroke();
    randomFill(64);
    float fudge = randomFudge();
    rect(x+fudge,y+fudge,l+fudge,l+fudge,l/5);
  }
}

void shape2(int x, int y, float l){
  rect(x,y,l/2,l,l/5);
}

void shape3(int x, int y, float l){
  rect(x+l/2,y,l/2,l,l/5);
}

void shape4(int x, int y, float l){
  rect(x,y,l,l/2,l/5);
}

void shape5(int x, int y, float l){
  rect(x,y+l/2,l,l/2,l/5);
    if (filled) {
      noStroke();
      randomFill(alpha);
      float fudge = randomFudge();
      rect(x+fudge,y+l/2+fudge,l+fudge,l/2+fudge,l/5);
    }
}

void shape6(int x, int y, float l){
  rect(x,y,l/2,l/2,l/5);
  if (filled) {
    noStroke();
    randomFill(alpha);
    float fudge = randomFudge();
    rect(x+fudge,y+fudge,l/2+fudge,l/2+fudge,l/5);
  }
}

void shape7(int x, int y, float l){
  rect(x+l/2,y,l/2,l/2,l/5);
  if (filled) {
    noStroke();
    randomFill(alpha);
    float fudge = randomFudge();
    rect(x+l/2+fudge,y+fudge,l/2+fudge,l/2+fudge,l/5);
  }
}

void shape8(int x, int y, float l){
  rect(x,y+l/2,l/2,l/2,l/5);
  if (filled) {
    noStroke();
    randomFill(alpha);
    float fudge = randomFudge();
    rect(x+fudge,y+l/2+fudge,l/2+fudge,l/2+fudge,l/5);
  }
}

void shape9(int x, int y, float l){
  rect(x+l/2,y+l/2,l/2,l/2,l/5);
  if (filled) {
    noStroke();
    randomFill(alpha);
    float fudge = randomFudge();
    rect(x+l/2+fudge,y+l/2+fudge,l/2+fudge,l/2+fudge,l/5);
  }
}

void shape10(int x, int y, float l){
  rect(x+l/4,y+l/4,l/2,l/2,l/5);
  if (filled) {
    noStroke();
    randomFill(alpha);
    float fudge = randomFudge();
    rect(x+l/4+fudge,y+l/4+fudge,l/2+fudge,l/2+fudge,l/5);
  }
}

void shape11(int x, int y, float l) {
  s = createShape();
  s.beginShape();
  s.strokeJoin(ROUND);
  s.vertex(0, 0);
  s.vertex(l/2, 0);
  s.vertex(l/2, l/2);
  s.vertex(l, l/2);
  s.vertex(l,l);
  s.vertex(0,l);
  s.vertex(0,0);
  s.endShape(CLOSE);
  shape(s, x, y);
}

void shape12(int x, int y, float l) {
  s = createShape();
  s.beginShape();
  s.strokeJoin(ROUND);
  s.vertex(0, 0);
  s.vertex(0, l/2);
  s.vertex(l/2, l/2);
  s.vertex(l/2, l);
  s.vertex(l,l);
  s.vertex(l,0);
  s.endShape(CLOSE);
  shape(s, x, y);
}

void shape13(int x, int y, float l) {
  s = createShape();
  s.beginShape();
  s.strokeJoin(ROUND);
  s.vertex(l/2, 0);
  s.vertex(l, 0);
  s.vertex(l, l);
  s.vertex(0, l);
  s.vertex(0,l/2);
  s.vertex(l/2,l/2);
  s.endShape(CLOSE);
  shape(s, x, y);
}

void shape14(int x, int y, float l) {
  s = createShape();
  s.beginShape();
  s.strokeJoin(ROUND);
  s.vertex(0, 0);
  s.vertex(l, 0);
  s.vertex(l, l/2);
  s.vertex(l/2, l/2);
  s.vertex(l/2,l);
  s.vertex(0,l);
  s.endShape(CLOSE);
  shape(s, x, y);
}
