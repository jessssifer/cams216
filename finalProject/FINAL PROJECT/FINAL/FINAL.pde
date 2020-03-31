// Jessie Feng
// MAS/CAMS 216 Final Project
// Fall 2018
// Monday, December 17, 2018

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

// NOTES
//   you need to click 'next' in the first 2 screens that appear when code is run to move on
//   sometimes the 2nd page gets stuck so give it a second
//
// CODE SOURCES 
//   https://processing.org/examples/lineargradient.html 

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

//MAIN VARIABLES -----------------------------------------------------------------------------------
  boolean universe = false;
  boolean intro = true;
  boolean transition = false;
  boolean instructions = false;
  boolean help = false;

//RESET BUTTON VARIABLES ---------------------------------------------------------------------------
  float textColor = 0;
  int t = 0;
  float rColor = 0;
  boolean reset = false;

//INTRO VARIABLES ----------------------------------------------------------------------------------
  PFont font;

//BACKGROUND COLORS VARIABLES ----------------------------------------------------------------------
  color c1, c2;
  float cr, cg, cb;
  float crInt = 0.5;
  float cgInt = 0;
  float cbInt = 1;
  int Y_AXIS = 1;
  int X_AXIS = 2;
  boolean change = false;
  int lucky = 0;

//BACKGROUND STARS VARIABLES -------------------------------------------------------------------------
  boolean add = false;
  boolean backgroundStars = true;
  boolean loadStars = true;
  float[][] starsColor;
  Sprite[] stars;
  int numStar = int(random(100, 150));

//COMET VARIABLES -----------------------------------------------------------------------------------
  float easing = 0.03;
  float cometX = random(600);
  float cometY = random(600);
  boolean comet = false;
  Sprite s;

//BLACK HOLE VARIABLES ------------------------------------------------------------------------------
  int count = 0;
  boolean blackHole = false;
  float blackHoleSize = 200;
  float blackHoleX = random(600);
  float blackHoleY = random(600);

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

//DEFINING GRADIENT FUNCTION -----------------------------------------------------------------------

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  
  noFill();
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void setup(){
  size(600, 600);
  frameRate(30);
  smooth();
  ellipseMode(RADIUS);
  background(0);
  
  font = loadFont("AppleSDGothicNeo-Thin-72.vlw");

  stars = new Sprite[numStar];
  starsColor = new float[numStar][3];
  
  if(loadStars == true){
    for(int i = 0; i < numStar; i++){
      starsColor[i][0] = random(170, 255);
      starsColor[i][1] = random(170, 255);
      starsColor[i][2] = random(170, 255);
      
      Sprite s = new Sprite(random(600), random(600), random(2));
      stars[i] = s;
    }
    loadStars = false;
  }
  
  cr = 0;
  cg = 0;
  cb = 0;
  c1 = color(cr, cg, cb);
  c2 = color(0, 0, 0);
  
}

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void draw(){
  
// WELCOME PAGE -------------------------------------------------------------------------------------
    textAlign(CENTER);
    fill(textColor);
    stroke(textColor);
    
  if(intro == true){
    textColor += 4;
    if (textColor > 255){
      textColor = 255;
    }
    textFont(font, 60);
    text("w e l c o m e", 300, 240);
    text("t o   s p a c e", 300, 300);
    
    textFont(font, 20);
    text("N E X T", 300, 450);
    if (transition == true){
      textColor -= 10;
      if(textColor < 0){
        background(0);
        intro = false;
        transition = false;
        instructions = true;
      }
    }
  } 
  
// INSTRUCTIONS -------------------------------------------------------------------------------------
  if(instructions == true & universe == false){
    if (transition == false){
      textColor +=5;
      if (textColor > 255){
        textColor = 255;
      }
    }
    textFont(font, 60);
    text("i n s t r u c t i o n s", 300, 150);
    textFont(font, 30);
    text("press c for comet", 300, 200);
    text("click mouse for black hole", 300, 250);
    text("press r to reset universe", 300, 300);
    text("press h for help", 300, 350);
    textFont(font, 20);
    text("N E X T", 300, 450);
    if (transition == true){
      textColor -= 10;
      if (textColor < 0){
        instructions = false;
        transition = false;
        universe = true;
      }
    }
  }
  
// IN SPACE HELP ------------------------------------------------------------------------------------
  if(help == true){
    rectMode(CENTER);
    fill(0, 0, 0, 50);
    stroke(255);
    rect(300, 300, 500, 500);
    
    textAlign(CENTER);
    fill(255);
    stroke(255);
    textFont(font, 60);
    text("h e l p", 300, 200);
    textFont(font, 30);
    text("press c for comet", 300, 250);
    text("click mouse for black hole", 300, 300);
    text("press r to reset universe", 300, 350);
    textFont(font, 20);
    text("press H to return to space", 300, 400);
  }
  
// BACKGROUND COLORS --------------------------------------------------------------------------------
  if(universe == true){
    
    if (change == true){
        lucky = int(random(3));
        crInt = random(0.5);
        cgInt = random(0.5);
        cbInt = random(1);
        change = false;
    }
    
    if(lucky == 0 & change == false){
      setGradient(0, 0, width, height, c1, c2, Y_AXIS);
      cr += crInt;
      cg += cgInt;
      cb += cbInt;
      c1 = color(cr, cg, cb);
      if (cb > 100){
        crInt = -crInt;
        cgInt = -cgInt;
        cbInt = -cbInt;
      } else if (cb < 0){
        change = true;
      }
    } if(lucky == 1 & change == false){
      setGradient(0, 0, width, height, c2, c1, Y_AXIS);
      cr += crInt;
      cg += cgInt;
      cb += cbInt;
      c1 = color(cr, cg, cb);
      if (cb > 100){
        crInt = -crInt;
        cgInt = -cgInt;
        cbInt = -cbInt;
      } else if (cb < 0){
        change = true;
      }
    } if(lucky == 2 & change == false){
      setGradient(0, 0, width, height, c1, c2, X_AXIS);
      cr += crInt;
      cg += cgInt;
      cb += cbInt;
      c1 = color(cr, cg, cb);
      if (cb > 100){
        crInt = -crInt;
        cgInt = -cgInt;
        cbInt = -cbInt;
      } else if (cb < 0){
        change = true;
      }
    } if(lucky == 3 & change == false){
      setGradient(0, 0, width, height, c2, c1, X_AXIS);
      cr += crInt;
      cg += cgInt;
      cb += cbInt;
      c1 = color(cr, cg, cb);
      if (cb > 100){
        crInt = -crInt;
        cgInt = -cgInt;
        cbInt = -cbInt;
      } else if (cb < 0){
        change = true;
      }
    }
  }


// BACKGROUND STARS  --------------------------------------------------------------------------------
    if (backgroundStars == true && universe == true){
      for (int i = 0; i < numStar; i++){
  
         float r = starsColor[i][0];
         float g = starsColor[i][1];
         float b = starsColor[i][2];
  
         stars[i].displayStar(r, g, b, random(2, 5));
      } 
    }  
    
// COMET --------------------------------------------------------------------------------------------
  if(comet == true && universe == true){
    s = new Sprite(cometX, cometY, 4);
    float ease_x = s.xeasing(mouseX, cometX, easing);
    float ease_y = s.yeasing(mouseY, cometY, easing);
    s.displayComet(ease_x, ease_y);
    s.updateComet();
  }
  
// BLACK HOLES --------------------------------------------------------------------------------------
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
            //color c = color(255-r); // fade to white
            color c = color(r); // fade to black
            pixels[y*width + x] = c;
        }
      }
    updatePixels();
    count += 1;
    blackHoleSize = blackHoleSize/1.1;
    } else{
      //background(255);
      background(0);
      count = 0;
      blackHoleSize = 200;
      blackHole = false;

      universe = false;
    }
  }
   
// RESET BUTTON -------------------------------------------------------------------------------------
  if (universe == false & intro == false & instructions == false & help == false){
    t += 1;
    reset = true;
    
    if (t > 30){
      rectMode(CENTER);
      noFill();
      stroke(rColor);
      rect(300, 285, 100, 45);
      
      fill(rColor);
      textFont(font, 45);
      textAlign(CENTER);
      text("reset", 300, 300);
      
      rColor += 5;
    }
  }
}

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void mousePressed(){
  if (intro == true | instructions == true){
    if ((mouseX < 350) && (mouseX > 250) && ((mouseY < 470) && (mouseY > 420))) {
      transition = true;
    }
  }

  if (universe == true){
    blackHole = true;
    blackHoleX = mouseX;
    blackHoleY = mouseY;
  }

  if (reset == true){
    if ((mouseX < 350) && (mouseX > 250) && ((mouseY < 307) && (mouseY > 263))) {
      reset = false;
      universe = true;
      comet = false;
      change = false;
      lucky = 0;
    }
  }
}

//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

void keyPressed(){
 
  if(key == 'c'){ // creates comet
    comet = !comet;
    cometX = random(600);
    cometY = random(600);
  } 
  if (intro == false & instructions == false & blackHole == false & reset == false){ // pulls up help menu
    if (key == 'h'){
      help = !help;
      universe = !universe;
    }
  }   
  if(key == 'r' & intro == false & instructions == false){ // resets universe & shuffles stars
    universe = true;
    comet = false;
    change = false;
    loadStars = true;
    help = false;
    lucky = 0;
    
    for(int i = 0; i < numStar; i++){
      starsColor[i][0] = random(170, 255);
      starsColor[i][1] = random(170, 255);
      starsColor[i][2] = random(170, 255);
      Sprite s = new Sprite(random(600), random(600), random(2));
      stars[i] = s;
    }
  }
}
