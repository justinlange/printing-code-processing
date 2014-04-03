import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;


import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;


ArrayList clusters = new ArrayList<Cluster>();

void setup()
{
    colorMode(HSB, 1, 1, 1);

  size(700, 1000);
  background(1,0,1);
  smooth();
  noStroke();
  fill(30,50);
  
  //Cluster testCluster = new Cluster(
   
   ColorList colors = new ColorList();
     colors.add( TColor.newHSV(0, 1, 1) );

  colors.add( NamedColor.DEEPPINK.copy() );
  colors.add( NamedColor.DARKBLUE.copy() );
  colors.add( NamedColor.LIGHTBLUE.copy() );
  colors.add( NamedColor.RED.copy() );
    colors.add( NamedColor.WHITE.copy() );

   
  // create a grid object
    ModularGrid grid = new ModularGrid(3, 4, 5, 50);

  ModularGrid background = new ModularGrid(3, 2, 0, 0);
  
  
  while(true)
  {
    // get a random collection of modules max 3x4
    Module module = background.getRandomModule(1, 3);
    
    TColor t = colors.get(int(random(0,colors.size())));
    fill(t.hue(), t.saturation(), t.brightness());
    
    // if there are any left, draw them
    if(module != null)
    {
            rect(module.x, module.y, module.w, module.h);

  
    }
    // else break out
    else
    {
      break;
    } 
  }
  
  // loop forever until we break out
  while(true)
  {
    // get a random collection of modules max 3x4
    Module module = grid.getRandomModule(2, 2);
    
    // if there are any left, draw them
    if(module != null)
    {
          RPoint mPosition = new RPoint();
      mPosition.x = module.x;
      mPosition.y = module.y;
      Cluster mCluster = new Cluster(3, (module.w+module.h)/2, mPosition, colors);
      clusters.add(mCluster);
      //rect(module.x, module.y, module.w, module.h);
      
      //rect(module.x, module.y, module.w, module.h);
    }
    // else break out
    else
    {
      break;
    } 
  }
  
  // we can even implement a function that draws the grid for us
 // grid.display();
}
