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
  
  
  vecArray = new ArrayList<PVector>();
  PVector softCenter = new PVector(width-width*gmr, height-height*gmr);

//beginShape();
  for(int i=0;i<100;i++){
    int rOffset = 30;
    
    PVector randVector = new PVector(random(-rOffset,rOffset),random(-rOffset,rOffset));
    softCenter.add(randVector);
    PVector newVec = new PVector(softCenter.x, softCenter.y);
    vecArray.add(newVec);
    
    
    int size = 100;
    int fade = 100;
    
    for(int j=0; j<fade; j++){
      float jf = float(j);
      strokeWeight(random(.1,1-(jf/fade)));
      //strokeWeight(random(.1,1-(jf/fade)));
      //println(jf/fade);
      stroke(whiteClamp,255-(255 * j/fade));    
      ellipse(softCenter.x, softCenter.y, j*(size/fade), j*(size/fade));      
    }  
      
      
      //v.mult(random(3,300));

}

//endShape();

stroke(255,0);
strokeWeight(0);
beginShape();
fill(255,255);
noFill();
int mod = vecArray.size()-1;

beginShape();

//translate(200, 200);
translate(width/2,height/2);
scale(-1,-1);
translate(-width/2,-height/2);
scale(1.5,1.5);
for(int i=0; i<vecArray.size()-4; i++){
  //fill(150,random(blackClamp,whiteClamp));
  fill(random(blackClamp,whiteClamp));
  PVector vv = (PVector)vecArray.get(i);
  PVector v1 = (PVector)vecArray.get(i+1);
  PVector v2 = (PVector)vecArray.get(i+2);
  PVector v3 = (PVector)vecArray.get(i+2);
  //vv.mult(2);
  println(vv.x,vv.y);
  triangle(vv.x,vv.y,v1.x,v1.y,v2.x,v2.y);
  //rotateY(radians(2));
  rotateX(radians(random(0,30)));
  //vertex(vv.x,vv.y,v1.x);
  
}
endShape();


PVector sharpCenter = new PVector(width*gmr, height*gmr);





for(int i=100; i>1; i-=10){
  
  stroke(255);
  //fill(255);
  strokeWeight(1);  
        beginShape();

  float inc = TWO_PI/3;
   for (float a = 0; a < TWO_PI; a+=inc) {
      PVector v = PVector.fromAngle(a);
      //v.mult(random(3,300));
      

      v.mult(i);
      vertex(v.x,v.y);
      PVector r = PVector.random2D();
      r.mult(i);
      vertex(r.x,r.y);

      //PVector w = PVector.fromAngle(v.x);
     //triangle(v.x,v.y,sharpCenter.x,sharpCenter.y, 5, 6); 
    }
    
    translate(width*gmr,height*gmr);
    rotate(radians(30));
    //endShape();
    

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
