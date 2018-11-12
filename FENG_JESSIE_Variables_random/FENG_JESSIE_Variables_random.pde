void setup() {
  size(400, 400);
  background(0, 0, 0); 
}

void draw() {
  stroke(random(255), random(255), random(255));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed() {
  stroke(0, 0, 0);
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 16, 16);
}
