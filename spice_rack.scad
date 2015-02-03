// Spice rack
$fn=100;

// reference Spice container
cont_max_height = 120;
cont_min_height = 50;
cont_dia = 50;
thickness = 2;

module spice_container(){
	cylinder(h=cont_max_height, r=cont_dia/2);
}


// parts that holds the spice container
module support(thickness, cont_dia){
	height = cont_min_height * 0.8;
	radius = thickness + cont_dia/2;
	back_factor = 1; //defines the width of the flat back

	union(){
		difference(){
			hull(){
				cylinder(h=height, r=radius);
				translate([-radius, -radius*(back_factor/2), 0])
					cube(size=[thickness*2, radius*back_factor,height]);
			}
			translate([0, 0, thickness]) spice_container();
			translate([cont_dia/2, cont_dia, thickness * 2 + cont_dia/2]){
				rotate([90, 0, 0]){
					spice_container();
				translate([-cont_dia/2, 0, 0])
					cube(size=[cont_dia, cont_dia, cont_max_height]);
					
				}
				
			}
		}
		
		translate([-radius-thickness, -radius, 0])
			cube(size=[thickness, radius*2, height], center=false);
	}

}

//spice_container();
for (i=[0:2]){
	translate([0, (cont_dia+thickness)*i, 0,])
		support(thickness, cont_dia);
	
}
