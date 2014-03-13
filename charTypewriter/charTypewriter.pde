import geomerative.*;

boolean keydown;


RFont font;

int xoffset;
char letter;

Cursor mCur;

void setup() 
{
  size(600, 200, P2D);
  colorMode(HSB, 360, 100, 100);
  smooth();

  mCur = new Cursor(30, 50);
  RG.init(this);
  font = new RFont("Courier New.ttf", 600, RFont.LEFT);
  RCommand.setSegmentLength(25);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
}

void draw() 
{

rect(mCur.x,mCur.y, 15,15);
  
  // Draw an X
  line(0, 0, width, height);  
  line(0, height, width, 0); 

  //  // Get the width of the letter
  //  float letterWidth = textWidth(letter);
  //
  // Draw the letter to the center of the screen
  text(letter, width/2, height/2);
}

void keyPressed()
{
  if (!keydown) {
      mCur.move();
    // The variable "key" always contains the value of the most recent key pressed.
    // If the key is an upper or lowercase letter between 'A' and 'z'
    // the image is shifted to the corresponding value of that key
    


      //Letter tLetter = new Letter(key, mCur.position);
      //tLetter.write();

      letter = key;
      // Write the letter to the console
      println(key);
    
    keydown = true; //make sure that typing doesn't go on and on...
  }
}

void keyReleased() {
  keydown = false;
}

