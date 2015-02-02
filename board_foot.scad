difference()
{
	linear_extrude(height = 20, center = true, convexity = 100)
   		import (file = "/home/carlos/3d_printing/Objects/board_feet_profile.dxf", layer = "Layer_1");

	$rotate([0,7,0]){
		translate([0,0,-2]){
			linear_extrude(height = 100, center = true, convexity = 100)
   				import (file = "/home/carlos/3d_printing/Objects/board_feet_profile.dxf", layer = "Layer_2");
		}
	}

	translate([29.5, 50.2, 0]){
		rotate([90,0,0]){
			cylinder(h = 6.2, r=13.5/2);
		}
	}
}
   