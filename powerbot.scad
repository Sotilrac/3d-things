//PowerBot Cheap wireless charger

module powerbot(){
	linear_extrude(height = 20, center = true, convexity = 100)
   		import (file = "/home/carlos/3d_printing/Objects/cheap_charger_outline.dxf",
   			    layer = "Layer_1");

}

#powerbot();