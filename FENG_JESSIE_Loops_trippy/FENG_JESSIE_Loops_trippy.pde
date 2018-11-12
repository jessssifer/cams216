float t = 0;

int gridWidth = 40;
int gridHeight = 40;
float sizeW = 0;
float sizeH = 0;

boolean inMonochrome = true;
boolean inColor = false;

float monoColor = 0;
float color1 = 0;
float color2 = 0;
float color3 = 0;

float amplitude = 255;
float frac = 0.0003;



void setup(){
  size(600, 600);
  background(0);
  frameRate(30);
}

void draw(){
  sizeW = 600/gridWidth;
  sizeH = 600/gridHeight;
  
  
    for(int i = 1; i < gridWidth+1; i += 1 ){ //creating row of squares
      
      for(int j = 1; j < gridHeight+1; j += 1){//creating column within rows
        
        if(inMonochrome == true){
          frac = 0.0003;
          monoColor = 255/2 * sin((t * frac) * (i * j)) + 255/2;
              // println(t, monoColor);
          fill(monoColor);
          stroke(monoColor);
        }
        
        if(inColor == true){
          frac = random(1,7)/10000;
          color1 = 255/2 * sin(t * (i * j) * 0.0002) + 255/2;
          color2 = 255/2 * sin(t * (i * j) * 0.0004) + 255/2;
          color3 = 255/2 * sin(t * (i * j) * 0.0006) + 255/2;
              println(t, color1, color2, color3, frac);
          
          fill(color1, color2, color3);
          stroke(color1, color2, color3);
        }
        
        rect((i-1) * sizeW, (j-1) * sizeH, sizeW, sizeH);
        // t += 0.005;
        t += 0.005;
      
      }
    
    }
   
}

void keyPressed(){
 if (key == 'f'){
   inMonochrome = !inMonochrome;
   inColor = !inColor;
 } 
}
