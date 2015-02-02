module dt900()
{
  dt900_end_to_end = 120.1;
  dt900_width = 60;
  dt900_thickness = 11;
  dt900_charge_diam = 7;
  dt900_charge_offset = 1.5;
  dt900_charge_length = 18.5;

  extra_front = 0.6;

  // main body
  hull()
  {
    for(i=[-1,+1])
    translate([i*(dt900_end_to_end-dt900_width)/2, 0, extra_front/2])
    cylinder(r=dt900_width/2, h=dt900_thickness+extra_front, $fn=42, center=true);
  }

  // charger (on right)
  translate([0, 0, dt900_charge_offset])
  rotate([0, 90, 0])
  cylinder(r=dt900_charge_diam/2, h=dt900_charge_length+dt900_end_to_end/2, $fn=24);
}

dt900();