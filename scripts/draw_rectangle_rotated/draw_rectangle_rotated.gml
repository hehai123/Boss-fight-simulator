function draw_rectangle_rotated(x,y,a1,b1,a2,b2,rotation,outline) {
/// draw_rectangle_rotated (x,y,x1,y1,x2,y2,rotation,outline)
/// @description draw rectangle primitive rotated
/// @param x
/// @param y
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param rotation
/// @param outline
/// @returns n/a

var cx,cy,xx1,yy1,xx2,yy2,rot,sxx,sxy,syx,syy,x1,x2,x3,x4,y1,y2,y3,y4;

//Original
//cx=argument0;    // Origin position x
//cy=argument1;    // Origin position y
//xx1=argument2;    // Offset x1
//yy1=argument3;  // Offset y1
//xx2=argument4;  // Offset x2
//yy2=argument5;  // Offset y2
//rot=argument6;    // 

cx=x;    // Origin position x
cy=y;    // Origin position y
xx1=a1;    // Offset x1
yy1=b1;  // Offset y1
xx2=a2;  // Offset x2
yy2=b2;  // Offset y2
rot=rotation;    // Angle

sxx = cos(degtorad(rot));
sxy = -sin(degtorad(rot));
syx = sin(degtorad(rot));
syy = cos(degtorad(rot));

x1=cx+sxx*xx1+syx*yy1;
x2=cx+sxx*xx2+syx*yy1;
x3=cx+sxx*xx2+syx*yy2;
x4=cx+sxx*xx1+syx*yy2;

y1=cy+sxy*xx1+syy*yy1;
y2=cy+sxy*xx2+syy*yy1;
y3=cy+sxy*xx2+syy*yy2;
y4=cy+sxy*xx1+syy*yy2;

//if (arugment7)
if (outline)
{
    draw_line(x1,y1,x4,y4);
    draw_line(x2,y2,x1,y1);
    draw_line(x3,y3,x2,y2);
    draw_line(x4,y4,x3,y3);
}
else
{
    draw_triangle(x1,y1,x2,y2,x3,y3,false);
    draw_triangle(x1,y1,x3,y3,x4,y4,false);
}

}