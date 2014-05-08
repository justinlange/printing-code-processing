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

  void init() {

    for (int i=0; i<xi; i++) {
      for (int j=0; j<yj; j++) {
        RPoint p = new RPoint(i*xSpacing,j*ySpacing);
        TColor c = TColor.newHSV(.5, 1, 1);
        TColor alt = TColor.newHSV(.1,1,1);
        leds[i][j] =  new Pixel(p, c, size);
      }
    }
  }


  void togglePixel(int x, int y, int action) {
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



  void display(boolean draw3d) {
    for (int i=0; i<xi; i++) {
      for (int j = 0; j<yj; j++) {
        leds[i][j].show(draw3d);
      }
    }
    //reset();
  }


  void reset() {
    for (int i=0; i<xi; i++) {
      for (int j = 0; j<yj; j++) {
        leds[i][j].on = false;
      }
    }
  }
}

