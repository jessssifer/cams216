float count = 0;
float x = 0;
float y = 300;

boolean go = false;



void setup(){
  size(600, 600);
  background(0);
  frameRate(50);
  smooth();
}

void drawStar(float x, float y){

  fill(255);
  stroke(255);
  ellipse(x, y, 3, 3);
}

void draw(){
}

void mousePressed(){
  drawStar(mouseX, mouseY);
}
