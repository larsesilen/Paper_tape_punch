// Stepper motor friction wheel for paper tape punch designed in OpenScad.
// Name: paper_feed_wheel.scad
// Fits a NEMA-17 stepper motor
// Lars Silen 2024
// This is free software without any warranties.
// Feel free to use and modify.
// 
// Howto use:
// Install openScad
// Create a directory for this project called for example OpenScad/paper_tape_punch/
// Copy this file into the directory.
// Start OpenScad and load this file File/OpenFile/paper_feed_wheel.scad
// Display the part using the Menu  Design/Preview
// Do changes and Preview until the design fits your needs.
// Generate a stl-file for printing using Design/Render . Make sure that
// the stl-file is stored in the correct directory. 

module base(){
  cylinder(r=15,h=25,$fn=64);
  cylinder(r=9,h=35,$fn=64);  
}


difference(){
  base();
  cylinder(r=2.75,h=40,$fn=64);
  translate([0,-12,30])rotate([-90,0,0])cylinder(r=2.6,h=40,$fn=64);  
}
