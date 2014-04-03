class Cluster
{
  int units;
  RPoint position;
  ColorList colors;
  Circle[][] circles;
  float size;
  int colorCount;

  float scale;  

  Cluster(int _units, float _size, RPoint _position, ColorList _colors) {

    units = _units;
    position = _position;
    colors = _colors;
    size = _size;

    circles = new Circle[units][units];
    
    colorCount = colors.size();

    for (int i = 0; i< units; i++) {
      for (int j= 0; j< units; j++) {

        circles[i][j] = new Circle();
        circles[i][j].cPoint.x =  i*(size/units);
        circles[i][j].cPoint.y = i*(size/units);
        circles[i][j].size = size/units;
        circles[i][j].c = colors.get(int(random(0, colorCount-1)));
      }
    }
  }

  void display() {
    for (int i = 0; i< units; i++) {
      for (int j= 0; j< units; j++) {
        circles[i][j].display();
      }
    }
  }
}

