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

  void display1(float r, float g, float b, float a) {

    stroke(r, g, b, a);
    fill(r, g, b, a);
    ellipse(x, y, spriteW, spriteH);
  }

    
  void display(float r, float g, float b, float twinkle){
    if (count < twinkle){
          a = 255/twinkle * count;
          display1(r, g, b, a);
          count += 0.1;
    } else if (count < twinkle * 2){
          a = 255/twinkle * count;
          display1(r, g, b, a);
          count -= 0.1;
    }
    if (count > twinkle * 2 | count < 0){
      count = 0;
    }
  }

  void update() {
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
}
