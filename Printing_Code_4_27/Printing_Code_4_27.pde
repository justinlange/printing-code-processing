import geomerative.*;

float movePlace = 0;

void setup(){
  size(1280,800);
  smooth();
  fill(200);
noStroke();
background(255);
}
void draw(){
  fill(100);
  RG.init (this);
  
  translate(500,0);
  RShape wave = new RShape();
  wave.addMoveTo(100,100);
  wave.addBezierTo(150,0,250,0,300,100);
  wave.addLineTo(300,300);
  wave.addBezierTo(250,400,150,400,100,300);
  wave.addLineTo(100,100);


 // wave.addBezierTo(100,100,150,200,200,100);
 // wave.addBezierTo(200,100,250,0,300,100);
 // wave.addLineTo(0,300);
 //wave.fill(255,0,0);

 movePlace+= 0.001;

  wave.draw();
  
  fill(255,0,0);
  RPoint mPoint = wave.getPoint(movePlace%1);

   
 RShape zar = RShape.createEllipse(mPoint.x,mPoint.y,5,10);
   
   
   
 zar.createCircle(50,50,50);
 zar.draw();
}



