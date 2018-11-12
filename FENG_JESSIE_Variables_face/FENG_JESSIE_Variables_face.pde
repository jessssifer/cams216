void setup() {
  size(400, 400);
  background(255, 255, 255); 
}

void draw(){
  
//face
  fill(170, 170, 170);
  ellipse(200, 200, 300, 300); 
  
//mouth
  fill(100, 100, 100);
  stroke(170, 170, 170);
  ellipse(200, 225, 175, 175);
  
  fill(170, 170, 170);
  rect(100, 100, 200, 150);
  
//eyes
  fill(210, 210, 210);
  ellipse(130, 160, 50, 50); //left eye
  ellipse(270, 160, 50, 50); //right eye

//nose
  stroke(0, 0, 0);
  line(200, 175, 185, 225); //nose bridge
  line(185, 225, 215, 225); //nose nostril
  


}
