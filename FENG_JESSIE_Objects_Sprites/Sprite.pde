class Sprite {
  float x = width/2;
  float y = height/2;
  float randxoffset = 0;
  float randyoffset = 0;
  float oldxoffset = 0;
  float oldyoffset = 0;
  int spriteW = 100;
  int spriteH = 175;


  Sprite(float xinit, float yinit){
    x = xinit;
    y = yinit;
  }
  
  void display1(){
      stroke(205);
      fill(205);
      ellipse(x, y, 100, 100);
      rect(x-50, y, 100, 125);
      fill(0);
      ellipse(x-25, y+10, 15, 15);
      ellipse(x+25, y+10, 15, 15);


  }
  
  void display2(){

      stroke(205);
      fill(205);
      ellipse(x, y, 100, 100);
      rect(x-50, y, 100, 125);
      fill(0);
      ellipse(x-25, y+10, 15, 15);
      ellipse(x+25, y+10, 15, 15);
      fill(205);
      rect(x-45, y, 80, 10);

  }
  
  void display3(){
    
      stroke(205);
      fill(205);
      ellipse(x, y, 100, 100);
      rect(x-50, y, 100, 125);
      fill(205);
      stroke(0);
      ellipse(x-25, y+10, 15, 15);
      ellipse(x+25, y+10, 15, 15);
      stroke(205);
      rect(x-45, y, 80, 10);

  }
  
  void display(Sprite s){
    if (count % 3  < 1){
      s.display1();
  } else if (count % 3 < 2 && count % 3 > 1){
      s.display2();
  } else if (count % 3 < 3 && count % 3 > 2){
      s.display3();
  }
    count += 0.1;
  }
  
  void update(){
    randxoffset = random(-10, 10);
    randyoffset = random(-10, 10);
    
    float xoffset = (randxoffset + oldxoffset)/2;
    float yoffset = (randyoffset + oldyoffset)/2;
    
    if ((x + xoffset) < 0){
      x = 0;
    } else if ((x + xoffset) > width) {
      x = width;
    } else {
      x += xoffset;
    }
    
    
    if ((y + yoffset) < 0){
      y = 0;
    } else if ((y + yoffset) > height) {
      y = height;
    } else {
      y += yoffset;
    }
    
  oldxoffset = xoffset;
  oldyoffset = yoffset;
  
  }
  
  float getx(){
    return(x);
  }
  
  float gety(){
    return(y);
  }
  
  boolean checkBoundingBox(float mx, float my){
    if (((mx < (x + spriteW/2)) && (mx > (x - spriteW/2))) && ((my < (y + spriteH/2)) && (my > (y - spriteH/2)))){
        return(true);
      }
     return(false);
   }

  void respawn(){
    x = random(600);
    y = random(600);
  }
  


}
