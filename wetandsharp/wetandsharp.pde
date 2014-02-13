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

Shard myShard;

ArrayList vecArray;

PShape s;


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
    
    int size = 100;
    int fade = 100;
    
    for(int j=0; j<fade; j++){
      float jf = float(j);
      strokeWeight(random(.1,1-(jf/fade)));
      println(jf/fade);
      stroke(whiteClamp,255-(255 * j/fade));    
      ellipse(softCenter.x, softCenter.y, j*(size/fade), j*(size/fade));      
    }  
}


PVector sharpCenter = new PVector(width*gmr, height*gmr);


for(int i=0; i<TWO_PI; i+=.02){
  
   for (float a = 0; a < TWO_PI+inc; a+=inc) {
      PVector v = PVector.fromAngle(a);
      v.mult(random(3,300);
      PVector w = PVector.fromAngle(v.x);
     triangle(v.x,v.y,sharpCenter.x,sharpCenter.y,); 
    }
}



//secondAttempt();

/*

troke(255);
strokeWeight(1);
beginShape();

float numSteps = random(5,100);

float step = TWO_PI / (numSteps);
float angle    = 0.0;
float cenX    = 110;
float cenY    = 430;
float radius  = 50;


for(int i = 0; i < numSteps; i++){

   PVector firstPoint = new PVector(sharpCenter.x + cos(angle) * radius, sharpCenter.y + sin(angle) * radius);
      float rx = sharpCenter.x + cos(angle) * radius;
      float ry = sharpCenter.y + sin(angle) * radius;

    vertex(firstPoint.x,firstPoint.y);
    angle += step;
}   
*/

//myShard = new Shard(width*gmr, height*gmr);
//myShard.display();
 
  endRecord();
}

void secondAttempt(){
  
 
vecArray = new ArrayList<PVector>();
    
    float inc = 0.1;
    
    for (float a = 0; a < TWO_PI+inc; a+=inc) {
      PVector v = PVector.fromAngle(a);
      v.mult(100);
      vecArray.add(v);
    }
    
    stroke(255);
    strokeWeight(.1);  
    beginShape();
    
    float multFactor = 1;
    
 
    
    for (int i=0;i< vecArray.size(); i++) {
      PVector tVec = (PVector)vecArray.get(i);
      //tVec.mult(random(-1,1));
      tVec.mult(multFactor%1);
      multFactor+=.77777;
      vertex(tVec.x, tVec.y);   
    }
    
    translate(width*gmr,height*gmr);
    endShape(); 
}
