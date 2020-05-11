// 5/16"-18 nut prototype
// outer radius is arbitrary

// outer diameter
Dmaj=7.93+0.8;
// inner diameter
Dmin=6.17+0.8;
// pitch
P=1.411;
// arc resolution
step=72;
// number of thread revolutions
revs=5;

// thread height
H=(Dmaj-Dmin)/2;
// thread angle
I=atan(P/(3.14159*Dmaj));
// wedge width
W=3.14159*Dmaj/step;

difference() {
    cylinder(r=Dmaj*0.8, (revs)*P, $fn=6);
    translate([0,0,-P])
    union() {
        cylinder(r=Dmin/2, (revs+2)*P, $fn=64);
        for(i=[0:step]) {
            translate([0, 0, P*i/step])
            rotate([360/step*i, -90, 0])
            translate([0, Dmin*0.49, 0])
            for(i=[0:revs+1]) {
                translate([i*P, 0,0]) 
                rotate([0, I, 0])
                linear_extrude(W, center=true)
                polygon([
                    [0.0, 0.0],
                    [0.250*P, 0.0],
                    [(0.250+0.3125)*P, H],
                    [(0.250+0.3125+0.125)*P, H],
                    [(0.250+0.3125+0.125+0.3125)*P, 0],
                ]);
            }
        }
    }    
}