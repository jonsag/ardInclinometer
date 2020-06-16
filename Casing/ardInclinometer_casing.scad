// ardInclinometer_casing

// Casing for the ardInclinometer project
// This holds the MPU605 with it's gimbal,
// an arduino, OLED screen, buttons and battery

// what should we draw:
casing = true;
lid = true;

// lsy out everything for printing
print = true;

// main body
// width = X, depth = Z, height = Y
width = 100;
depth = 50;
height = 30;

wallThickness = 3;

// screw posts
postDia = 10;
postHoleDia = 2.5;
postOffset = -1; // extra distance from walls to screw posts

// lid
lidThickness = 5;
lidRest = 3;

lidGap = 0.5; // gap between lid and casing

lidScrewHoleDia = 3.5;
lidScrewHeadDia = 6;
lidScrewCountersink = 3;

// roundness
$fn=100;

// start drawing
if (casing) {
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
	  screwPostHoles();
     }
}

if (lid) {
     if (print) {
	  translate ([wallThickness + lidGap, depth + 10, 0])
	       drawLid();
     } else {
	  translate ([wallThickness + lidGap, wallThickness + lidGap, height - lidThickness])
	       drawLid();
     }
}

module lidRests() {
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

module screwPosts() {
     translate([wallThickness + postDia / 2 + postOffset, wallThickness + postDia / 2 + postOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, wallThickness + postDia / 2 + postOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, depth - wallThickness - postDia / 2 - postOffset,wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
     
     translate([wallThickness + postDia / 2 + postOffset, depth - wallThickness - postDia / 2 - postOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
}

module screwPostHoles() { 
     translate([wallThickness + postDia / 2 + postOffset, wallThickness + postDia / 2 + postOffset, wallThickness])
	  cylinder(height, postHoleDia / 2, postHoleDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, wallThickness + postDia / 2 + postOffset, wallThickness])
	  cylinder(height, postHoleDia / 2, postHoleDia / 2);
     
     translate([width - wallThickness - postDia / 2 - postOffset, depth - wallThickness - postDia / 2 - postOffset,wallThickness])
	  cylinder(height, postHoleDia / 2, postHoleDia / 2);
     
     translate([wallThickness + postDia / 2 + postOffset, depth - wallThickness - postDia / 2 - postOffset, wallThickness])
	  cylinder(height, postHoleDia / 2, postHoleDia / 2);
}

module drawLid () {
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
