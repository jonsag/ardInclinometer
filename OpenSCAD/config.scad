// config.scad, configuration for ardInclinometer-ATmega328-casing.scad

print = true;

showBoard = true;

showBox = true;
showButtonRods = false;
showLid = false;

// PCB size in mm
pcbX = 66.675;
pcbY = 55.580;
pcbZ = 1.6;

pcbZadj = 0;
boardZ = 13.8 + pcbZadj;

displayX = 25.400;
displayY = 10.050;

displayXoffset = -3.165 / 2;
displayYoffset = 12.420 / 2;

ledDia = 5.5;

buttonRodDia = 5;
buttonRodStickOut = 0;
buttonGuideZ = 9.2 + pcbZadj;

ledTunnelZ = 12 + pcbZadj;

// outer shell
wallThickness = 1;

boxCornerRadius = 5;

// lid
lidClearance = 0.5;
lidScrewHoleDia = 3.5;
lidScrewHeadDia = 5;

textFont = "Liberation Sans:style=Bold";
textSize1 = 5;
textSize2 = 2.5;
textSize3 = 5;
textSize4 = 3;

text1 = "ardInclinometer";
text2 = "github.com/jonsag/ardInclinometer";

// screw posts
lidPostDia = boxCornerRadius * 2;
lidPostHoleDia = 5;
lidPostInset = 1;

pcbPostZ = 15.75 + pcbZadj;
pcbPostDia = 7.5;
pcbPostHoleDia = 5;

// casing measurements
extraSpace = 1;

boxX = pcbX + wallThickness * 2 + extraSpace * 2;
boxY = pcbY + wallThickness * 2 + extraSpace * 2;
boxZ = 35;

lidPostZ = boxZ - pcbPostZ - pcbZ;

roundness = 100;
