import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

WeightedRandomSet<Setting> settings = new WeightedRandomSet<Setting>();

settings.add(new Setting(55,20,5),1);


for(int i = 0; i< 3; i++){
  
  int ranNumber = ranColors.getRandom();

stroke(ranNumber);

}
