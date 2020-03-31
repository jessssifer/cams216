class Sprite {
  float x = width/2;
  float y = height/2;
  float spriteW = 0;
  float spriteH = spriteW;

  float r = 255;
  float g = 255;
  float b = 255;
  float a = 0;
  float count = random(0, 1);


  Sprite(float xinit, float yinit, float size) {
    x = xinit;
    y = yinit;
    spriteW = size;
    spriteH = spriteW;
  }

////////////////
// STAR STUFF //
////////////////


  void display1(float r, float g, float b, float a) {

    stroke(r, g, b, a);
    fill(r, g, b, a);
    ellipse(x, y, spriteW, spriteH);
  }

    
  void displayStar(float r, float g, float b, float twinkle){
    if (count < twinkle){
          a = 255/twinkle * count;
          display1(r, g, b, a);
          count += 0.05;
    } else if (count < twinkle * 2){
          a = 255/twinkle * count;
          display1(r, g, b, a);
          count -= 0.1;
    }
    if (count > twinkle * 2 | count < 0){
      count = 0;
    }
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
  
/////////////////
// COMET STUFF //
/////////////////

    void displayComet(float x, float y){
      stroke(random(150, 200));
    
      line(x, y, x-(mouseX-x), y-(mouseY-y));
      line(x, y, x-(mouseX-x) + random(5, 10), y-(mouseY-y) + random(5, 10));
      line(x, y, x-(mouseX-x) - random(5, 10), y-(mouseY-y) - random(5, 10));
      
      fill(255);
      stroke(0);
      ellipse(x, y, spriteW, spriteW);
    }
    
    void updateComet() {
    float ease_x = xeasing(mouseX, xCoord, easing);
    float ease_y = yeasing(mouseY, yCoord, easing);
    xCoord = ease_x;
    yCoord = ease_y; 
  }
  
    float xeasing(float targetX, float objectX, float easing){
    float dx = targetX - objectX;
    float updated_objectX = objectX + easing * dx;
    return (updated_objectX);
  }
  
  float yeasing(float targetY, float objectY, float easing){
      float dy = targetY - objectY;
      float updated_objectY = objectY + easing * dy;
      return (updated_objectY);
  }
  
  float distance(float x1, float y1, float x2, float y2){
    float dx = x2 - x1;
    float dy = y2 - y1;
    float distance = sqrt(dx*dx + dy*dy);
    println(distance);
    return (distance);
  }

}
