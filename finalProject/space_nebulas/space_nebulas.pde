//SOURCE CODE: https://processing.org/examples/brightness.html

float blackHolex = 300;
float blackHoley = 300;

void setup() {
  size(600, 600);
  frameRate(30);
  smooth();
}

void draw() {
  background(0);
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++ ) {
      int loc = x + y*width;
      float r;
      r = red (pixels[loc]);

      // Calculate an amount to change brightness based on proximity to the mouse
      float maxdist = 200;//dist(0,0,width,height);
      float d = dist(x, y, blackHolex, blackHoley);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r);
      pixels[y*width + x] = c;
    }
  
  updatePixels();
}

  
  //for (int i = 0; i < width; i++) {
  //  for (int j = 0; j < height; j++) {
  //    loc = i + j * width;
      
  //    // `color` allows us to define, well, a color 
  //    pixels[loc] = color(random(0, 255), random(0, 255), random(0, 255));
  //  }
  //}
  
  updatePixels();
}
