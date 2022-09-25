// config.scad, configuration for ardInclinometer-ATmega328-casing.scad

print = true;

showBoard = true;

showBox = true;
showButtonRods = true;

// PCB size in mm
pcbX = 66.675;
pcbY = 55.580;
pcbZ = 1.6;

pcbZadj = 0;
boardZ = 13.8 + pcbZadj;

displayX = 25.400;
displayY = 19.050;

displayXoffset = -3.165 / 2;
displayYoffset = 12.420 / 2;

ledDia = 5.5;

buttonRodDia = 5;

buttonGuideZ = 9.2 + pcbZadj;

ledTunnelZ = 12 + pcbZadj;

// outer shell
wallThickness = 1;

boxCornerRadius = 5;

// screw posts
lidPostDia = boxCornerRadius * 2;
lidPostHoleDia = 5;
lidPostInset = 1;

pcbPostZ = 15.75 + pcbZadj;
pcbPostDia = 7.5;
pcbPostHoleDia= 5;

// casing measurements
extraSpace = 1;

largerX = true; // if false, box is larger in Y

boxX = largerX ? pcbX + extraSpace * 2 + lidPostDia * 2 + lidPostInset * 2 : pcbX + wallThickness * 2 + extraSpace * 2;
boxY = !largerX ? pcbY + extraSpace * 2 + lidPostDia * 2 + lidPostInset * 2 : pcbY + wallThickness * 2 + extraSpace * 2;
boxZ = 35;

roundness = 100;
