include <BOSL/constants.scad>
use <BOSL/shapes.scad>

$fs = 0.01;

// this is for the pi 4b and the HQ camera module
difference() {
    cuboid([85,56,2.75], fillet=3, edges=EDGES_Z_ALL, center=false);
    
    // pi holes
    translate([3.5, 3.5, -1])cylinder(h=5,r=1.35);
    translate([3.5, 49+3.5, -1])cylinder(h=5,r=1.35);
    translate([3.5+58, 3.5, -1])cylinder(h=5,r=1.35);
    translate([3.5+58, 49+3.5, -1])cylinder(h=5,r=1.35);
    
    // mid: 42.5 x 28
    
    // camera holes
    translate([(85/2)+(38/2)-4, (56/2)+(38/2)-4, -1])  // 57.5 x 43
    cylinder(h=5,r=1.35);
    translate([(85/2)-(38/2)+4, (56/2)+(38/2)-4, -1])  // 23.5 x 43
    cylinder(h=5,r=1.35);
    translate([(85/2)+(38/2)-4, (56/2)-(38/2)+4, -1])  // 57.5 x 13
    cylinder(h=5,r=1.35);
    translate([(85/2)-(38/2)+4, (56/2)-(38/2)+4, -1])  // 23.5 x 13
    cylinder(h=5,r=1.35);
    
    // 6 diameter
    // 24 in between nuts
    // 7 from edge
    translate([(85/2)+(24/2), 56/2, -1])
    cylinder(h=5, r=3);
    
    translate([(85/2)-(24/2), 56/2, -1])
    cylinder(h=5, r=3);

    
    // cable gap 23 x 16
    // x 30.9
    translate([30.9, -3, -1])
    cuboid([23,19,5], fillet=3, edges=EDGES_Z_ALL, center=false);
    
    // microsd gap 13 x 15
    // y 17.9
    translate([-3, 17.9, -1])
    cuboid([16, 20, 5], fillet=3, edges=EDGES_Z_ALL, center=false);
};
