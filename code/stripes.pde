/* 
   CSC101 - Pixel Art Competition - Example 1 - static 16x16 image 
   Nadeem Abdul Hamid
*/

int theScale = 10;

void settings() {
  size(16*theScale, 16*theScale);
}

void setup() {
  background(255);
  noLoop();
}

void draw() {
  scale(theScale);
  translate(.5, .5);
  
  strokeCap(PROJECT);    // makes points square
  stroke(0, 0, 0);
  strokeWeight(1);

  for (int x = 0; x < 16; x++) {
    for (int y = 0; y < 16; y++) {
      if ( ((y*16)+x) % 3 == 2 ) {
        point(x, y);
      } 
    }
  }
  
  saveFrame("example1.png");
}
