class flatShape {

  // polyhgon
  float x; 
  float y; 
  float radius; 
  int npoints;
  PVector pointB;
  float angle;

  // constructor
  flatShape(float _radius){
    _radius = radius;
  }

  // draws polygon 
  void create(){
   float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

}
  
