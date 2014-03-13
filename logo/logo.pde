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
  colorMode(HSB, 1, 1, 1);
  size(1280, 800);
    size(12800, 8000);

  noStroke();
  background(0, 0, 1);
  smooth();
  String saveString = "data/" + year() + month() + day() + hour() + minute() + second() + "_grab.pdf";   
      //size(round(print_width * make_bigger), round(print_height * make_bigger));
 beginRecord(PDF, saveString);   
  
  

  eachCard();
  
  saveFrame("grab.png");

  endRecord();

}

void eachCard() {
  
  
  int numCol = 8;
  int numRow = 12;
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

  pushMatrix();
  translate(grid.modules[2][4].x, grid.modules[2][4].y);
  logo();
  popMatrix();

  int fontX = 150;
  int fontY = height / 2;
  int fontHeight = int(fn * 100);
  int fontSize = int(fn * 40);


  RFont font = new RFont("luxisr.ttf", 400, RFont.LEFT);
  RFont waldorf = new RFont("antrf.ttf", 400, RFont.LEFT);

  // PFont pFont = loadFont("luxisr.ttf");
  font.setSize(fontSize);
  waldorf.setSize(fontSize);



  String biz = "Kaleidoscope Creative";
  String slugline = "Re-envisioning Education and the Arts";
  String dorna = "Dorna Lange, Education Strategist";
  String contact = "B:dorna.blogspot.com   P:518-567-8924   E:dorna.lange@gmail.com";


  pushMatrix();
  translate(grid.modules[3][6].x, grid.modules[3][6].y);


  RGroup myGroup =  font.toGroup(biz);

  myGroup.addElement(font.toGroup(slugline));
  // myGroup.translate(startModule.x, startModule.y+startModule.h);
  float scaleFactor = (startModule.w * 5)/ myGroup.getWidth();
  // float scaleFactor = 1;
  //myGroup.scale(scaleFactor, scaleFactor, myGroup.getBottomLeft());
  myGroup.transform(startModule.x, startModule.y, startModule.w * 4, startModule.h * 6 + grid.gutterSize);



  //RShape letterShape = font.toShape(font);
  //noStroke();
  //  TColor m = moreColors.getAverage(1);
  TColor m = moreColors.getDarkest();

  fill(m.hue(), m.saturation(), m.brightness());
  stroke(m.hue(), m.saturation(), m.brightness());

  waldorf.draw(biz);
  translate(0, grid.modules[0][0].y);
  font.setSize(int(fontSize*.618));

  font.draw(slugline);


  translate(0, grid.modules[0][2].y);

  popMatrix();
  pushMatrix();
  font.setAlign(CENTER);
  translate(grid.modules[numCol/2][numRow-1].x, grid.modules[0][numRow-1].y - grid.modules[0][0].h + grid.gutterSize);
  font.draw(dorna);


  translate(0, grid.modules[0][0].y);
  popMatrix();
  translate(grid.modules[numCol/2][numRow-1].x, grid.modules[0][numRow-1].y);
  font.setSize(int(fontSize*0.618*.618));
  font.setAlign(RFont.CENTER);

  font.draw(contact);

  noStroke();
  //p.setFill(m.hue(),m.saturation(),m.brightness());

  //translate(grid.modules[1][1].x, grid.modules[1][1].y);

  //myGroup.draw();

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


}


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

    fill(0, 0, 1, 200);
    if (!lineOnly)    triangle(0, 0, 100, fn*100, 0, 100*fn*fn);


    TColor c = moreColors.get(index);

    fill(c.hue(), c.saturation(), c.brightness(), min((i/3), 150));
    //rect(300,300,300,300);
    stroke(c.hue(), c.saturation(), c.brightness(), min((i/3), 50));
    if (lineOnly) {

      line(start.x, start.y, center.x, center.y);
    }

    if (!lineOnly)  triangle(0, 0, 100, fn*100, 0, 100*fn*fn);


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


