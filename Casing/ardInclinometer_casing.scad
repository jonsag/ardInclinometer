// ardInclinometer_casing

// Casing for the ardInclinometer project
// This holds the MPU605 with it's gimbal,
// an arduino, OLED screen, buttons and battery

// what should we draw:
casing = true;
lid = false;
gy521 = false; // this is just the board itself
     
// lsy out everything for printing
print = true;

// main body
// width = X, depth = Z, height = Y
width = 100;
depth = 80;
height = 50;

wallThickness = 3;

// screen wedge
wedgeHeight = 30;

// screw posts
postDia = 10;
postHoleDia = 2.5;

postHoleDepth = 10;

postOffset = -1; // extra distance from walls to screw posts

// lid
lidThickness = 5;
lidRest = 3;

lidGap = 0.5; // gap between lid and casing

lidScrewHoleDia = 3.5;
lidScrewHeadDia = 6;
lidScrewCountersink = 3;

lidRecess = 3;

// print text on lid
textOnLid1 = "ardInclinometer";
textOnLid2 = "by Jon Sagebrand";

lidTextFont = "Liberation Sans:style=Bold Italic";
lidFontSize = 6;

// roundness
$fn=100;

// start drawing
if (casing) { // create the main body
     union() {
	  difference() {
	       union() {
		    difference() {
			 // draw the outer limits for the casing
			 cube([width, depth, height]);
			 
			 // hollow out the casing
			 translate([wallThickness, wallThickness, wallThickness])
			      cube([width - 2 * wallThickness, depth - 2 * wallThickness, height]);
			 
		    }
		    lidRests(); // make the prisms where the lid is resting
		    
		    screwPosts(); // make the screwposts where to screw down the lid// screw posts
	       }
	       screwPostHoles(); // make the holes in the screw posts
	       
	       wedgeCutOff(0); // cut off the wedge where the screen lies
	  }
     }
     difference() {
	  wedgeCutOff(0); // create the cutoff again

	  wedgeCutOff(wallThickness); // move the wedge and cut off again
     }
}

if (lid) { // create the lid
     if (print) {
	  translate ([wallThickness + lidGap, depth + 10, 0])
	       drawLid();
     } else {
	  translate ([wallThickness + lidGap, wallThickness + lidGap, height - lidThickness])
	       drawLid();
     }
}

if (gy521) {
     if (!print) {
	  translate([120, 0, 0])
	  mpu6050_gy521();
     }
}

module wedgeCutOff(offSet) { // cut off triangular shape from the main body
     rotate([0, 0, -90])
     translate([-depth - offSet, 0, 0])
	  prismFlatDown(width, wedgeHeight, wedgeHeight);
     }

module lidRests() { // create the wedge rests for the lid
     rotate([0, 0, 90])
          translate([wallThickness, -width, height - lidRest - lidThickness])
          prismFlatUp(width, lidRest, lidRest);
     
     rotate([0, 0, -90])
          translate([-depth + wallThickness, 0, height - lidRest - lidThickness])
	  prismFlatUp(width, lidRest, lidRest);
     
     rotate([0, 0, 180])
          translate([-width + wallThickness, -depth, height - lidRest - lidThickness])
	  prismFlatUp(depth, lidRest, lidRest);
     
     translate([wallThickness, 0, height - lidRest - lidThickness])
          prismFlatUp(depth, lidRest, lidRest);
}

module screwPosts() { // create the screw posts
     translate([wallThickness + postDia / 2 + postOffset, wallThickness + postDia / 2 + postOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, wallThickness + postDia / 2 + postOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, depth - wallThickness - postDia / 2 - postOffset,wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
     
     translate([wallThickness + postDia / 2 + postOffset, depth - wallThickness - postDia / 2 - postOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
}

module screwPostHoles() { // drill the holes for the lid screws
     translate([wallThickness + postDia / 2 + postOffset, wallThickness + postDia / 2 + postOffset, height - lidThickness - postHoleDepth])
	  cylinder(postHoleDepth, postHoleDia / 2, postHoleDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, wallThickness + postDia / 2 + postOffset, height - lidThickness - postHoleDepth])
	  cylinder(postHoleDepth, postHoleDia / 2, postHoleDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, depth - wallThickness - postDia / 2 - postOffset,height - lidThickness - postHoleDepth])
	  cylinder(postHoleDepth, postHoleDia / 2, postHoleDia / 2);
     
     translate([wallThickness + postDia / 2 + postOffset, depth - wallThickness - postDia / 2 - postOffset, height - lidThickness - postHoleDepth])
	  cylinder(postHoleDepth, postHoleDia / 2, postHoleDia / 2);
}

module drawLid () { // create the lid
     union() {
	  difference() {
	       // draw the lid
	       cube([width - wallThickness * 2 - lidGap * 2, depth - wallThickness * 2 - lidGap * 2, lidThickness]);
	       
	       // make screw holes
	       translate([postDia / 2 - lidGap + postOffset, postDia / 2 - lidGap + postOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       translate([width - wallThickness * 2 - postDia / 2 - lidGap - postOffset, postDia / 2 - lidGap + postOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       translate([postDia / 2 - lidGap + postOffset, depth - wallThickness * 2 - postDia / 2 - lidGap - postOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       translate([width - wallThickness * 2 - postDia / 2 - lidGap - postOffset, depth - wallThickness * 2 - postDia / 2 - lidGap - postOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       // make screw countersinks
	       translate([postDia / 2 - lidGap + postOffset, postDia / 2 - lidGap + postOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);
	       
	       translate([width - wallThickness * 2 - postDia / 2 - lidGap - postOffset, postDia / 2 - lidGap + postOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);
	       
	       translate([postDia / 2 - lidGap + postOffset, depth - wallThickness * 2 - postDia / 2 - lidGap - postOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);
	       
	       translate([width - wallThickness * 2 - postDia / 2 - lidGap - postOffset, depth - wallThickness * 2 - postDia / 2 - lidGap - postOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);

	       // make recess in lid
	       translate([postDia, postDia, lidThickness - lidRecess])
		    cube([width - wallThickness * 2 - lidGap * 2 - postDia * 2, depth - wallThickness * 2 - lidGap * 2 - postDia * 2, lidThickness]);
	  }

	  // print text in recess
	  translate([(width - wallThickness * 2 - lidGap * 2) / 2, (depth - wallThickness * 2 - lidGap * 2) / 2 * 1.25, lidThickness - lidRecess])
	       linear_extrude(height = lidRecess)
	       text(textOnLid1, font = lidTextFont, size = lidFontSize, valign = "center", halign = "center");

          translate([(width - wallThickness * 2 - lidGap * 2) / 2, (depth - wallThickness * 2 - lidGap * 2) / 2 * 0.75, lidThickness - lidRecess])
	       linear_extrude(height = lidRecess)
	       text(textOnLid2, font = lidTextFont, size = lidFontSize, valign = "center", halign = "center");
     }
}

module prismFlatDown(l, w, h) {          // l = Y, w = X, h = Z
     polyhedron(points=[
		     [0,0,h],            // 0    front top corner
		     [0,0,0], [w,0,0],   // 1, 2 front left & right bottom corners
		     [0,l,h],            // 3    back top corner
		     [0,l,0], [w,l,0]    // 4, 5 back left & right bottom corners
		     ],
		faces=[ // points for all faces must be ordered clockwise when looking in
		     [0,2,1],    // top face
		     [3,4,5],    // base face
		     [0,1,4,3],  // h face
		     [1,2,5,4],  // w face
		     [0,3,5,2],  // hypotenuse face
		     ]);
}

module prismFlatUp(l, w, h) {            // l = Y, w = X, h = Z
     polyhedron(points=[
                     [0,0,h], [w,0,h],   // 0, 1 front left & right top corners
	             [0,0,0],            // 2    front bottom corner
                     [0,l,h], [w,l,h],   // 3, 4 back left & right top corners
                     [0,l,0]             // 5    back bottom corner
                     ],
                faces=[ // points for all faces must be ordered clockwise when looking in
                     [0,2,1],    // top face
                     [3,4,5],    // base face
                     [0,1,4,3],  // h face
                     [1,2,5,4],  // w face
                     [0,3,5,2],  // hypotenuse face
                     ]);
}

module mpu6050_gy521() {
     include <misc_parts.scad>;
     
     x = 21; y = 15.6; z = 1.2;
     color([30/255, 114/255, 198/255])
	  linear_extrude(height=z) {
	  difference() {
	       square(size = [x, y]);
	       translate([3, y-3]) circle(r=1.5, center=true, $fn=24);
	       translate([x-3, y-3]) circle(r=1.5, center=true, $fn=24);
	  }
     } 
     translate([8.3, 5.6, z])
	  color([60/255, 60/255, 60/255])
	  cube(size=[4.0, 4.0, 0.9]);
     //translate([0.34, 2.54, 0]) rotate(a=180, v=[1, 0, 0]) pin_headers(8, 1);
     translate([0.34, 2.54, 0])
	  rotate(a=180, v=[1, 0, 0])
	  //pin_right_angle_low(8, 1);
	  pin_headers(8, 1);
}
