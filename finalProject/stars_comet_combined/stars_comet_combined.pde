//BACKGROUND STARS VARIABLES
boolean add = false;
boolean starsReset = false;
float[][] starsColor;
Sprite[] stars;
int numStar = int(random(100, 150));

//COMET VARIABLES
float easing = 0.03;
float xCoord = random(600);
float yCoord = random(600);
boolean comet = false;
Sprite s;


void setup(){
  size(600, 600);
  background(0);
  frameRate(30);
  smooth();

  stars = new Sprite[numStar];
  starsColor = new float[numStar][3];
  
  if(starsReset == false){
    for(int i = 0; i < numStar; i++){
      starsColor[i][0] = random(170, 255);
      starsColor[i][1] = random(170, 255);
      starsColor[i][2] = random(170, 255);
      
      Sprite s = new Sprite(random(600), random(600), random(1, 3));
      stars[i] = s;
    }
    starsReset = true;
  }
}

void draw(){
  background(0);

    for (int i = 0; i < numStar; i++){

       float r = starsColor[i][0];
       float g = starsColor[i][1];
       float b = starsColor[i][2];

       stars[i].displayStar(r, g, b, random(3, 5));
    } 
    
    
  if(comet == true){
    s = new Sprite(xCoord, yCoord, 8);
    float ease_x = s.xeasing(mouseX, xCoord, easing);
    float ease_y = s.yeasing(mouseY, yCoord, easing);
    s.displayComet(ease_x, ease_y);
    s.updateComet();
    
  }
}

//void mousePressed(){
//  comet = !comet;
//}

void keyPressed(){
  if(key == 'c'){
    comet = !comet;
    xCoord = random(600);
    yCoord = random(600);
  }
}
