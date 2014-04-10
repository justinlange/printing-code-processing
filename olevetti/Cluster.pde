class Cluster
{
  int units;
  RPoint position;
  ColorList colors;
  Circle[][] circles;
  float size;
  int colorCount;
  boolean isNumeric;
  float scale;  

  Cluster(int _units, float _size, RPoint _position, ColorList _colors) {

    units = _units;
    position = _position;
    colors = _colors;
    size = _size;

    circles = new Circle[units][units];
    
    colorCount = colors.size();

    int counter = 0;

    for (int i = 0; i< units; i++) {
      for (int j= 0; j< units; j++) {
        
        counter++;

        circles[i][j] = new Circle();
        circles[i][j].cPoint.x =  i*(size/units);
        circles[i][j].cPoint.y = j*(size/units);
        circles[i][j].size = size/units;
        circles[i][j].c = colors.get(int(random(0, colorCount)));
//        circles[i][j].letter = " "; 
        circles[i][j].letter = str(counter);
        //if(isNumeric) circles[i][j].letter = str(counter);
        //if(isNumeric) circles[i][j].mChar = 'h';

      }
    }
  

}

  void display() {
    pushMatrix();
    translate(position.x,position.y);
    translate(circles[0][0].size/2, circles[0][0].size/2);
    for (int i = 0; i< units; i++) {
      for (int j= 0; j< units; j++) {
        circles[i][j].display();
      }
    }
  popMatrix();
  }
}

