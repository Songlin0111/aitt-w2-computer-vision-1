import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;


OpenCV opencv;
Capture cam;
Rectangle[] faces;

void setup() 
{
  //size(10, 10);
  
  //initCamera();
  //opencv = new OpenCV(this, cam.width, cam.height);
  
  //surface.setResizable(true);
  //surface.setSize(opencv.width, opencv.height);
  opencv = new OpenCV(this, "test.jpg");
  size(1080, 720);

  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
}

void draw() 
{
  //if(cam.available())
  //{    
  //  cam.read();
  //  cam.loadPixels();
  //  opencv.loadImage((PImage)cam);
  //  image(opencv.getInput(), 0, 0);
  image(opencv.getInput(), 0, 0);

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }

    // you should write most of your computer vision code here 
    
    
    // CODE
    
    
    // end code
  }


void initCamera()
{
  String[] cameras = Capture.list();
  if (cameras.length != 0) 
  {
    println("Using camera: " + cameras[0]); 
    
    // If you receive the error "BaseSrc: [avfvideosrc0] : Internal data stream error"
    // then comment out the line below and uncomment the one below that.
    cam = new Capture(this, cameras[0]);
    //cam = new Capture(this, 640, 480, "pipeline:avfvideosrc device-index=0", 30);  
    
    cam.start();    
    
    while(!cam.available()) print();
    
    cam.read();
    cam.loadPixels();
  }
  else
  {
    println("There are no cameras available for capture.");
    exit();
  }
}
