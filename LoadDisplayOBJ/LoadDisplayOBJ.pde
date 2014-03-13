/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen. 
 */


PShape cow;

float ry;
  
public void setup() {
  size(640, 360, P3D);
    
  cow = loadShape("cow.obj");
}

public void draw() {
  background(150);
  lights();
  
  color(255);
  scale(100);
  rotateX(radians(180));
  translate(2,-3,8);
  //rotateZ(PI);
  rotateY(ry);
  shape(cow);
  
  ry += 0.02;
}
