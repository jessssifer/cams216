class Sprite {
  float x = width/2;
  float y = height/2;
  float spriteW = 0;
  float spriteH = spriteW;


  Sprite(float xinit, float yinit) {
    x = xinit;
    y = yinit;

  }

  void display(float x, float y) {
    
    
    stroke(random(150, 200));
    
    line(x, y, x-(mouseX-x), y-(mouseY-y));
    line(x, y, x-(mouseX-x) + random(5, 10), y-(mouseY-y) + random(5, 10));
    line(x, y, x-(mouseX-x) - random(5, 10), y-(mouseY-y) - random(5, 10));
    
    fill(255);
    stroke(0);
    ellipse(x, y, 8, 8);
  }


  void update() {
    float ease_x = xeasing(mouseX, xCoord, easing);
    float ease_y = yeasing(mouseY, yCoord, easing);
    xCoord = ease_x;
    yCoord = ease_y; 

  }

  float getx() {
    return(x);
  }

  float gety() {
    return(y);
  }

  //boolean checkBoundingBox(float mx, float my) {
  //  if (((mx < (x + spriteW/2)) && (mx > (x - spriteW/2))) && ((my < (y + spriteH/2)) && (my > (y - spriteH/2)))) {
  //    return(true);
  //  }
  //  return(false);
  //}
  
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
