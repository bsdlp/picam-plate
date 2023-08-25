include <BOSL/constants.scad>
use <BOSL/shapes.scad>

$fs = 0.01;

cam_hole_x_dist = 25 - 2 - 2;
cam_hole_y_dist = 14.5 - 2;
cam_pcb_x_length = 25;
cam_pcb_y_length = 23.862;

// this is for the pi 4b and the HQ camera module
difference()
{
    cuboid([ 85, 56, 2.75 ], fillet = 3, edges = EDGES_Z_ALL, center = false);

    // pi holes
    translate([ 3.5, 3.5, -1 ]) cylinder(h = 5, r = 1.35);
    translate([ 3.5, 49 + 3.5, -1 ]) cylinder(h = 5, r = 1.35);
    translate([ 3.5 + 58, 3.5, -1 ]) cylinder(h = 5, r = 1.35);
    translate([ 3.5 + 58, 49 + 3.5, -1 ]) cylinder(h = 5, r = 1.35);

    // mid: 42.5 x 28

    // camera holes
    translate([ (85 / 2) + (cam_hole_x_dist / 2), (56 / 2) + (cam_hole_y_dist / 2), -1 ]) // 57.5 x 43
        cylinder(h = 5, r = 1.35);
    translate([ (85 / 2) - (cam_hole_x_dist / 2), (56 / 2) + (cam_hole_y_dist / 2), -1 ]) // 23.5 x 43
        cylinder(h = 5, r = 1.35);
    translate([ (85 / 2) + (cam_hole_x_dist / 2), (56 / 2) - (cam_hole_y_dist / 2), -1 ]) // 57.5 x 13
        cylinder(h = 5, r = 1.35);
    translate([ (85 / 2) - (cam_hole_x_dist / 2), (56 / 2) - (cam_hole_y_dist / 2), -1 ]) // 23.5 x 13
        cylinder(h = 5, r = 1.35);

    // cable gap 23 x 7
    cable_connector_length = 5.71;
    // y distance between hole and cable connector
    cable_connector_offset = cam_pcb_y_length - (cam_hole_y_dist + (2 * 2)) - cable_connector_length;
    cable_connector_buffer = 1;
    cable_cutout_length = 10;
    cable_cutout_width = cam_pcb_x_length;

    translate([
        (85 / 2) - (cable_cutout_width / 2),
        (56 / 2) -
            ((cam_hole_y_dist + (2 * 2)) / 2 + cable_connector_offset + cable_cutout_length + cable_connector_buffer),
        -1
    ]) cuboid([ cable_cutout_width, cable_cutout_length, 5 ], fillet = 3, edges = EDGES_Z_ALL, center = false);

    // microsd gap 13 x 15
    // y 17.9
    translate([ -3, 17.9, -1 ]) cuboid([ 16, 20, 5 ], fillet = 3, edges = EDGES_Z_ALL, center = false);
};