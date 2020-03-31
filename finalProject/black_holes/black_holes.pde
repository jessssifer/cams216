//SOURCE CODE: https://processing.org/examples/brightness.html

int count = 0;
boolean display = false;

float xCoord = random(600);
float yCoord = random(600);
float blackHoleSize = 200;


void setup() {
  size(600, 600);
  frameRate(30);
  smooth();
  background(0);
}

void draw(){
  loadPixels();

  if (display == true){
    if (blackHoleSize > 1){
      for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++ ) {
          int loc = x + y * width;
          float r;
          r = red (pixels[loc]);
    
          // Calculate an amount to change brightness based on proximity to the mouse
          float d = dist(x, y, xCoord, yCoord);
          float adjustbrightness = 255*(blackHoleSize-d)/blackHoleSize;
          r += adjustbrightness;
          
          // Constrain RGB to make sure they are within 0-255 color range
          r = constrain(r, 0, 255);
    
          // Make a new color and set pixel in the window
          color c = color(r);
          pixels[y*width + x] = c;
      }
      }
  
    updatePixels();
    count += 1;
    blackHoleSize = blackHoleSize/1.05;
    } else{
      background(0);
      count = 0;
      blackHoleSize = 200;
      display = false;
    }
  }
}


void mousePressed(){
  display = true;
  xCoord = mouseX;
  yCoord = mouseY;
}
