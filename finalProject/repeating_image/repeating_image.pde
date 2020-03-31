//https://all-free-download.com/free-vector/download/space-background-colored-repeating-icons-sketch_6827786.html

PImage img;
int counter = 0;

void setup(){

  size(250, 250);
  img = loadImage("space.jpg");
  frameRate(75);

}

void draw(){
  background(255);

  ///float move = map(counter, 0, 10, 0, 1);
  imageMode(CENTER);
  image(img, counter, 0);
  imageMode(CENTER);
  image(img, (counter-img.width), 0);

  if (counter == img.width){
    counter = 0; 
  } else{
    counter += 1;
  }
}
