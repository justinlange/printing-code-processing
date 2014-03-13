class Letter {

  char _cursorPosition;
  char letter;
  float opacity;
  RPolygon polygon;
  RContour curContour;
  RShape shp;
  RFont rFont;

  Letter(char _letter, PVector _cursorPosition) {

    letter = _letter;
    polygon = new RPolygon( font.toPolygon(letter));
   
  }

  void init() {
  }

  void write() {

    pushMatrix();
    // translate((width / 2) - (polygon.getWidth() / 2), (height / 2) + (polygon.getHeight() / 2));
    //PVector center = new PVector(0,0);

    //rotate(radians(counter));

    for (int i = 0; i < polygon.contours.length; i++) {
      curContour = polygon.contours[i];
      noStroke();
      fill(random(150, 250));
      // beginShape();

      println(curContour.getArea());
      rectMode(CENTER);
    }
  popMatrix();
}

}
