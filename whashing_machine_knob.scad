module stem (d, height){
	cylinder(h=height, r=d/2);
}

module keyed_hole(d, key, height){
	intersection(){
		cylinder(h=height, r=d/2);
		// key
		translate([-d/2, -d/2, 0]){
			cube(size=[d, key, height]);
		}
	}
}

module knob(od, id, height, rim_height, dome_height){
	sphere_r = od*1;
	difference(){
		union(){
			cylinder(h=rim_height, r=od/2);
			intersection(){
				translate([0, 0, (-sphere_r+rim_height+dome_height)+3])sphere(r=sphere_r);
				translate([0, 0, rim_height]) cylinder(h=dome_height*1.5, r=od/2);
			}
		
		}
		//cylinder(h=dome_height+rim_height, r=id/2);
	}
}
module handle(height, width, length){
	hull(){
		intersection(){
			hull(){
				translate([-width/2, 0, 0]) rotate(90) cube(size=[width, length-width, height]);
				translate([-length+width/2, width/2, 0]) cylinder(h=height, r=width/2);
				translate([-width/2, width/2, 0]) cylinder(h=height, r=width/2);
			}
			translate([-length/2, width/2, -height/2]) rotate([90, 90, 0])
				hull(){
					rotate_extrude(convexity = 10)
						translate([(length-width), 0, 0])
							circle(r = width/2);

					translate([0, 0, -width/2])cylinder(h=width, r=(length-width));
					
				}
		}
		translate([-width/10, width/2, 0]) rotate(90) cylinder(h=height*0.85, r=width/10);
	}

}

$fn=50;
stem_offset = 6;
stem_height = 13;
rim_height= 2;
stem_dia = 18;
knob_dia = 44;
knob_width = 9;
stem_key = 17;

union(){
	//knob
	difference(){
		union(){
			translate([0, 0, stem_offset]) knob(knob_dia, stem_dia, 25, rim_height,  stem_height - stem_offset - rim_height);
			translate([knob_dia/2, -knob_width/2, stem_offset]) handle(27, knob_width, knob_dia);
		}
		keyed_hole(stem_dia+0.4, stem_key+0.4, stem_height);
	}
	//stem
	color([0.5, 0.5, 0.5]) difference(){
		keyed_hole(stem_dia, stem_key, stem_height);
		keyed_hole(7.34, 6.3, stem_height);
	}
}

