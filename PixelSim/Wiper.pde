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



