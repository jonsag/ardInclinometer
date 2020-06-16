// ardInclinometer_casing

// Casing for the ardInclinometer project
// This holds the MPU605 with it's gimbal,
// an arduino, OLED screen, buttons and battery

// what should we draw:
casing = true;

// main body
// width = X, depth = Z, height = Y
width = 100;
depth = 50;
height = 30;

wallThickness = 3;

// lid
lidThickness = 3;
lidRest = 3;

// screw posts
postDia = 6;
postHoleDia = 2.5;

// start drawing
if (casing) {
     union() {
	  difference() {
	       // draw the outer limits for the casing
	       cube([width, depth, height]);

	       // hollow out the casing
	       translate([wallThickness, wallThickness, wallThickness])
		    cube([width - 2 * wallThickness, depth - 2 * wallThickness, height]);
	  }
     }

     // lid rests
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

     // screw posts
     union() {
	  translate([wallThickness + postDia / 2, wallThickness + postDia / 2, wallThickness])
	  difference() {
	       cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
	       cylinder(height, postHoleDia / 2, postHoleDia / 2);
	  }
     }

     union() {
          translate([width - wallThickness - postDia / 2, wallThickness + postDia / 2, wallThickness])
          difference() {
               cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
               cylinder(height, postHoleDia / 2, postHoleDia / 2);
          }
     }

     union() {
          translate([width - wallThickness - postDia / 2, depth - wallThickness - postDia / 2,wallThickness])
          difference() {
               cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
               cylinder(height, postHoleDia / 2, postHoleDia / 2);
          }
     }
     
     union() {
          translate([wallThickness + postDia / 2, depth - wallThickness - postDia / 2, wallThickness])
          difference() {
               cylinder(height - wallThickness - lidThickness, postDia / 2, postDia / 2);
               cylinder(height, postHoleDia / 2, postHoleDia / 2);
          }
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
