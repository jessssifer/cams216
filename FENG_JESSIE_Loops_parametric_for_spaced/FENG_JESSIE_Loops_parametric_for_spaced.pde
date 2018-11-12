//DEFINING VARIABLES
  int t = 0;
  float frac = 0.05;
  
  float lineStroke = random(175, 255);
  float lineStroke1 = lineStroke;
  float lineStroke2 = lineStroke;
  float lineStroke3 = lineStroke;
  
  float x1 = 0;
  float x2 = 0;
  float y1 = 0;
  float y2 = 0;
  
  int spacing = 5;


//BEGIN CODE FOR DRAWING
  void setup(){
      size(800, 800);
      background(0);
      smooth();
  }


void draw(){
  translate(width/2, height/2);
  background(0);
   
   for(int i = 0; i < 10; i += 1){
     
     x1 = 50*sin(((t + i*spacing) * frac)/5) + 80*cos(((t + i*spacing) * frac) + 1);
     y1 = 100*cos(((t + i*spacing) * frac)/3) + 200*sin(((t + i*spacing) * frac));
     x2 = 80*sin(((t + i*spacing) * frac)/3) + 100*cos(((t + i*spacing) * frac)/4);
     y2 = 100*cos(((t + i*spacing) * frac)/3) + 40*sin(((t + i*spacing) * frac)/6 - 50);
            
    stroke(lineStroke1, lineStroke2, lineStroke3);
    line(x1, y1, x2, y2);
  }
  
  t += 1;    
}
