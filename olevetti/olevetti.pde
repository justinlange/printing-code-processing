import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

import java.util.Iterator;


import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

ArrayList clusters = new ArrayList<Cluster>();

void setup()
{

    RG.init(this);

  
  colorMode(HSB, 1, 1, 1);

  size(700, 1000);
  background(1, 0, 1);
  smooth();
  noStroke();
  fill(30, 50);

  //Cluster testCluster = new Cluster(

  ColorList colors = new ColorList();
  colors.add( TColor.newHSV(.92, .94, .86) );
  colors.add( TColor.newHSV(.561, .98, .99) );
  colors.add( TColor.newHSV(.65, .8, .33) );
  colors.add( TColor.newHSV(.052, 1, .91) );
  colors.add( NamedColor.WHITE.copy() );


  // create a grid object
  // ModularGrid grid = new ModularGrid(16, 16, 5, 50);

  SquareGrid grid = new SquareGrid(6, 6, 0, 50);
  ModularGrid background = new ModularGrid(3, 2, 0, 0);



  //-----------background----------//

  int colorCounter = 0;

  while (true)
  {
    Module module = background.getRandomModule(3, 2);

    if (module != null)
    {

      TColor t = colors.get(colorCounter);
      fill(t.hue(), t.saturation(), t.brightness());
      rect(module.x, module.y, module.w, module.h);
      colorCounter++;
    }
    else
    {
      break;
    }
  }





  // loop forever until we break out
  while (true)
  {
    if (grid.counter > 100) break;
    // get a random collection of modules max 3x4
    Module module = grid.getSquareModule(4, 4);

    // if there are any left, draw them
    if (module != null)
    {

      int sizes[] = {
        15, 30, 45, 60
      };

      int randomSize = sizes[int(random(0, 3))] * 10;
      int constantSize = 150;
      RPoint mPosition = new RPoint();
      mPosition.x = module.x;
      mPosition.y = module.y;
      Cluster mCluster = new Cluster(3, module.h, mPosition, colors);
      mCluster.isNumeric = true;
      clusters.add(mCluster);
      //rect(module.x, module.y, module.w, module.h);

      //fill(random(0,1),.5,.5);
      //rect(module.x, module.y, module.w, module.h);
    }
    // else break out
    else
    {

      for (int i = 0; i< clusters.size(); i++) {
        // for(int i = 0; i< 4; i++) {
        TColor t = colors.get(int(random(0, colors.size())));
        fill(t.hue(), t.saturation(), t.brightness());

        Cluster c = (Cluster) clusters.get(i);
        c.display();
        //          clusters.get(i).display();
        //  line(s.a.x,s.a.y,s.b.x,s.b.y);
      }


      //break;
    }
  }

  // we can even implement a function that draws the grid for us
  
  grid.display();
  translate(500,500);
  //stroke(1,0,1);
  fill(1,0,1);
 // font.draw('h');
}

