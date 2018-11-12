//DEFINING VARIABLES
  int t = 0;
  float frac = 0.05;
  
  float lineStroke = random(175, 255);
    float lineStroke1 = lineStroke;
    float lineStroke2 = lineStroke;
    float lineStroke3 = lineStroke;
    float transparent = 255;
  
  boolean drawLines = true;
  
  boolean parametric1 = true;
  boolean parametric2 = false;
  
  boolean originCenter = true;
  
  boolean gradientLine = false; //this is to make the line continuously change colors
  int sign = 1;
  
  float x1 = 0;
  float x2 = 0;
  float y1 = 0;
  float y2 = 0;
 
  float originX = 0;
  float originY = 0;


//BEGIN CODE FOR DRAWING
  void setup(){
      size(600, 600);
      background(0);
      smooth();
  }


  void draw(){
      if (originCenter == true){
          originX = width/2;
          originY = height/2;
      }
      
      if (drawLines == true){ //for pausing/continuing the drawing
  
           translate(originX, originY);
      
          if (parametric1 == true){
               x1 = 50*sin((t * frac)/5) + 80*cos((t * frac) + 1);
               y1 = 100*cos((t * frac)/3) + 200*sin((t * frac));
               x2 = 80*sin((t * frac)/3) + 100*cos((t * frac)/4);
               y2 = 100*cos((t * frac)/3) + 40*sin((t * frac)/6 - 50);
          }
          
          if (parametric2 == true){
               x1 = 250*sin((t * frac)/3) - 40*cos((t * frac) + 1);
               y1 = 50*cos((t * frac)/6) + 175*sin((t * frac));
               x2 = 200*sin((t * frac)/2) - 50*cos((t * frac)/8);
               y2 = 50*cos((t * frac)/3) + 200*sin((t * frac)/6 - 100);
          }
        
          stroke(lineStroke1, lineStroke2, lineStroke3, transparent);
          line(x1, y1, x2, y2);
        
          t += 1;
          
          if (gradientLine == true){
              lineStroke1 += random(4)*sign;
              lineStroke2 += random(4)*sign;
              lineStroke3 += random(4)*sign;
              
              if (lineStroke1 > 255 || lineStroke2 > 255 || lineStroke3 > 255){
                  sign = -1;
              }
              if (lineStroke1 < 0 || lineStroke2 < 0 || lineStroke3 < 0){
                  sign = 1;
              }
          }
      }
  }

  void keyPressed(){
  
//ERASING SCREEN
      if (key == 'e'){
        background(0); 
        println("t =", t + ": screen cleared");
      } 
  
//CHANGING & RESETTING COLOR OF LINES
      if (key == 'f'){
        lineStroke1 = random(255);
        lineStroke2 = random(255);
        lineStroke3 = random(255);
        println("t =", t + ": stroke color is now (" + lineStroke1 + ",", lineStroke2 + ",", lineStroke3 + ")");
      }
      if (key == 'm'){
        lineStroke1 = lineStroke;
        lineStroke2 = lineStroke;
        lineStroke3 = lineStroke;
        println("t =", t + ": stroke color has been reset");
      }

//PAUSING & CONTINUING DRAWING
      if (key == 's'){
        drawLines = !drawLines;
        if (drawLines == true){
          println("t =", t + ": drawing continued");
        } else {
          println("t =", t + ": drawing paused");
        }
      }

//CHANGING PARAMETRIC EQUATION
      if (key == '2'){
        parametric1 = false;
        parametric2 = true;
        println("t =", t + ": parametric 2 enabled");
      }
      if (key == '1'){
        parametric1 = true;
        parametric2 = false;
        println("t =", t + ": parametric 1 enabled");
      }

//RESET DRAWING
      if (key == 'r'){
        lineStroke1 = lineStroke;
        lineStroke2 = lineStroke;
        lineStroke3 = lineStroke;
        transparent = 255;
        parametric1 = true;
        parametric2 = false;
        originCenter = true;
        gradientLine = false;
        println("t =", t + ": parameters have been reset");
      }
      
//GRADIENT!
      if (key == 'g'){
        gradientLine = true;
        lineStroke1 = random(255);
        lineStroke2 = random(255);
        lineStroke3 = random(255);
        transparent = random(63, 191);
        println("t =", t + ": gradient enabled; transparency:", transparent/2.55 +"%"); 
      }
    }

//CHANGING ORIGIN
  void mouseClicked(){
    originCenter = false;
    originX = mouseX;
    originY = mouseY;
    //translate(mouseX, mouseY);
    println("t =", t + ": origin shifted to (" + mouseX + ", " + mouseY + ")");
  }
