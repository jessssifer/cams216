// Jessie Feng
// MAS/CAMS 216 Final Project
// Fall 2018

//notes
// fill is now black?? how did that happen??


//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

boolean universe = true;
float x = -600;
float y = 600;

//BACKGROUND STARS VARIABLES
boolean add = false;
boolean backgroundStars = true;
boolean loadStars = true;
float[][] starsColor;
Sprite[] stars;
int numStar = int(random(100, 150));

//COMET VARIABLES --------------------------------------------------------
float easing = 0.03;
float cometX = random(600);
float cometY = random(600);
boolean comet = false;
Sprite s;

//BLACK HOLE VARIABLES ---------------------------------------------------
int count = 0;
boolean blackHole = false;
float blackHoleSize = 200;
float blackHoleX = random(600);
float blackHoleY = random(600);

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void setup(){
  size(600, 600);
  frameRate(30);
  smooth();

  stars = new Sprite[numStar];
  starsColor = new float[numStar][3];
  
  if(loadStars == true){
    for(int i = 0; i < numStar; i++){
      starsColor[i][0] = random(170, 255);
      starsColor[i][1] = random(170, 255);
      starsColor[i][2] = random(170, 255);
      
      Sprite s = new Sprite(random(600), random(600), random(1, 3));
      stars[i] = s;
    }
    loadStars = false;
  }
}

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void draw(){
  if(universe == true){
    background(0);
  }

  // BACKGROUND STARS  ------------------------------------------------------------------
    if (backgroundStars == true && universe == true){
      for (int i = 0; i < numStar; i++){
  
         float r = starsColor[i][0];
         float g = starsColor[i][1];
         float b = starsColor[i][2];
  
         stars[i].displayStar(r, g, b, random(3, 5));
      } 
    }

    
  // COMET  -----------------------------------------------------------------------------
  
  if(comet == true && universe == true){
    s = new Sprite(cometX, cometY, 8);
    float ease_x = s.xeasing(mouseX, cometX, easing);
    float ease_y = s.yeasing(mouseY, cometY, easing);
    s.displayComet(ease_x, ease_y);
    s.updateComet();
  }
  
  
  // BLACK HOLES  -----------------------------------------------------------------------

  loadPixels();

  if (blackHole == true && universe == true){
    if (blackHoleSize > 1){
      for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++ ) {
          int loc = x + y * width;
          float r;
          r = red (pixels[loc]);
    
          // Calculate an amount to change brightness based on proximity to the mouse
          float d = dist(x, y, blackHoleX, blackHoleY);
          float adjustbrightness = 255*(blackHoleSize-d)/blackHoleSize;
          r += adjustbrightness;
          
          // Constrain RGB to make sure they are within 0-255 color range
          r = constrain(r, 0, 255);
    
          // Make a new color and set pixel in the window
          color c = color(255-r); 
          //color c = color(r); // fade to black
          pixels[y*width + x] = c;
      }
      }
  
    updatePixels();
    count += 1;
    blackHoleSize = blackHoleSize/1.05;
    } else{
      background(255);
      count = 0;
      blackHoleSize = 200;
      blackHole = false;

      universe = false;
    }
  }
}

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void mousePressed(){
  blackHole = true;
  blackHoleX = mouseX;
  blackHoleY = mouseY;
}

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void keyPressed(){
  if(key == 'c'){
    comet = !comet;
    cometX = random(600);
    cometY = random(600);
  }
  
  if(key == 'r'){
    universe = true;
    comet = false;
  }
}
