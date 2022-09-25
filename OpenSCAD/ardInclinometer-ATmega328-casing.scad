// ardInclinometer-ATmega328-casing.scad

include <./config.scad>
include <./roundedcube.scad>

module drawAll()
{
	if (showBoard && !print)
		drawBoard();

	if (showBox)
		drawBox();

	if (showButtonRods && !print)
		drawButtonRods();
}

module drawBoard()
{
	color("blue") translate([ boxX / 2 + pcbX / 2, boxY / 2 - pcbY / 2, boardZ + wallThickness ])
	rotate([ 0, 180, 0 ])
	import("../KiCad/ardInclinometer-ATmega328/ardInclinometer-ATmega328-0.1-origin.stl", convexity = 5);
}

module drawBox()
{
	translate([ 0, 0, 0 ])
	{
		difference()
		{
			union() // this is added
			{
				difference()
				{
				    roundedcube([ boxX, boxY, boxZ ], false, boxCornerRadius, "z");

				    translate([ wallThickness, wallThickness, wallThickness ])
				    roundedcube([ boxX - wallThickness * 2, boxY - wallThickness * 2, boxZ ], false, boxCornerRadius,
				                "z");

				    // LED holes
				    for (i = [-6.985 * 2:6.985:6.985 * 2])
				    {
				        translate([ boxX / 2 + i - 2.2225, boxY / 2 - 14.46, -wallThickness / 2 ])
				        // translate([ boxX / 2 + pcbX / 2, boxY / 2 - pcbY / 2, boardZ ])
				        cylinder(h = wallThickness * 2, d = ledDia, center = false, $fn = roundness);
				    }

				    // button holes
				    for (i = [-8.255 * 2:8.255:8.255 * 2])
				    {
				        translate([ boxX / 2 - 28.2575, boxY / 2 + i, -wallThickness / 2 ])
				        cylinder(h = wallThickness * 2, d = buttonRodDia + 0.5, center = false, $fn = roundness);
				    }
				}

				// pcb screw posts
				for (i = [3.81:pcbX - 3.81 * 2:pcbX - 3.81])
				{
					for (j = [3.81:pcbY - 3.81 * 2:pcbY - 3.81])
					{
						translate(
						    [ i + boxX / 2 - pcbX / 2, j + boxY / 2 - pcbY / 2, pcbPostZ / 2 - wallThickness / 2 ])
						difference()
						{
							cylinder(h = pcbPostZ - wallThickness, d = pcbPostDia, center = true, $fn = roundness);
							translate([ 0, 0, wallThickness ])
							color("red") cylinder(h = pcbPostZ, d = pcbPostHoleDia, center = true, $fn = roundness);
						}
					}
				}

				// lid screw posts
				for (i = [lidPostDia / 2 +
				         lidPostInset:boxX - lidPostDia - lidPostInset * 2:boxX - lidPostDia / 2 - lidPostInset])
				{
					for (j = [lidPostDia / 2 +
					         lidPostInset:boxY - lidPostDia - lidPostInset * 2:boxY - lidPostDia / 2 - lidPostInset])
					{
						translate([ i, j, boxZ / 2 - wallThickness / 2 ])
						difference()
						{
							cylinder(h = boxZ - wallThickness, d = lidPostDia, center = true, $fn = roundness);
							translate([ 0, 0, wallThickness ])
							color("red")
							    cylinder(h = boxZ - wallThickness, d = lidPostHoleDia, center = true, $fn = roundness);
						}
					}
				}

				// LED tunnels
				for (i = [-6.985 * 2:6.985:6.985 * 2])
				{
					translate([ boxX / 2 + i - 2.2225, boxY / 2 - 14.46, 0 ])
					difference()
					{
						cylinder(h = ledTunnelZ, d = ledDia + 2.5, center = false, $fn = roundness);
						translate([ 0, 0, -wallThickness / 2])
						cylinder(h = ledTunnelZ + wallThickness, d = ledDia + 0.5, center = false, $fn = roundness);
					}
				}

				// button guides
				for (i = [-8.255 * 2:8.255:8.255 * 2])
				{
					translate([ boxX / 2 - 28.2575, boxY / 2 + i, 0])
					difference()
					{
						cylinder(h = buttonGuideZ, d = buttonRodDia + wallThickness * 4, center = false, $fn = roundness);
						translate([ 0, 0, -wallThickness / 2 ])
						cylinder(h = ledTunnelZ + wallThickness, d = buttonRodDia + 0.5, center = false, $fn = roundness);
					}
				}
			}

			// this will be deleted

			// display hole
			color("red") translate([
				boxX / 2 - displayX / 2 + displayXoffset, boxY / 2 - displayY / 2 + displayYoffset, -wallThickness / 2
			])
			cube(size = [ displayX, displayY, wallThickness * 2 ], center = false);
		}
	}
}

module drawButtonRods()
{
	for (i = [-8.255 * 2:8.255:8.255 * 2])
	{
		color("black") translate([ boxX / 2 - 28.2575, boxY / 2 + i, -wallThickness / 2 ])
		union()
		{
			cylinder(h = buttonGuideZ + wallThickness + 1, d = buttonRodDia - 0.5);
			translate([ 0, 0, buttonGuideZ + wallThickness / 2 ])
			cylinder(h = wallThickness, d = buttonRodDia + wallThickness * 2);
		}
	}
}

//if ($preview)
	drawAll();
