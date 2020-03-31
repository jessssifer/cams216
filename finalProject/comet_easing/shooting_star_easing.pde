float easing = 0.03;
float xCoord = random(600);
float yCoord = random(600);
Sprite s;
boolean star = false;

void setup(){
 size(600, 600); 
 background(0);
 frameRate(30);
}

void draw(){
  background(0);
  
  if (star == true){
    s = new Sprite(xCoord, yCoord);
    float ease_x = s.xeasing(mouseX, xCoord, easing);
    float ease_y = s.yeasing(mouseY, yCoord, easing);
    s.display(ease_x, ease_y);
    s.update();
  }
}

void mousePressed(){
  star = !star;
}
