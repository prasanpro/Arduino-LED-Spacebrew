 import processing.serial.*;
 Serial port;
 
 // Keep track of our current place in the range
int local_slider_val = 128;
int remote_slider_val = 128;

 void setup() {
 size(256, 150);
 //size(1024, 200);
 background(0);
 port = new Serial(this, "/dev/ttyUSB0", 9600);  
 }
 
 void draw() {
 // draw a gradient from black to white
   background(50);
  stroke(0);

  // Display the current value of local and remote sliders
  fill(255);
  text("Local Slider Value: ", 30, 40);  
  text(local_slider_val, 180, 40);  

  // White box containing slider
  fill(255);
  rect(0, height/2, width, height/2);


  // Line the slider moves on
  fill(150);
  line(0, height * 3/4, width, height * 3/4);

  // Local Slider
  fill(255, 0, 0);
  stroke(200, 0, 0);
  rect(local_slider_val, (height/2) + 5, 20, (height/2) - 10);
}

void mouseDragged() {
  // Leaving 20 pixels at the end prevents the slider from going off the screen
  if (mouseX >= 0 && mouseX <= width - 20) {
    if(mousePressed == true){
    local_slider_val = mouseX;
    port.write(local_slider_val);
    //sb.send("local_slider", local_slider_val);
    }
  }   
}
