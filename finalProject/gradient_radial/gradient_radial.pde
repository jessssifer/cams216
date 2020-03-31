int dim;

void setup() {
  size(640, 360);
  dim = width/2;
  background(0);
  //colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);
}

void draw() {
  background(0);
  //for (int x = 0; x <= width; x+=dim) {
  //  drawGradient(x, height/2, 0);
  //} 
  //drawGradient(320, height/2, 200);
  drawAntiGradient(320, height/2, 200);
}

void drawGradient(float x, float y, int dim) {
  int radius = dim/2;
  float a = 0;
  float r = 0; 
  float g = 0; 
  float b = 0;
  
  for (int d = radius; d > 0; --d) {
    fill(r, g, b, a);
    ellipse(x, y, d, d);
    r = (r + 1) % 360;
    g = (g + 1) % 360;
    b = (b + 2) % 360;
    a = (a + 1) % 360;
  }
}

void drawAntiGradient(float x, float y, int dim) {
  int radius = dim/2;
  float a = 255;
  float r = 50; 
  float g = 0; 
  float b = 100;
  
  for (int d = radius; d > 0; --d) {
    fill(r, g, b, a);
    ellipse(x, y, d, d);
    r = (r - 1) % 360;
    //g = (g + 1) % 360;
    b = (b - 2) % 360;
    a = (a - 1) % 360;
  }
}
