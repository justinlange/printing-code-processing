import geomerative.*;
import processing.pdf.*;


import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;
import java.util.Iterator; 

TColor col;
ColorTheoryStrategy s;
ColorList moreColors;
ColorList colors;

float fn = 1.618;
int numColors = 15;  

boolean lineOnly = false;
boolean showGrid = false;

void setup()
{
  //smooth();
  colorMode(HSB, 1, 1, 1);
  size(1280, 800);
  //size(1280*2, 800*2);
  //size(1280*4, 800*4);
  //size(1280/2, 800/2);


  noStroke();
  background(0, 0, 1);
  smooth();
  String saveString = "data/" + year() + month() + day() + hour() + minute() + second() + "_grab.pdf";   
  String saveStringPng = "images/data/" + year() + month() + day() + hour() + minute() + second() + "_grab.png";   

  beginRecord(PDF, saveString);   

  eachCard();

  saveFrame(saveStringPng);
  endRecord();
}

void eachCard() {

  int numCol = 8;
  int numRow = 12;

  RG.init(this);
  ModularGrid grid = new ModularGrid(numCol, numRow, height/80, height/16);
  Module startModule = grid.modules[0][0];

  col = ColorRange.SOFT.getColor();
  s = new CompoundTheoryStrategy();
  colors = ColorList.createUsingStrategy(s, col);
  moreColors = new ColorRange(colors).addHueRange(.6, 1).addBrightnessRange(.6, 1).addSaturationRange(.7, .9).getColors(null, numColors, 1);
  moreColors.sortByDistance(false);

 // bground();

  stroke(1, 1, 1);
  strokeWeight(1);

  if (showGrid) {

    for (int i=0;i<numCol;i++) {
      for (int j=0;j<numRow;j++) {
        rect(grid.modules[i][j].x, grid.modules[i][j].y, grid.modules[i][j].w, grid.modules[i][j].h);
      }
    }
  }

  pushMatrix();
  translate(grid.modules[2][4].x, grid.modules[2][4].y);
  logo();
  popMatrix();

  int fontX = int(width/8.5);
  int fontY = height / 2;
  int fontHeight = int(fn * height/8);
  int fontSize = int(fn * height/20);


  RFont font = new RFont("luxisr.ttf", height/2, RFont.LEFT);
  RFont waldorf = new RFont("antrf.ttf", height/2, RFont.LEFT);

  // PFont pFont = loadFont("luxisr.ttf");
  font.setSize(fontSize);
  waldorf.setSize(fontSize);

  String biz = "Kaleidoscope Creative";
  String slugline = "Re-envisioning Education and the Arts";
  String dorna = "Dorna Lange, Education Strategist";
  String contact = "B:dorna.blogspot.com   P:518-567-8924   E:dorna.lange@gmail.com";


  pushMatrix();

  translate(grid.modules[3][6].x, grid.modules[3][6].y);
  TColor m = moreColors.getDarkest();
  fill(m.hue(), m.saturation(), m.brightness());
  stroke(m.hue(), m.saturation(), m.brightness());
  waldorf.draw(biz);

  translate(0, grid.modules[0][0].y);
  font.setSize(int(fontSize*.618));
  font.draw(slugline);  
  popMatrix();

  pushMatrix();
  font.setAlign(CENTER);
  translate(grid.modules[numCol/2][numRow-1].x, grid.modules[0][numRow-1].y - grid.modules[0][0].h + grid.gutterSize);
  font.draw(dorna);
  popMatrix();

  translate(grid.modules[numCol/2][numRow-1].x, grid.modules[0][numRow-1].y);
  font.setSize(int(fontSize*0.618*.618));
  font.setAlign(RFont.CENTER);
  font.draw(contact);
}


void bground() {

  float divFactor = height/numColors;
  strokeWeight(divFactor);

  for (int i = 0; i<height;i++) {
    TColor c = moreColors.get(i%numColors);
    stroke(c.hue(), c.saturation(), c.brightness(), 25);
    line(0, i*divFactor, width, i*divFactor);
  }
}


void logo() {

  int index = 0;
  pushMatrix();
  pushStyle();
  noStroke();

  float startRad = (random(0, 360));
  rotate(radians(startRad));

  int closeness = 360/numColors; //determines the number of triangle elements
  int cnt = 2;
  int lastCounter = 1;
  int i = 50;
  int inc = 0;
  int pCloseness = closeness; //needed for the next line, so that the triangels wrap all the way around

  while (i <360+ pCloseness) {

    int maxBright = 75; //we are working in HSB color space, but alpha channel is still 0-255
    pushMatrix();
    rotate(radians(i));
    strokeWeight(2);
    float lineX = random(0, height/8);
    float lineY = random(0, height/8);
    PVector start = new PVector(lineX, lineY);
    PVector end = new PVector(0, 0);
    PVector center = PVector.lerp(start, end, 3);

    fill(0, 0, 1, 200);
    if (!lineOnly)    triangle(0, 0, height/8, fn*height/8, 0, height/8*fn*fn);

    TColor c = moreColors.get(index);
    fill(c.hue(), c.saturation(), c.brightness(), min((i/3), 150));
    stroke(c.hue(), c.saturation(), c.brightness(), min((i/3), 50));

    if (lineOnly) {
      line(start.x, start.y, center.x, center.y);
      //make more lines here..
    }

    if (!lineOnly)  triangle(0, 0, height/8, fn*height/8, 0, height/8*fn*fn);

    cnt = cnt + lastCounter;
    lastCounter = cnt;
    i+=closeness;
    index++;
    popMatrix();
    fill(255, 255, 255);
  }  
  popStyle();
  popMatrix();
}

