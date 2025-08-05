/* 
   CSC101 - Pixel Art Competition - Example 3 - colored pixel diagonals animation
   Nadeem Abdul Hamid
   
   (Technically, this one violates the 60 frame constraint...)
*/

int theScale = 10;
int frameNumber = 0;  /* 0 ... 256 */
int[] colors = {
  
  };

void settings() {
  size(16*theScale, 16*theScale);
}

void setup() {
  colorMode(HSB);   // https://processing.org/tutorials/color
}

void draw() {
  scale(theScale);
  translate(.5, .5);

  background(255);

  strokeCap(PROJECT);    // makes points square
  strokeWeight(1);

  for (int y = 0; y <= frameNumber/16; y++) {
    for (int x = 0; x < (y == frameNumber/16 ? frameNumber%16 : 16); x++) {
      int i = (y + x) % 16;
      stroke((i * 255)/16, 255, 255);
      point(x, y);
    }
  }
  
  frameNumber++;
  if (frameNumber > 256) {
    noLoop();
  }  
  
  saveFrame("example3-###.png");
}


/*
  I used the ImageMagick approach (#2) described here to 
  assemble the final gif:

  https://sighack.com/post/make-animated-gifs-in-processing
   
  Install ImageMagick. Then, in a terminal:
  
  > cd ...sketch-folder...
  > magick -delay 20 example3-*.png +repage -loop 0 example3.gif


 */
