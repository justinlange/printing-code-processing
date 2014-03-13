class Cursor {

  PVector position;
  float charWidth;
  float lineHeight;
  float x;
  float y;

  Cursor(float _charWidth, float _lineHeight) {
    position = new PVector(0, 0);
    charWidth = _charWidth;
    lineHeight =  _lineHeight;
  }

  void move() {
    if ((position.x + (2*charWidth)) < width) {
      position.x = position.x + charWidth;
    }
    else {
      position.y = position.y + lineHeight;
      position.x = 0;
    }
    
    x = position.x;
    y = position.y;
  }


  PVector getPosition() {
    return position;
  }
}

