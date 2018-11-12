// Just for fun I added an extra feature:
//   * press 'i' to turn on/off Invisible mode (points are doubled)

Sprite s1;
Sprite s2;
Sprite s3;
float count = 0;
int score = 0;
int addScore = 0;
boolean invisible = false; //Ha! Get it? Boo-lean

void setup() {
  size(600, 600);
  background(0);
  smooth();
  frameRate(20);

  s1 = new Sprite(random(600), random(600)); //Booris
  s2 = new Sprite(random(600), random(600)); //Barboora
  s3 = new Sprite(random(600), random(600)); //Mary-Boo
}

void draw() {
  
  if(count == 0){
    println("******************************");
    println("*  WELCOME TO WHACK-A-GHOUL  *");
    println("******************************");
    println(" Hit a ghoul to win 10 points ");
    println(" or turn on invisible mode by ");
    println(" pressing i to earn 20 points ");
    println("");
  }
  
  if(invisible == false){
    background(0);
    addScore = 10;
  } else{
    background(205);
    addScore = 20;
  }
  
  s1.update();
  s2.update();
  s3.update();
  
  s1.display(s1);
  s2.display(s2);
  s3.display(s3);
}

void mouseClicked(){
  if (s1.checkBoundingBox(mouseX,mouseY) == true){
    score += addScore;
    println("| SCORE:", score);
    println("|    location of s1 was", s1.getx(), s1.gety());
    println("-----");
    s1.respawn();
  }
  
  if (s2.checkBoundingBox(mouseX,mouseY) == true){
    score += addScore;
    println("| SCORE:", score);
    println("|    location of s2 was", s2.getx(), s2.gety()); 
    println("-----");
    s2.respawn();
  }
  
  if (s3.checkBoundingBox(mouseX,mouseY) == true){
    score += addScore;
    println("| SCORE:", score);
    println("|    location of s3 was", s3.getx(), s3.gety());
    println("-----");
    s3.respawn();
  }
}

void keyPressed(){
  if (key == 'i'){
      invisible = !invisible;
      if(invisible == true){
          println("");
          println("***********************");
          println("*  invisible mode on  *");
          println("***********************");
          println("   double points: on   ");
          println("");
      } else{
          println("");
          println("************************");
          println("*  invisible mode off  *");
          println("************************");
          println("   double points: off   ");
          println("");

      }
  }
}
