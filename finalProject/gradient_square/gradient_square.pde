// CODE SOURCE: https://processing.org/tutorials/pshader/

float angle;
float x = -100;
float y = 100;

void setup() {
  size(400, 400, P3D);
  noStroke();
}

void draw() {
  background(0);
  camera(width/2, height/2, 300, width/2, height/2, 0, 0, 1, 0);
  
  pointLight(200, 200, 200, width/2, height/2, -200);
  
  translate(width/2, height/2);
  //rotateY(angle);
  
  beginShape(QUADS);
  normal(0, 0, 1);
  fill(200, 50, 100);
  vertex(x, y);
  vertex(-x, y);
  fill(0, 0, 100);
  vertex(-x, -y);
  vertex(x, -y);
  endShape();
  
  //angle += 0.01;
  x -= 1;
  y += 1;
}
