 //Corwin Hansen
 //3D printable anachoic panel. Generated a 160 by 160 panel with 20 wide, 50 tall pyramids, with 10 thick base.
 width = 160; //width of the panel. must be integer multiple of the pyramid_width
 length = width; //length of the panel. must be integer multiple of the pyramid_width
 base = 10;
 height = 50; //height of the pyramid
 pyramid_width = 20; //width of each pyramid on the side
 flat_edge = true; //gives flat or nonflat edge
 
 if (flat_edge){
     translate([-width/2, -length/2, base]) { //center the whole thing
        intersection(){ //cut everythong outside the bounding box
            translate ([0, 0, -base]) {//move boundry box
                    cube( [width, length, height+base], center = false);//create the box defining the boundry
                 }
            union() {
                 translate ([0, 0, -base]) {//move base to the correct location
                    cube( [width, length, base], center = false);//create base
                 }
                 for (i = [0:width/pyramid_width]) { //for each pyramid accounting for all x and y axis
                     for ( j = [0:width/pyramid_width]) {
                         translate([pyramid_width*i, pyramid_width*j,0]){ //move it to the right place
                             rotate([0, 0, 45]) {//rotate the pyramid to face the right direction
                                cylinder(height, pyramid_width/sqrt(2), 0, $fn=4);//generate each pyramids
                             }
                         }
                     }
                 }
             }
         }
     }
 }
 else {
     translate([-(width+pyramid_width)/2, -(length+pyramid_width)/2, base]) { //center the whole thing
         union() {
             translate ([pyramid_width/2, pyramid_width/2, -base]) {//move base to the correct location
                cube( [width, length, base], center = false);//create base
             }
             for (i = [1:width/pyramid_width]) { //for each pyramid accounting for all x and y axis
                 for ( j = [1:width/pyramid_width]) {
                     translate([pyramid_width*i, pyramid_width*j,0]){ //move it to the right place
                         rotate([0, 0, 45]) {//rotate the pyramid to face the right direction
                            cylinder(height, pyramid_width/sqrt(2), 0, $fn=4);//generate each pyramids
                         }
                     }
                 }
             }
         }
     }
 }