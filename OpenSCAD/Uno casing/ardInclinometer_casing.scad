
// ardInclinometer_casing

// Casing for the ardInclinometer project
// This holds the MPU605 with it's gimbal,
// an arduino, OLED

// what should we draw:
casing = true;
lid = false;

mount1 = true;
mount2 = true;

disableAdjustmentHoles = false;

// lay out everything for printing
print = false;

// main body
// width = X, depth = Z, height = Y
width = 120;
depth = 110;
height = 45;

wallThickness = 3;

// oversize factor
overSizeFactor = 1.1; // useful for when making holes, larger than 1

// battery compartment
batteryHeight = 55;
batteryWidth = 20;

// screen wedge
wedgeHeight = 30;

// push buttons
include <push_button.scad>

pushButtonHoleDia = 7;

pushButtonDist = 15;

buttonsXPlaceFactor = 0.295; // a value between 0 and 1

// power switch
include <power_switch.scad>

// LEDs
include <led.scad>

ledDia = 5;

ledDist = 7; // distance between the leds

ledsXPlaceFactor = 0.475;

// screen cut out and screw posts
screenPostHoriDist = 20;
screenPostVertDist = 22;

screenPostDia = 4;
screenPostHeight = 3;

screenPostHoleDia = 2.5;
screenPostHoleDepth = 3;

screenWidth = 23;
screenHeight = 11.5;
screenOffset = 2.25;

screenCoverOverSize = 1;
screenCoverRecess = 2;

screenXPlaceFactor = 0.75; // a value between 0 and 1
     
// lid screw posts
lidPostDia = 10;
lidPostHoleDia = 2.5;

lidPostHoleDepth = 10;

lidPostOffset = -1; // extra distance from walls to screw posts

// lid
lidThickness = 5;
lidRest = 3;

lidGap = 0.5; // gap between lid and casing

lidScrewHoleDia = 3.5;
lidScrewHeadDia = 6;
lidScrewCountersink = 3;

lidRecess = 2;

// print text on lid
textOnLid1 = "ardInclinometer";
textOnLid2 = "by Jon Sagebrand";

lidTextFont = "Liberation Sans:style=Bold Italic";
lidFontSize = 6;

// mpu6050
include <mpu_mount.scad>;

adjustmentHoleDia = 3;

// pcb mount
pcbLength = 81.28;
pcbWidth = 45.085;

pcbMountEdgeDist = 3.175;

pcbMountPostHeight = 10;
pcbMountPostDia = 6;

pcbMountScrewDia = 3;

// power switch

//mpu6050_mount();
if (!print) {
     translate([mount1Width / 2 + wallThickness + lidPostDia + lidPostOffset, -(-swivelWidth - mount1Height) * 2 + wallThickness * 1.5 + lidPostDia + lidPostOffset, mount3Depth / 2 + mount3ExtraDepth + wallThickness])
	  rotate([-90, 0, 0])
	  union() {
	  if (mount1) {
	       mount1();
	  }
	  if (mount2) {
	       translate([0, 0, -swivelWidth - mount1Height])
		    mount2();
	  }
	  if (!print) {
	       translate([-10.5, -7.8, mount1Height / 2 - 1.2])
		    mpu6050_gy521();
	  }
     }
} else {
     if (mount1) {
	  translate([width + mount1Width / 2 + 2, mount1Depth / 2, mount1Height / 2 + swivelWidth])
	       mount1();
     }
     if (mount2) {
	  translate([width + mount2Width/ 2 + 2, mount1Depth / 2 + mount2Depth + 2, mount2Height / 2 + swivelWidth])
	       mount2();
     }
}

// roundness
$fn=100;

// start drawing
if (casing) { // create the main body
     union() { // union of drilled main body, screen wedge with cut out and screen screw posts
	  difference() { // drill lid posts screw holes and cut off wedge for screen mount
	       union() { // union of main body, lid rests and screw posts
		    difference() {
			 cube([width, depth, height]); // create the main body
			 
			 // hollow out the casing
			 translate([wallThickness, wallThickness, wallThickness])
			      cube([width - 2 * wallThickness, depth - 2 * wallThickness, height]);			      
		    }
		    lidRests(); // add the prisms where the lid is resting
		    
		    screwPosts(); // add the screwposts where to screw down the lid

		    powerSwitchMount();
	       }
	       screwPostHoles(); // drill the holes in the screw posts
	       
	       wedgeCutOff(0); // cut off the wedge where the screen lies

	       powerSwitchHoles();
	  }
	  
	  difference() {
	       wedgeCutOff(0); // create the cutoff again, this time it's solid
	       
	       wedgeCutOff(wallThickness * sqrt(2)); // move the wedge and cut off again
	       
	       screenCutOut(); // cut out for the screen and screen cover

	       pushButtonHoles(); // drill the holes for the pushbutton

	       ledHoles();
	       
	       if (!disableAdjustmentHoles) {
		    adjustmentHoles(); // drill the holes where to insert an adjustment tool
	       }
	  }
	  pushButtons();

	  leds();
	  
	  screenPosts(); // add screw posts for the screen

	  add_mount3(); // add mount for the mpu

	  batteryCompartment(); // add battercompartment

	  pcbMount(); // add PCB mount posts
     }
}

if (lid) { // create the lid
     if (print) {
	  translate ([wallThickness + lidGap, depth + 2, 0])
	       drawLid();
     } else {
	  translate ([wallThickness + lidGap, wallThickness + lidGap, height - lidThickness])
	       drawLid();
     }
}

if (!print) {
     translate([width * screenXPlaceFactor, depth - wedgeHeight / 2 - 1, wedgeHeight / 2 + 3]) // this placement is just an estimation, not critical
	  rotate([-45, 180, 0])
	  translate([-12.5, -13.5, -1.6])
	  GM009605v4();
}

module pcbMount() {
     translate([width - wallThickness - pcbLength / 2 - 3, depth - wedgeHeight - pcbWidth / 2, wallThickness + pcbMountPostHeight / 2])
	  union() {
     if (!print) { // PCB
	  translate([0, 0, pcbMountPostHeight / 2 + 0.6])
	       difference() {
	       color([30/255, 114/255, 198/255])
		    cube([pcbLength, pcbWidth, 1.2], center = true);

	       translate([-pcbLength / 2 + pcbMountEdgeDist, -pcbWidth / 2 + pcbMountEdgeDist, 0])
		    cylinder(1.2, (pcbMountScrewDia + 0.5) / 2, (pcbMountScrewDia + 0.5) / 2, center = true);

	       translate([pcbLength / 2 - pcbMountEdgeDist, -pcbWidth / 2 + pcbMountEdgeDist, 0])
                    cylinder(1.2, (pcbMountScrewDia + 0.5) / 2, (pcbMountScrewDia + 0.5) / 2, center = true);

	       translate([pcbLength / 2 - pcbMountEdgeDist, pcbWidth / 2 - pcbMountEdgeDist, 0])
                    cylinder(1.2, (pcbMountScrewDia + 0.5) / 2, (pcbMountScrewDia + 0.5) / 2, center = true);
	       }
     }

     difference() {
	  union() { // pcb mount posts
	       translate([-pcbLength / 2 + pcbMountEdgeDist, -pcbWidth / 2 + pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, pcbMountPostDia / 2, pcbMountPostDia / 2, center = true);
	       
               translate([pcbLength / 2 - pcbMountEdgeDist, -pcbWidth / 2 + pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, pcbMountPostDia / 2, pcbMountPostDia / 2, center = true);
	       
               translate([pcbLength / 2 - pcbMountEdgeDist, pcbWidth / 2 - pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, pcbMountPostDia / 2, pcbMountPostDia / 2, center = true);

	       translate([-pcbLength / 2 + pcbMountEdgeDist, pcbWidth / 2 - pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, pcbMountPostDia / 2, pcbMountPostDia / 2, center = true);
	  }
	  union() { // pcb mount posts drill holes                                                         
               translate([-pcbLength / 2 + pcbMountEdgeDist, -pcbWidth / 2 + pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, (pcbMountScrewDia - 0.5) / 2, (pcbMountScrewDia - 0.5) / 2, center = true);

               translate([pcbLength / 2 - pcbMountEdgeDist, -pcbWidth / 2 + pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, (pcbMountScrewDia - 0.5) / 2, (pcbMountScrewDia - 0.5) / 2, center = true);

               translate([pcbLength / 2 - pcbMountEdgeDist, pcbWidth / 2 - pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, (pcbMountScrewDia - 0.5) / 2, (pcbMountScrewDia - 0.5) / 2, center = true);

               translate([-pcbLength / 2 + pcbMountEdgeDist, pcbWidth / 2 - pcbMountEdgeDist, 0])
                    cylinder(pcbMountPostHeight, (pcbMountScrewDia - 0.5) / 2, (pcbMountScrewDia - 0.5) / 2, center = true);
          }

     }
     }
     
}

module wedgeCutOff(offSet) { // cut off triangular shape from the main body
     rotate([0, 0, -90])
     translate([-depth - offSet, 0, 0])
	  prismFlatDown(width, wedgeHeight, wedgeHeight);
     }

module screenCutOut() {
     translate([width * screenXPlaceFactor, depth - wedgeHeight / 2 + wallThickness / 2 * sqrt(2) , wedgeHeight / 2])
     rotate([45, 0, 0])
	  translate([0, screenOffset, 0])
	  union() {
	  cube([screenWidth, screenHeight, wallThickness * overSizeFactor], center = true);
	  
	  translate([0, 0, (wallThickness - screenCoverRecess) / 2])
	       cube([screenWidth + screenCoverOverSize, screenHeight + screenCoverOverSize, screenCoverRecess], center = true);
     }
}

module pushButtonHoles() {
     translate([width * buttonsXPlaceFactor, depth - wedgeHeight / 2, wedgeHeight / 2])
          rotate([45, 0, 0])
          union() {
          for ( i = [-pushButtonDist : pushButtonDist : pushButtonDist] ){ // make the three button holes for X, Y and Z zero
               translate([i, pushButtonDist / 2, -wallThickness / 2])
                    cylinder(wallThickness * overSizeFactor, pushButtonHoleDia / 2, pushButtonHoleDia / 2, center = true);
          }
	  
          for ( i = [-pushButtonDist: pushButtonDist : 0] ){ // make the two button holes for all zero and ... 
               translate([i, -pushButtonDist / 2, -wallThickness / 2])
                    cylinder(wallThickness * overSizeFactor, pushButtonHoleDia / 2, pushButtonHoleDia / 2, center = true);
          }
     }
}

module pushButtons() {
     if (!print) {
	  translate([width * buttonsXPlaceFactor, depth - wedgeHeight / 2, wedgeHeight / 2])
	       rotate([45, 0, 0])
	       union() {
	       for ( i = [-pushButtonDist : pushButtonDist : pushButtonDist] ){ // make the three buttons for X, Y and Z zero
		    translate([i, pushButtonDist / 2, 0])
			 rotate([180, 0, 0])
			 pushButton(wallThickness);
	       }
	       
	       for ( i = [-pushButtonDist: pushButtonDist : 0] ){ // make the two buttons for all zero and ...
		    translate([i, -pushButtonDist / 2, 0])
			 rotate([180, 0, 0])
			 pushButton(wallThickness);
	       }
	  }
     }
}

module ledHoles() {
     translate([width * ledsXPlaceFactor, depth - wedgeHeight / 2, wedgeHeight / 2])
          rotate([45, 0, 0])
          union() {
          for ( i = [-ledDist * 2: ledDist : ledDist * 2] ){ // make the five LED holes
               translate([i, 0, -wallThickness / 2])
                    cylinder(wallThickness * overSizeFactor, (ledDia + 0.2) / 2, (ledDia + 0.2) / 2, center = true);
          }
     }
}

module leds() {
     if (!print) {
	  translate([width * ledsXPlaceFactor, depth - wedgeHeight / 2, wedgeHeight / 2])
	       rotate([45, 0, 0])
	       union() {
	    for ( i = [-ledDist * 2: ledDist : ledDist * 2] ) { // insert LEDs into holes
	      /*
		if (i == -ledDist * 2) {
		_color = "Red";
		echo("Red LED: ", _color);
	      } else if (i == ledDist * 2) {
		color = "Red";
		echo("Red LED: ", _color);
	      } else if (i == -ledDist) {
		_color = "Yellow";
		echo("Yellow LED: ", _color);
	      } else if (i == ledDist) {
		_color = "Yellow";
		echo("Yellow LED: ", _color);
	      } else {
		_color = "Green";
		echo("Green LED: ", _color);
	      }
	      
	      echo("Led dist: ", ledDist);
	      echo("i: ", i);
	      echo("Color: ", _color);
	      
	      echo("Drawing LED: ", _color);
	      */		
		
		 translate([i, 0, wallThickness / 2])
		   rotate([180, 0, 0])
		   if ((i == -ledDist * 2) || (i == ledDist * 2)) {
		     led(ledDia, "red");
		   } else if ((i == -ledDist) || (i == ledDist)) {
		     led(ledDia, "yellow");
		   } else {
		     led(ledDia, "green");
		   }

	       }
	  }
     }
}

module powerSwitchMount() {
     translate([(6 + wallThickness) / 2, depth - wedgeHeight - (20 + wallThickness * 2) / 2, (6 + wallThickness * 2) / 2 + wallThickness])

	  union() {
//	  print = true;
	  if (!print) {
	       translate([(5 + wallThickness) / 2 - wallThickness - 0.5, 0, 0])
		    rotate([-90, 0, 90])
		    powerSwitch(20, 10.5, 7, 15, 2, 6, 3, 3, 5, 0.5, 5, 1.5, 0.5, 3, 2.54);
	       // powerSwitch(totalWidth, holeWidth, holeDepth, screwHoleWidth, screwHoleDia, knobHoleWidth, knobDepth, knobWidth, knobHeight, mountPlateHeight, bodyHeight, legWidth, legDepth, legLength, legSpacing) {
	  }
	  
	  translate([0, 0, 0])
	       cube([6 + wallThickness, 20 + wallThickness * 2, 6 + wallThickness * 2], center = true);
	  
     }
}


module powerSwitchHoles() {
     translate([(6 + wallThickness) / 2, depth - wedgeHeight - (20 + wallThickness * 2) / 2, (6 + wallThickness * 2) / 2 + wallThickness])
	  union() {
	  translate([-(6 + wallThickness) / 2 + 3, 0, 0])
	       cube([6 * overSize, 20, 6], center = true);
	  
	  translate([(6 + wallThickness) / 2 - wallThickness / 2, 0, 0]) // knob cut out
	       cube([wallThickness * overSize, 11, 6], center = true);

	  translate([(6 + wallThickness) / 2 - wallThickness / 2, 15 / 2, 0]) // screw holes
	       rotate([0, 90, 0])
	       cylinder(wallThickness * overSize, 1, 1, center = true);

	  translate([(6 + wallThickness) / 2 - wallThickness / 2, -15 / 2, 0]) // screw holes
	       rotate([0, 90, 0])
	       cylinder(wallThickness * overSize, 1, 1, center = true);

     }
}



module screenPosts() {
     translate([width * screenXPlaceFactor, depth - wedgeHeight / 2 + wallThickness / 2 * sqrt(2), wedgeHeight / 2])
	  rotate([45, 0, 0])
	  translate([-screenPostHoriDist / 2, -screenPostVertDist / 2, -screenPostHeight / 2 + wallThickness])
	  difference() {
          union() {
               cylinder(screenPostHeight, screenPostDia / 2, screenPostDia / 2);
	       
	       translate([screenPostHoriDist, 0, 0])
                    cylinder(screenPostHeight, screenPostDia / 2, screenPostDia / 2);
	       
               translate([screenPostHoriDist, screenPostVertDist, 0])
                    cylinder(screenPostHeight, screenPostDia / 2, screenPostDia / 2);
	       
               translate([0, screenPostVertDist, 0])
                    cylinder(screenPostHeight, screenPostDia / 2, screenPostDia / 2);
          }

	  translate([0, 0, screenPostHeight - screenPostHoleDepth])
	  union() {
	       cylinder(screenPostHoleDepth, screenPostHoleDia / 2, screenPostHoleDia / 2);
	       
	       translate([screenPostHoriDist, 0, 0])
		    cylinder(screenPostHoleDepth, screenPostHoleDia / 2, screenPostHoleDia / 2);
	       
	       translate([screenPostHoriDist, screenPostVertDist, 0])
		    cylinder(screenPostHoleDepth, screenPostHoleDia / 2, screenPostHoleDia / 2);
	       
	       translate([0, screenPostVertDist, 0])
		    cylinder(screenPostHoleDepth, screenPostHoleDia / 2, screenPostHoleDia / 2);
	  }
     }    
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
     translate([wallThickness + lidPostDia / 2 + lidPostOffset, wallThickness + lidPostDia / 2 + lidPostOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, lidPostDia / 2, lidPostDia / 2);
     
     translate([width - wallThickness - lidPostDia / 2 - lidPostOffset, wallThickness + lidPostDia / 2 + lidPostOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, lidPostDia / 2, lidPostDia / 2);
     
     translate([width - wallThickness - lidPostDia / 2 - lidPostOffset, depth - wallThickness - lidPostDia / 2 - lidPostOffset,wallThickness])
	  cylinder(height - wallThickness - lidThickness, lidPostDia / 2, lidPostDia / 2);
     
     translate([wallThickness + lidPostDia / 2 + lidPostOffset, depth - wallThickness - lidPostDia / 2 - lidPostOffset, wallThickness])
	  cylinder(height - wallThickness - lidThickness, lidPostDia / 2, lidPostDia / 2);
}

module screwPostHoles() { // drill the holes for the lid screws
     translate([wallThickness + lidPostDia / 2 + lidPostOffset, wallThickness + lidPostDia / 2 + lidPostOffset, height - lidThickness - lidPostHoleDepth])
	  cylinder(lidPostHoleDepth, lidPostHoleDia / 2, lidPostHoleDia / 2);
     
     translate([width - wallThickness - lidPostDia / 2 - lidPostOffset, wallThickness + lidPostDia / 2 + lidPostOffset, height - lidThickness - lidPostHoleDepth])
	  cylinder(lidPostHoleDepth, lidPostHoleDia / 2, lidPostHoleDia / 2);
     
     translate([width - wallThickness - lidPostDia / 2 - lidPostOffset, depth - wallThickness - lidPostDia / 2 - lidPostOffset,height - lidThickness - lidPostHoleDepth])
	  cylinder(lidPostHoleDepth, lidPostHoleDia / 2, lidPostHoleDia / 2);
     
     translate([wallThickness + lidPostDia / 2 + lidPostOffset, depth - wallThickness - lidPostDia / 2 - lidPostOffset, height - lidThickness - lidPostHoleDepth])
	  cylinder(lidPostHoleDepth, lidPostHoleDia / 2, lidPostHoleDia / 2);
}

module drawLid () { // create the lid
     union() {
	  difference() {
	       // draw the lid
	       cube([width - wallThickness * 2 - lidGap * 2, depth - wallThickness * 2 - lidGap * 2, lidThickness]);
	       
	       // make screw holes
	       translate([lidPostDia / 2 - lidGap + lidPostOffset, lidPostDia / 2 - lidGap + lidPostOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       translate([width - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, lidPostDia / 2 - lidGap + lidPostOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       translate([lidPostDia / 2 - lidGap + lidPostOffset, depth - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       translate([width - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, depth - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, 0])
		    cylinder(lidThickness, lidScrewHoleDia / 2, lidScrewHoleDia / 2);
	       
	       // make screw countersinks
	       translate([lidPostDia / 2 - lidGap + lidPostOffset, lidPostDia / 2 - lidGap + lidPostOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);
	       
	       translate([width - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, lidPostDia / 2 - lidGap + lidPostOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);
	       
	       translate([lidPostDia / 2 - lidGap + lidPostOffset, depth - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);
	       
	       translate([width - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, depth - wallThickness * 2 - lidPostDia / 2 - lidGap - lidPostOffset, lidScrewCountersink])
		    cylinder(lidThickness - lidScrewCountersink, lidScrewHeadDia / 2, lidScrewHeadDia / 2);

	       // make recess in lid
	       translate([lidPostDia, lidPostDia, lidThickness - lidRecess])
		    cube([width - wallThickness * 2 - lidGap * 2 - lidPostDia * 2, depth - wallThickness * 2 - lidGap * 2 - lidPostDia * 2, lidThickness]);
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

module add_mount3() {
     union() {
	  translate([mount1Width / 2 + wallThickness + lidPostDia + lidPostOffset, -(-swivelWidth - mount1Height) * 2 + wallThickness * 1.5 + lidPostDia + lidPostOffset, mount3Depth / 2 + mount3ExtraDepth + wallThickness])
	       rotate([-90, 0, 0])
	       translate([0, 0, (-swivelWidth - mount1Height) * 2])
	       mount3();
	  
	  translate([wallThickness + lidPostDia + lidPostOffset, 0, 0]) // supports
	       cube([3, wallThickness + lidPostDia + lidPostOffset, mount3Depth + mount3ExtraDepth + wallThickness]);
	  translate([wallThickness + lidPostDia + lidPostOffset + mount3Width - 3, 0, 0])
	       cube([3, wallThickness + lidPostDia + lidPostOffset, mount3Depth + mount3ExtraDepth + wallThickness]);
	  
     }
}

module adjustmentHoles() {
     translate([mount1Width - springHoleDia / 2 - adjScrewEdgeDist + wallThickness + lidPostDia + lidPostOffset, depth - wedgeHeight / 2, wallThickness + mount3ExtraDepth + mount3Depth / 2]) // X adjust
	  rotate([90, 0, 0])
	  cylinder(wedgeHeight, adjustmentHoleDia / 2, adjustmentHoleDia / 2, center = true);

     translate([mount1Width / 2 + wallThickness + lidPostDia + lidPostOffset, depth - wedgeHeight / 2, wallThickness + springHoleDia / 2 + adjScrewEdgeDist]) // X adjust
          rotate([90, 0, 0])
          cylinder(wedgeHeight, adjustmentHoleDia / 2, adjustmentHoleDia / 2, center = true);
}

module batteryCompartment() {
     //translate([width - batteryHeight - wallThickness * 2, lidPostDia + lidPostOffset + wallThickness, 0])
     translate([width - batteryHeight - wallThickness * 2 - lidPostDia + lidPostOffset, lidRest, 0])
	  difference() {
	  cube([batteryHeight + wallThickness * 2, batteryWidth + wallThickness * 2, height - lidThickness]);
	  
	  translate([wallThickness, wallThickness, wallThickness]) // hollow out the compartment
	       cube([batteryHeight, batteryWidth, height - lidRecess - wallThickness]);
	  
	  translate([wallThickness, batteryWidth + wallThickness, height - lidThickness - 3]) // make a cutout for wires
	       cube([3, wallThickness, 3]);

	  translate([0, (batteryWidth + wallThickness * 2) / 2 + 2, height - lidThickness - height + 32]) // male a cutout for swivel screw
	       rotate([0, 90, 0])
              cylinder(wallThickness, 3, 3);
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

module GM009605v4() {
     include <misc_parts.scad>;

     x = 25; y = 27; z = 1.2; // pcb
     color([30/255, 114/255, 198/255])
          linear_extrude(height=z) {
          difference() {
	       square(size = [x, y]);
	       translate([2.5, 2.5])
	            circle(r=1.5, $fn=24);
	       translate([x-2.5, 2.5])
	            circle(r=1.5, $fn=24);
	       translate([2.5, y-2.5])
		    circle(r=1.5, $fn=24);
	       translate([x-2.5, y-2.5])
		    circle(r=1.5, $fn=24);
          }
     }

     gx=25; gy=16.5; gz=2;
     sx=23; sy=9.5; sz=2;

     color("gray")
     difference() {
	  translate([x/2-gx/2, y/2-gy/2, z])
	       cube(size=[gx, gy, gz]);
	  
	  translate([x/2-gx/2+(gx-sx)/2, y-6.5-sy, z])
	       cube(size=[sx, sy, sz]);
     }

     translate([x/2-gx/2+(gx-sx)/2, y-6.5-sy, z])
          color("black")
          cube(size=[sx, sy, gz]);
	  
     translate([x/2-2.54*2, y-1.5, 0]) // headers
          rotate(a=180, v=[1, 0, 0])
          pin_headers(4, 1);
}
