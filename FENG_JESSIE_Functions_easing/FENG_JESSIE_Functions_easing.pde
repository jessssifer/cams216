float easing = 0.03;
float xCoord = random(600);
float yCoord = random(600);

void setup(){
 size(600, 600); 
 background(0);
 frameRate(30);
}

void draw(){
  background(0);
  
  float ease_x = xeasing(mouseX, xCoord, easing);
  float ease_y = yeasing(mouseY, yCoord, easing);
  draw_sprite(ease_x, ease_y);
  xCoord = ease_x;
  yCoord = ease_y; 
  
  if ((frameCount % 10) == 0){
    distance(ease_x, ease_y, mouseX, mouseY);
  }
}

void draw_sprite(float x, float y){
  //DRAW GHOST
    //body
    stroke(255);
    fill(255);
    ellipse(x, y, 100, 100);
    rect(x-50, y, 100, 125);
    //eyes
    fill(0);
    ellipse(x-25, y+10, 15, 15);
    ellipse(x+25, y+10, 15, 15);
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
