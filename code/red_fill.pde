/* 
   CSC101 - Pixel Art Competition - Example 2 - red bars animation
   Nadeem Abdul Hamid
*/

int theScale = 10;
int frameNumber = 0;  /* 0 ... 16 */

void settings() {
  size(16*theScale, 16*theScale);
}

void setup() {
}

void draw() {
  scale(theScale);
  translate(.5, .5);

  background(255);

  strokeCap(PROJECT);    // makes points square
  stroke(255, 0, 0);
  strokeWeight(1);

  for (int r = 0; r < frameNumber; r++) {
    line(0, r, 16, r); 
  }
  
  frameNumber++;
  if (frameNumber > 16) {
    noLoop();
  }  
  
  saveFrame("example2-##.png");
}


/*
  I used the ImageMagick approach (#2) described here to 
  assemble the final gif:

  https://sighack.com/post/make-animated-gifs-in-processing
   
  Install ImageMagick. Then, in a terminal:
  
  > cd ...sketch-folder...
  > magick -delay 20 example2-*.png +repage -loop 0 example2.gif


 */
