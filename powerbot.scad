//PowerBot Cheap wireless charger
use <MCAD/boxes.scad>

module powerbot(){
	linear_extrude(height = 20, center = true, convexity = 100)
   		import (file = "/home/carlos/3d_printing/Objects/cheap_charger_outline.dxf",
   			    layer = "Layer_1");

}

#powerbot();

roundedBox([5,6,7],1);