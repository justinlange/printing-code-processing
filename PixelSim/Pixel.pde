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
  
  void setColor(){
c.invert();  
  }


  void show(boolean draw3d) {
    pushMatrix();
            translate(p.x, p.y);
        fill(c.hue(), c.saturation(), c.brightness(), .8);

 



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
        fill(c.hue(), c.saturation(), c.brightness(), .1);
      }
      rect(0, 0, pixSize, pixSize);
    }
      popMatrix();

  }
}
