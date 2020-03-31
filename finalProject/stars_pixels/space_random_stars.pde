boolean twinkle = false;
int time = 0;

void setup() {
  size(600, 600);
  frameRate(10);
  smooth();
}

void draw() {
  int loc = 0;

  
  // This has to be called before any pixel operations
  loadPixels();
  
  
  if (twinkle == false){
      background(0);
      for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
  
        loc = i + j * width;
        
        pixels[loc] = color(0);
        
        if (loc % 2000 == int(random(0, 2000))){
          float r = random(240,255);
          float g = random(240,255);
          float b = random(240,255);
          
          pixels[loc] = color(r, g, b);
          //pixels[loc - 1] = color(r, g, b, 10);
          //pixels[loc - 2] = color(r, g, b, 10);
          
          //if (loc - width - 2 > 0){
          //  pixels[loc - width] = color(r, g, b, 10);
          //  pixels[loc - width - 1] = color(r, g, b);
          //  pixels[loc - width - 2] = color(r, g, b, 10);
          //}

          //if (loc - 2*width - 2 > 0){
          //  pixels[loc - 2*width] = color(r, g, b, 10);
          //  pixels[loc - 2*width - 1] = color(r, g, b);
          //  pixels[loc - 2*width - 1] = color(r, g, b, 10);
          //}
          
          if(time % 10 == 0){
            
          }
        } 
      }
      } 
    time += 1;

    
    updatePixels();
  }
  
  twinkle = true;
}
