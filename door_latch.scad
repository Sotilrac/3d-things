//  Door latch
$fn=20;

module latch(panel_depth, screw_distance, screw_dia){
	thickness = 1.5;
	latch_r = panel_depth / 7;
	hole_length = 2.5 * screw_dia;
	hole_r= screw_dia / 2;
	width = screw_dia*2;

	union(){
		// mount
		difference(){
			// backplate
			cube([screw_distance+hole_length/2+thickness, width, thickness]);
			// hole
			translate([screw_distance, 0, 0])
				#translate([-hole_length/2+hole_r, screw_dia, 0]) union(){
					cylinder(h=thickness, r=hole_r);
					translate([0, -hole_r, 0])
						cube(size=[hole_length-screw_dia, screw_dia, thickness]);
					translate([hole_length-screw_dia, 0 ,0])
						cylinder(h=thickness, r=hole_r);
				}
			// Rounded corners
			translate([screw_distance+hole_length/2+thickness-hole_r, 0, 0])
			 	union(){
			 		difference(){
			 			cube(size=[hole_r, hole_r, thickness]);
			 			translate([0, hole_r, 0]) cylinder(h=thickness, r=hole_r);
			 		}
			 		translate([0, width-hole_r, 0])
			 			difference(){
			 				cube(size=[hole_r, hole_r, thickness]);
			 				cylinder(h=thickness, r=hole_r);
			 			}
			 	}
		}
		// latch
		union(){
			cube(size=[thickness, width, panel_depth+latch_r]);
			hull(){
				difference(){
					translate([0, width, panel_depth+latch_r])
						rotate([90, 0, 0])
							cylinder(h=width, r=latch_r);
					translate([thickness, -0.1, panel_depth])
						cube(size=[latch_r, width+0.2, latch_r*2]);
				}
				
				translate([-latch_r, width, panel_depth+latch_r])
					rotate([90, 0, 0])
					linear_extrude(height = width, convexity = 10)
						polygon(points=[[0,0], [latch_r+thickness,0], [latch_r+thickness, latch_r*2]]);
			}

			//Fillet
			difference(){
				translate([thickness, 0, thickness])
					cube(size=[latch_r, width, latch_r]);
				translate([thickness+latch_r, width+0.1, latch_r+thickness])
					rotate([90, 0, 0])
						cylinder(h=width+0.2, r=latch_r);
			}
		}
	}


}

rotate([90,0,0]) 
	latch(20, 20, 4.5);