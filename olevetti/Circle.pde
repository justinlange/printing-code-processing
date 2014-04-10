class Circle
{

  RPoint cPoint;
  float size;
  boolean used = false;
  TColor c;
  String letter;
  RFont font;
  char mChar;
  
  Circle() {
    
  cPoint = new RPoint();
  font = new RFont("FreeSans.ttf", 50, RFont.CENTER);

  }
 
  Circle(RPoint _cPoint, float _size, TColor _c, String _letter)
  {

    size = _size;
    c = _c;
    letter = _letter;
    mChar = letter.charAt(0);
  } 
  
  
  void display(){
    

    
    fill(c.hue(), c.saturation(), c.brightness());
    ellipse(cPoint.x, cPoint.y, size, size);
    fill(1,0,0);
    //font.draw(mChar);
    text(letter, cPoint.x, cPoint.y);
    
    
    
  }
}
 
