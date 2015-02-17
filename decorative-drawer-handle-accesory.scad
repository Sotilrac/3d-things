//Decorative drawer handle accesory
$fn=60;
module ddhc (od, id, height){
	difference(){
		union(){
			intersection(){
				cylinder(h=h, r=od/2);
				rotate_extrude(convexity = 10)
					translate([od/2-height, 0, 0])
						circle(r = height); 
			}
			cylinder(h=h, r=od/2-height);
		}
		
		cylinder(h=h, r=id/2);
	}
}

od = 25.4;
id = 8.5;
h = 5.9;
ddhc(od, id, h);
