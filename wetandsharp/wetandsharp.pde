/*  Properties
_________________________________________________________________ */

import processing.pdf.*;

// Set these variables to the print size you want (in inches)
// The resulting PDF will be this aspect ratio
float print_width = 17;
float print_height = 23;

// This will help make the sketch window bigger
float make_bigger = 40;

float gm = 1.618;
float gmr = 0.618;

int whiteClamp = 230;
int blackClamp = 30;



/*  Setup
_________________________________________________________________ */

void setup()
{
  size(round(print_width * make_bigger), round(print_height * make_bigger));
  String saveString = "data/" + year() + month() + day() + hour() + minute() + second() + "_grab.pdf";  
  beginRecord(PDF, saveString); 
  background(blackClamp);
  smooth();
  strokeWeight(.1);
  noStroke();
  noFill();



  
  PVector softCenter = new PVector(width-width*gmr, height-height*gmr);

  for(int i=0;i<40;i++){
    int rOffset = 30;
    
    PVector randVector = new PVector(random(-rOffset,rOffset),random(-rOffset,rOffset));
    softCenter.add(randVector);
    
    int size = 300;
    int fade = 100;
    
    for(int j=0; j<fade; j++){
      strokeWeight(random(.1,1));
      stroke(whiteClamp,255-(255 * j/fade));    
      ellipse(softCenter.x, softCenter.y, j*(size/fade), j*(size/fade));      
    }  
}
  
  
  
  
 
  endRecord();
}
