import controlP5.*;

import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

import java.util.Iterator;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

int copyCounter = 0;

boolean saveFrame = false;

Pixel mPixel;
Hand myHand;

ArrayList<Hand> handFrames;
int numFrames = 3;
int interfaceSpacing = 120; //distance between hand farames, but other variables affected from this


void setup() {
  size(899, 1400, P3D);
  colorMode(HSB, 1, 1, 1, 1);

  background(0, 0, 0);

  testSinglePix();

  //  myHand = new Hand();
  //  myHand.init();

  handFrames = new ArrayList<Hand>();


  for (int i=0;i<numFrames;i++) {
    RPoint originPoint = new RPoint(i*interfaceSpacing, 0);
    Hand newHand = new Hand(originPoint);
    newHand.init();
    handFrames.add(newHand);
  }
}

void draw() {
  lights();
  background(0);

  //myHand.display(false); //don't draw 3D



//draw 2D
  for (int i = 0; i<handFrames.size();i++) {
            pushMatrix();

    translate(i*interfaceSpacing,0);

    if (mousePressed)handFrames.get(i).togglePixel(mouseX, mouseY, drawState());
    
    handFrames.get(i).display(false);
   
    popMatrix();
  }

//draw 3D
  for (int i = 0; i<handFrames.size();i++) {


   pushMatrix();
    translate(width/2, height/2);
    rotateY(radians(frameCount % 720));
    RPoint t = handFrames.get(i).origin;
    translate(-t.x, -t.y, i*10);
    handFrames.get(i).display(true);
    popMatrix();
}




  if (saveFrame) {
    saveFrame();
    saveFrame = false;
  }
}

void copyFrame(int index){
  
  
RPoint origin = new RPoint(handFrames.get(handFrames.size()-1).origin);
origin.x+= interfaceSpacing;

Hand tFrame = new Hand(origin);
tFrame.init();
//RPoint originOffset = new RPoint(interfaceSpacing,0);
//tFrame.origin.x+= interfaceSpacing+interfaceSpacing;
//tFrame.reset();
handFrames.add(tFrame);

    
  
  
  
  
  
  
}





boolean isMouseDragged() {
  if (mousePressed) {
    return true;
  }
  return false;
}

int drawState() {
  if(key == 'f') return 1;
  else if(key == 'o') return 2;
 else if(key == 'd')  return 3;

return 1;
}

void mouseReleased() {
  // myHand.togglePixel(mouseX, mouseY);
}

void mouseDragged() {
  //myHand.togglePixel(mouseX, mouseY);
}


void keyReleased() {
  switch( key) {
  case 's': 
    saveFrame = true;
    break;    
  case 'c':
    copyFrame(copyCounter);
    copyCounter++;
  break;

}
  }



//void wipe(int frames, int offset) {
//
//  rotateY(radians(45));
//  translate(200, 200);
//  myHand.cubeCap();
//  myHand.display();
//  myHand.reset();
//
//  for (int i = 0; i<frames; i++) {
//    translate(0, 0, offset);
//    myHand.cubeSide();
//    myHand.display();
//    myHand.reset();
//  }
//
//  translate(0, 0, offset);
//  myHand.cubeCap();
//  myHand.display();
//  myHand.reset();
//}

//void wipeFrames(int frames, int offset, float scale) {
//
//  translate(offset, 0);
//  pushMatrix();
//  scale(scale, scale);
//  myHand.cubeCap();
//  myHand.show2D();
//  myHand.reset();
//  popMatrix();
//  for (int i = 0; i<frames; i++) {
//    translate(offset, 0);
//    pushMatrix();
//    scale(scale, scale);
//
//    myHand.cubeSide();
//    myHand.show2D();
//    myHand.reset();
//    popMatrix();
//  }
//  translate(offset, 0);
//
//  pushMatrix();
//  scale(scale, scale);
//
//  myHand.cubeCap();
//  myHand.show2D();
//  myHand.reset();
//  popMatrix();
//}

void keyPressed() {
  saveFrame = true;
}


void testSinglePix() {

  RPoint myPoint = new RPoint(10, 20);
  TColor myColor = TColor.newHSV(0, 0, 1);
  mPixel = new Pixel(myPoint, myColor);
  mPixel.on = true;
}

