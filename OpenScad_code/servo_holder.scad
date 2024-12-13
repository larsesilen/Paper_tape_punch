// Different parts for a paper tape punch designed in OpenScad. 
// Name: Servo_holder.scad
// Lars Silen 2024
// This is free software. Feel fre to use or modify. 
// 
// Different parts are written as modules that are called by
// uncommenting the part to be viewed or printed. 
// The different block_xxx() modules print servo towers of different
// heights. For the present version only block_four() and block_five()
// are needed to hold. The module riser() lifts the servo tower to a 
// suitable height over the punch block. The module fix220() is used to
// fix the mains supply cable to the building plate. 
// The saw_support() parts are used when the punch head is drilled to
// unsure we aren't breaking the glue bonds between the punch body and the
// brass inlays. Check which one gives the best support for drilling. The
// support is removed after the punch holes are drilled. 
// The sharpener() is a tool that can be attached to a dremel type drill. 
// The when a round ca. 3 mm diameter diamond file is attached to the Dremel
// it is faily easy to create a reasonable cutting end on the drill to be used
// as a punch. 
// The paper_movement() part helds the wheel pressing the paper tape towards
// the paper movement cylinder. There are several holes for an axle allowing
// longitudinal adjustments. The movement_base() connects to the plywood base
// and holds the paper movement:part(). 
// The block_riser3() increases the height of the servo towers over the 
// punch block. These parts can be glued using super glue to the bottom off
// the servo towers providing extra fastenings. 
// 
//block_one();
//block_two();
//block_three();
//block_four();
//block_five();
//block_nine();
//translate([-(60-34.5)/2,0,0])fastening();
//riser();
//fix_220();
//saw_support();
//punch_holder();
//sharpener();
//paper_movement();
//translate([0,-70,0])movement_base();
//block_riser_3();

module servo_holder(height){
  difference(){
    cube([24.5+10,13+2*1.5,18+height]);
    translate([5-0.1,1.5,-0.01])cube([24.7,13,18+height+0.1]);
    translate([2.5,((13+2*1.5)/2),-0.01])cylinder(r=1.4,h=18+height+0.1,$fn=32);
    translate([(24.5+10)-2.5,((13+2*1.5)/2),-0.01])cylinder(r=1.4,h=18+height+0.1,$fn=32);
    // Cut out for servo vires etc.  
    //translate([-0.01,1.5,1.5])cube([5.1,13,10+height]);
    translate([-0.01,1.5,2])cube([5.1,13,9.5+height]);  
    //translate([-0.01+(23.5+10)-5,1.5,1.5])cube([5.1,13,10+height]); 
    translate([-0.01+(23.5+11)-5,1.5,2])cube([5.1,13,9.5+height]);  
  }  
}

module block_five(){
  servo_holder(0);  
  translate([0,13+2*1.5,0])servo_holder(2.5);
  translate([0,2*(13+2*1.5),0])servo_holder(2*2.5);
  translate([0,3*(13+2*1.5),0])servo_holder(3*2.5);
  translate([0,4*(13+2*1.5),0])servo_holder(4*2.5);  
}    

module block_four(){
  servo_holder(0);  
  translate([0,13+2*1.5,0])servo_holder(2.5);
  translate([0,2*(13+2*1.5),0])servo_holder(2*2.5);
  translate([0,3*(13+2*1.5),0])servo_holder(3*2.5);
  //translate([0,4*(12+2*1.5),0])servo_holder(4*5);  
}

module block_nine(){
  servo_holder(0);  
  translate([0,13+2*1.5,0])servo_holder(5);
  translate([0,2*(13+2*1.5),0])servo_holder(2*5);
  translate([0,3*(13+2*1.5),0])servo_holder(3*5);
  translate([0,4*(13+2*1.5),0])servo_holder(4*5);
  translate([0,5*(13+2*1.5),0])servo_holder(5*5);
  translate([0,6*(13+2*1.5),0])servo_holder(6*5);
  translate([0,7*(13+2*1.5),0])servo_holder(7*5);
  translate([0,8*(13+2*1.5),0])servo_holder(8*5); 
  translate([-(50-(23.5+10))/2,0,0])fastening();   
}

module fastening(){
  difference(){  
    cube([60,1.5,18]);
    translate([5,-0.01,8])rotate([-90,0,0])cylinder(r=1.6,h=30,$fn=32);
    translate([60-5,-0.01,8])rotate([-90,0,0])cylinder(r=1.6,h=30,$fn=32);  
  }  
}

module block_one(){
  servo_holder(0);
  translate([-(60-(23.5+10))/2,0,0])fastening(); 
}

module block_two(){
  servo_holder(0);
  translate([0,13+2*1.5,0])servo_holder(5);
  translate([-(60-(23.5+10))/2,0,0])fastening();  
}

module riser(){
  difference(){  
    cube([60,40,2]);
    translate([60-5,40-10,-1])cylinder(r=1.7,h=70,$fn=32);
    translate([60-55,40-10,-1])cylinder(r=1.7,h=70,$fn=32);  
  }
  difference(){
    cube([60,20,50]);
    // Fastening holes  
    translate([60-5,10,-1])cylinder(r=2.3,h=70,$fn=32);
    translate([60-55,10,-1])cylinder(r=2.3,h=70,$fn=32);  
  }  
}

module fix_220(){
  difference(){
    cube([50,20,10]);
    translate([-1,4,0])cube([23,5,8]);
    translate([50-23+1,4,0])cube([23,5,8]);
    translate([15,8,0])cube([20,5,8]);
    translate([8,20-5,2.1])cylinder(r=4,h=10,$fn=32);
    translate([8,20-5,-1
      ])cylinder(r=2,h=10,$fn=32);  
  }    
}    

module saw_support(){
  cube([40,9,1]);
  translate([0,15,0])cube([40,9,1.2]);  
}

module punch_holder(){
  difference(){
    cube([5,5,2]);
    translate([2-0.5,-0.01,-0.01])cube([2.1,1.5,5]);
    translate([2-0.5,5-1.5,-0.01])cube([2.1,1.6,5]);  
  }  
}

module sharpener(){
  difference(){
    cube([50,30,40]);
    translate([-0.01,-0.01,4])cube([30,31,25]);
    translate([15,15,-1])cylinder(r=17/2,h=15,$fn=32);
    translate([-0.01,-0.01,15])cube([17,31,50]);
    translate([15,15,15])cylinder(r=3,h=50,$fn=32);
    translate([0,15,20])rotate([0,90,0])cylinder(r=1,h=60,$fn=32);
    translate([0,15,25])rotate([0,90,0])cylinder(r=1,h=60,$fn=32);
    translate([0,15,32])rotate([0,90,0])cylinder(r=1,h=60,$fn=32);
    translate([0,15,37])rotate([0,90,0])cylinder(r=1,h=60,$fn=32);  
  }
}

module paper_movement(){
  difference(){
    //cube([150,30,10]);
    cube([120,30,10]);  
    translate([-0.01,5,-0.01])cube([30,20,15]);
    translate([5,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-5,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-15,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-25,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-35,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-45,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-55,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-65,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-75,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);
    translate([150-85,-1,5])rotate([-90,0,0])cylinder(r=3.1,h=50,$fn=32);  
  }  
}

module movement_base(){
  difference(){
    cube([70,50,10]);
    translate([-0.01,8.5,-0.01])cube([20,33,15]);
    translate([5,-1,5])rotate([-90,0,0])cylinder(r=3.15,h=60,$fn=32);
    translate([40,12,-0.01])cube([20,26,15]);  
  } 
  difference(){
    translate([70,-10,0])cube([5,70,20]);
    //translate([0,-5,15])rotate([0,90,0])cylinder(r=1.6,h=100,$fn=32);
    translate([0,5+50,15])rotate([0,90,0])cylinder(r=1.6,h=100,$fn=32);
    translate([0,-5,10])cube([100,3,8]);   
  } 
}

module block_riser_3(){
  difference(){  
    cube([40,60,3]);
    translate([10,5,-1])cylinder(r=1.6,h=5,$fn=32);
    translate([10,60-5,-1])cylinder(r=1.6,h=5,$fn=32);  
  }
  difference(){
    translate([40-20,-10,0])cube([20,80,3]);
    translate([40-20+10,5-10,-1])cylinder(r=1.6,h=5,$fn=32);
    translate([40-20+10,70-5,-1])cylinder(r=1.6,h=5,$fn=32);  
  }  
}


//block_one();
//block_two();
//block_three();
//block_four();
//block_five();
//block_nine();
//translate([-(60-34.5)/2,0,0])fastening();
//riser();
//fix_220();
//saw_support();
//punch_holder();
//sharpener();
//paper_movement();
//translate([0,-70,0])movement_base();
block_riser_3();
