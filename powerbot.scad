//PowerBot Cheap wireless charger
$fn=60;
use <MCAD/boxes.scad>
usb_l = 20;
usb_w = 10;
usb_h = 6.15;


module powerbot(){
	union(){
		linear_extrude(height = 10.75, convexity = 500)
	   		import (file = "powerbot_outline.dxf", layer = "Layer_1");
		translate([66.22/2, -usb_l/2+1, usb_h/2])
			rotate([90, 90, 0])
				roundedBox([usb_h, usb_w, usb_l+1], 3, true);
	}

}

powerbot();

//roundedBox([5,6,7],1, true);