class Sprite {
  float x = width/2;
  float y = height/2;
  float spriteW = 0;
  float spriteH = spriteW;
  float size = 0;
  boolean display = true;
  int count = 0;


  Sprite(float xinit, float yinit, float size) {
    x = xinit;
    y = yinit;
    spriteW = size;
    spriteH = spriteW;
  }

  void displayBlackHole(float mouseX, float mouseY, float size) {
    //if (display == true){
    if (size > 1){
      for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++ ) {
          int loc = x + y * width;
          float r;
          r = red (pixels[loc]);
    
          // Calculate an amount to change brightness based on proximity to the mouse
          float d = dist(x, y, mouseX, mouseY);
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
    }
    //}
  }
    
  void updateBlackHole(){
    count += 1;
    size = size/1.25;
    if (size < 1){
      background(0);
      count = 0;
      size = 200;
      display = false;
    }
  }
  
  void mousePressed(){
    display = true;
  }

  float getx() {
    return(x);
  }

  float gety() {
    return(y);
  }

  boolean checkBoundingBox(float mx, float my) {
    if (((mx < (x + spriteW/2)) && (mx > (x - spriteW/2))) && ((my < (y + spriteH/2)) && (my > (y - spriteH/2)))) {
      return(true);
    }
    return(false);
  }
  

}
