boolean dirty = false;
int numSprites = 0;

void setup(){
 size(600, 600); 
 background(0);
 frameRate(30);
}

void draw(){
  
  if (dirty == false){
    background(0);
      for (int sprite = 1; sprite < numSprites +1; sprite += 1){
          float xcoord = random(600);
          float ycoord = random(600);
          draw_sprite(xcoord, ycoord);
          
      }
      dirty = true;
  }
}


void draw_sprite(float x, float y){
  float randomGray = random(75, 255);
  //DRAW GHOST
    //body
    stroke(randomGray);
    fill(randomGray);
    ellipse(x, y, 100, 100);
    rect(x-50, y, 100, 125);
    //eyes
    fill(0);
    ellipse(x-25, y+10, 15, 15);
    ellipse(x+25, y+10, 15, 15);

}

void keyPressed(){
  
      if (key == 'r'){
        numSprites = 0;
        dirty = false;
        background(0);
        println(numSprites);
      }
  if (key == CODED){
      if (keyCode == UP){
        numSprites += 1;
        // println(numSprites);
        dirty = false;
      }
      
      if (keyCode == DOWN){
        if (numSprites > 0){
          numSprites += -1;
          dirty = false;
        }
        // println(numSprites);
      }
  }
}
