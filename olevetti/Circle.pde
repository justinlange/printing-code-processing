class Circle
{

  RPoint cPoint;
  float size;
  boolean used = false;
  TColor c;
  
  Circle() {
    
  cPoint = new RPoint();
  
  }
 
  Circle(RPoint _cPoint, float _size, TColor _c)
  {

    size = _size;
    c = _c;
  } 
  
  
  void display(){
    fill(c.hue(), c.saturation(), c.brightness());
    ellipse(cPoint.x, cPoint.y, size, size);
    
    
    
  }
}
 
