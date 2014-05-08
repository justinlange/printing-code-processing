import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import geomerative.*; 
import org.apache.batik.svggen.font.table.*; 
import org.apache.batik.svggen.font.*; 
import java.util.Iterator; 
import toxi.color.*; 
import toxi.color.theory.*; 
import toxi.util.datatypes.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class PixelSim extends PApplet {












int copyCounter = 0;

boolean saveFrame = false;

Pixel mPixel;
Hand myHand;

ArrayList<Hand> handFrames;
int numFrames = 3;
int interfaceSpacing = 120; //distance between hand farames, but other variables affected from this


public void setup() {
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

public void draw() {
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

public void copyFrame(int index){
  
  
RPoint origin = new RPoint(handFrames.get(handFrames.size()-1).origin);
origin.x+= interfaceSpacing;

Hand tFrame = new Hand(origin);
tFrame.init();
//RPoint originOffset = new RPoint(interfaceSpacing,0);
//tFrame.origin.x+= interfaceSpacing+interfaceSpacing;
//tFrame.reset();
handFrames.add(tFrame);

    
  
  
  
  
  
  
}





public boolean isMouseDragged() {
  if (mousePressed) {
    return true;
  }
  return false;
}

public int drawState() {
  if(key == 'f') return 1;
  else if(key == 'o') return 2;
 else if(key == 'd')  return 3;

return 1;
}

public void mouseReleased() {
  // myHand.togglePixel(mouseX, mouseY);
}

public void mouseDragged() {
  //myHand.togglePixel(mouseX, mouseY);
}


public void keyReleased() {
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

public void keyPressed() {
  saveFrame = true;
}


public void testSinglePix() {

  RPoint myPoint = new RPoint(10, 20);
  TColor myColor = TColor.newHSV(0, 0, 1);
  mPixel = new Pixel(myPoint, myColor);
  mPixel.on = true;
}

class Hand {
  int size = 7;
  int xSpacing = size*3;
  int ySpacing = size*2;
  int zSpacing = size*3;
  Pixel[][] leds;
  int xi = 5;
  int yj = 10;
  RPoint p;
  TColor c;
  RPoint origin;
  int toggleDist = size;
  TColor alt;


  Hand(RPoint _origin) {
      origin = _origin;
    
    leds = new Pixel[xi][yj];
  }

  public void init() {

    for (int i=0; i<xi; i++) {
      for (int j=0; j<yj; j++) {
        RPoint p = new RPoint(i*xSpacing,j*ySpacing);
        TColor c = TColor.newHSV(.5f, 1, 1);
        TColor alt = TColor.newHSV(.1f,1,1);
        leds[i][j] =  new Pixel(p, c, size);
      }
    }
  }


  public void togglePixel(int x, int y, int action) {
    for (int i=0; i<xi; i++) {
      for (int j=0; j<yj; j++) {
        if (abs(leds[i][j].p.x + (size/2) - x + origin.x) < toggleDist && abs(leds[i][j].p.y + size/2 - y) < toggleDist) {
          if(action == 1) leds[i][j].on = true;
          if(action == 2){
            leds[i][j].on = !leds[i][j].on;
            leds[i][j].setColor();
          }
          if(action == 3) leds[i][j].on = false;
        }
      }
    }
  }

/*
  void debugPixel(int x, int y) {
    for (int i=0; i<xi; i++) {
      for (int j=0; j<yj; j++) {
        leds[i][j].on = !leds[i][j].on;
      }
    }
  }

*/



  public void display(boolean draw3d) {
    for (int i=0; i<xi; i++) {
      for (int j = 0; j<yj; j++) {
        leds[i][j].show(draw3d);
      }
    }
    //reset();
  }


  public void reset() {
    for (int i=0; i<xi; i++) {
      for (int j = 0; j<yj; j++) {
        leds[i][j].on = false;
      }
    }
  }
}

int pixSize = 4;


class Pixel {

  RPoint p;
  TColor c;
 
  boolean on;

  Pixel(RPoint _p, TColor _c, int _pixSize) {

    p = _p;
    c = _c;
    on = false; 
    pixSize = _pixSize;
  }

  Pixel(RPoint _p, TColor _c) {

    p = _p;
    c = _c;
    on = false; 
    pixSize = 4;
  }
  
  public void setColor(){
c.invert();  
  }


  public void show(boolean draw3d) {
    pushMatrix();
            translate(p.x, p.y);
        fill(c.hue(), c.saturation(), c.brightness(), .8f);

 



    if (draw3d) {
      if (on) {
        noStroke();
        box(pixSize);
      }
    } else {
      if (on) {
        stroke(c.hue(), c.saturation(), c.brightness(), 1);
        fill(c.hue(), c.saturation(), c.brightness(), 1);
      } else {
        strokeWeight(1);
        stroke(c.hue(), c.saturation(), c.brightness(), 1);
        fill(c.hue(), c.saturation(), c.brightness(), .1f);
      }
      rect(0, 0, pixSize, pixSize);
    }
      popMatrix();

  }
}
//
//void cube2D(int frames, int offset) {
//
//    pushMatrix();
//    scale(.5, .5);
//    //rotateY(radians(45));
//
//    for (int i=0; i<xi; i++) {
//      for (int j = 0; j<yj; j++) {
//        leds[i][j].on = true;
//      }
//    }
//    display();
//
//    translate(offset, 0);
//
//    for (int f = 0; f< frames; f++) {
//      for (int i=0;i<xi;i++) {
//        leds[i][0].on = true;
//        leds[i][yj-1].on = true;
//      }
//
//      for (int j=0;j<yj;j++) {
//        leds[0][j].on = true;
//        leds[xi-1][j].on = true;
//      }
//      display();
//      translate(offset, 0);
//    }
//
//
//    for (int i=0; i<xi; i++) {
//      for (int j = 0; j<yj; j++) {
//        leds[i][j].on = true;
//      }
//    }
//    display();
//
//    popMatrix();
//  }
//

//
//  void cube2D(int frames, int offset) {
//
//    pushMatrix();
//    scale(.5, .5);
//    //rotateY(radians(45));
//
//    for (int i=0; i<xi; i++) {
//      for (int j = 0; j<yj; j++) {
//        leds[i][j].on = true;
//      }
//    }
//    display();
//
//    translate(offset, 0);
//
//    for (int f = 0; f< frames; f++) {
//      for (int i=0;i<xi;i++) {
//        leds[i][0].on = true;
//        leds[i][yj-1].on = true;
//      }
//
//      for (int j=0;j<yj;j++) {
//        leds[0][j].on = true;
//        leds[xi-1][j].on = true;
//      }
//      display();
//      translate(offset, 0);
//    }
//
//
//    for (int i=0; i<xi; i++) {
//      for (int j = 0; j<yj; j++) {
//        leds[i][j].on = true;
//      }
//    }
//    display();
//
//    popMatrix();
//  }


//
//  void cube(int frames, int offset) {
//
//    pushMatrix();
//    for (int i=0; i<xi; i++) {
//      for (int j = 0; j<yj; j++) {
//        leds[i][j].on = true;
//      }
//    }
//    display();
//
//    for (int f = 0; f< frames; f++) {
//      for (int i=0;i<xi;i++) {
//        leds[i][0].on = true;
//        leds[i][yj-1].on = true;
//      }
//
//      for (int j=0;j<yj;j++) {
//        leds[0][j].on = true;
//        leds[xi-1][j].on = true;
//      }
//      translate(0, 0, offset);
//      display();
//    }
//    for (int i=0; i<xi; i++) {
//      for (int j = 0; j<yj; j++) {
//        leds[i][j].on = true;
//      }
//    }
//    display();
//
//    popMatrix();
//  }



  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "PixelSim" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
