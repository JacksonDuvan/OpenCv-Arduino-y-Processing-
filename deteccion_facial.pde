import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.serial.*;

int i;

Capture video;
OpenCV opencv;
Serial arduino;

void setup(){
  size(640,480);
  video = new Capture(this, 640/2, 480/2); 
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
  
  arduino = new Serial(this, Serial.list()[0], 9600);
  
    video.start();
}
void draw(){
  if(video.available()){
    video.read();
  }
  scale(2);
  opencv.loadImage(video);
  image(video, 0, 0);
  
  Rectangle[] faces = opencv.detect();
  
  noFill(); stroke(0, 255, 0); strokeWeight(3);
  for (int i = 0; i < faces.length; i++){
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  
  }
  
  if(faces.length > 0){
    int angulo = faces[0].x * 180 / 320;
    arduino.write(angulo);
  }
}