import geomerative.*;

import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator; 


TColor col;
ColorTheoryStrategy s;
ColorList moreColors;
ColorList colors;
float fn = 1.618;

boolean showGrid = false;

int numColors = 15;


void bground() {

  float divFactor = height/numColors;
  strokeWeight(divFactor);


  for (int i = 0; i<height;i++) {
    TColor c = moreColors.get(i%numColors);
    //fill(c.hue(), c.saturation(), c.brightness());
    //rect(300,300,300,300);
    stroke(c.hue(), c.saturation(), c.brightness(), 25);

    line(0, i*divFactor, width, i*divFactor);

    // line(0,i*divFactor/3,width,i*divFactor/3);
  }
}


void logo() {


  //for(int k = 0;k<15; k++){
  int index = 0;
  pushMatrix();
  pushStyle();
  //noFill();
  //stroke(0,255,0);
  noStroke();



  float startRad = (random(0, 360));
  rotate(radians(startRad));

  int closeness = 360/numColors;
  float angle = TWO_PI / 5;
  float radius = 100;
  int cnt = 2;
  int lastCounter = 1;
  int i = 50;
  int inc = 0;

  int pCloseness = closeness;


  while (i <360+ pCloseness) {


    int maxBright = 75;
    //fill(0,255,0,min(i/(255/(maxBright)),maxBright));

    pushMatrix();
    rotate(radians(i));  
    //  ellipse(0,0,400,50);

    strokeWeight(2);
    float lineX = random(0, 100);
    float lineY = random(0, 100);
    PVector start = new PVector(lineX, lineY);
    PVector end = new PVector(0, 0);


    //for(int m = 0; m<1; m++){
    PVector center = PVector.lerp(start, end, 3);
    //triangle(0,0,100,fn*100,0,100*fn*fn);

    fill(0, 0, 1);
    triangle(0, 0, 100, fn*100, 0, 100*fn*fn);


    TColor c = moreColors.get(index);

    fill(c.hue(), c.saturation(), c.brightness(), min((i/3), 150));
    //rect(300,300,300,300);
    stroke(c.hue(), c.saturation(), c.brightness(), min((i/3), 50));
    //line(start.x,start.y, center.x,center.y);
    triangle(0, 0, 100, fn*100, 0, 100*fn*fn);


    // }


    /*
      fill(255,0,0,min(i/3,100));
     triangle(0,0,i,i,0,i);
     */


    cnt = cnt + lastCounter;
    lastCounter = cnt;
    i+=closeness;
    index++;
    popMatrix();
    fill(255, 255, 255);
  }  

  //ellipse(0,0,400,50);


  popStyle();
  popMatrix();
}


void setup()
{



  colorMode(HSB, 1, 1, 1);

  size(1280, 800);
  noStroke();
  background(0, 0, 1);
  smooth();

  int numCol = 6;
  int numRow = 6;
  RG.init(this);
  ModularGrid grid = new ModularGrid(numCol, numRow, 10, 50);
  Module startModule = grid.modules[0][0];


  col = ColorRange.SOFT.getColor();
  s = new CompoundTheoryStrategy();
  colors = ColorList.createUsingStrategy(s, col);
  moreColors = new ColorRange(colors).addHueRange(.6, 1).addBrightnessRange(.6, 1).addSaturationRange(.7, .9).getColors(null, numColors, 1);
  moreColors.sortByDistance(false);

  bground();

  stroke(1, 1, 1);
  strokeWeight(1);

  if (showGrid) {

    for (int i=0;i<numCol;i++) {
      for (int j=0;j<numRow;j++) {
        rect(grid.modules[i][j].x, grid.modules[i][j].y, grid.modules[i][j].w, grid.modules[i][j].h);
      }
    }
  }

  translate(grid.modules[1][2].x, grid.modules[1][2].y);
  logo();


  int fontX = 150;
  int fontY = height / 2;
  int fontHeight = int(fn * 100);
  int fontSize = int(fn * 50);


  RFont font = new RFont("luxisr.ttf", 100, RFont.LEFT);
  //font.setSize(100);


  String biz = "Kaleidoscope Creative";
  String slugline = "Re-envisioning Education and the Arts";
  String dorna = "Dorna Lanfe";
  String blogName = "B:dorna.blogspot.com";
  String phone = "P:518-567-8924";
  String email = "dorna.lange@gmail.com";


  translate(grid.modules[1][1].x, grid.modules[1][1].y);


  RGroup myGroup =  font.toGroup(biz);
  myGroup.translate(startModule.x, startModule.y+startModule.h);
  float scaleFactor = (startModule.w * 5)/ myGroup.getWidth();
  myGroup.scale(scaleFactor, scaleFactor, myGroup.getBottomLeft());
  myGroup.transform(startModule.x, startModule.y, startModule.w * 2, startModule.h * 2 + grid.gutterSize);
  // myGroup.transform(0,0,100,100);

  RPolygon p = myGroup.toPolygon(); 
  println(myGroup.getTopLeft().x + " " + myGroup.getTopLeft().y + " " +  myGroup.getBottomRight().x  + " " + myGroup.getBottomRight().y );


  //RShape letterShape = font.toShape(font);

  //noStroke();
  TColor m = moreColors.get(2);
  fill(m.hue(), m.saturation(), m.brightness());
  stroke(m.hue(), m.saturation(), m.brightness());


  noStroke();
  //p.setFill(m.hue(),m.saturation(),m.brightness());

  //translate(grid.modules[1][1].x, grid.modules[1][1].y);

  myGroup.draw();

  //font.draw(biz);
  // get text width

  // draw rectangle around box
  noFill();
  stroke(150);

  // now let's draw a line between every character
  stroke(255, 0, 0);
  float xPos = 0;

  /*
  for(int i = 0; i < sentence.length(); i++)
   {
   char c = sentence.charAt(i);
   xPos += textWidth(c);
   line(xPos, -fontHeight, xPos, 0);
   }
   */


  saveFrame("grab.png");
}

void text() {

}

