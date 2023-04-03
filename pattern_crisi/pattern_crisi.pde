import java.util.*;
import java.awt.*;
import gab.opencv.*;
import processing.video.*;
PImage [] facce= new PImage[50];
Capture video;
PImage[] backgrounds;
int currentBackgroundIndex = 0;
PImage mask;

Random random = new Random();

OpenCV opencv;
int dim1=320*3;
int dim2=240*3;
int ti;
int tim;
int time;
int time1;
int time2;
int time3;

String[] cameras = Capture.list();
void setup() {
 


  ti = year();
  tim = month();
  time = day();
  time1 = hour();
  time2 = minute();
  time3 = second();
  scale(3);
fullScreen();
  //size(2160,1480);

  background(250);
  
  // mask = loadImage("cdn.png");
  
  backgrounds = new PImage[] {
    loadImage("cdn1.png"),
    loadImage("cdn2.png"),
    loadImage("cdn3.png"),
    loadImage("cdn4.png"),
    loadImage("cdn5.png"),
    loadImage("cdn6.png")
  };
 
  

  opencv= new OpenCV(this, dim1, dim2);
  //FRONTALFACE = faccia NOSE = naso MOUTH= bocca ecc..
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);



  //cameras[x] seleziona la camera da utilizzare, cambiando il numero nel [], la cam numero 0 è la predefinita
  video = new Capture(this, dim1, dim2, cameras[0]);
  video.start();
}

void captureEvent(Capture video) {
  video.read();
}
void random(){
int[] indices = new int[facce.length];
for (int i = 0; i < indices.length; i++) {
  indices[i] = i;
}

for (int i = indices.length - 1; i > 0; i--) {
  int j = (int) random(i + 1);
  int temp = indices[i];
  indices[i] = indices[j];
  indices[j] = temp;
}

for (int i = 0; i < indices.length; i++) {
  int randomIndex = indices[i];
  facce[randomIndex] = loadImage("sav/" + randomIndex + ".jpg");
}

}





void draw() {
  
  delay(300);
 for(int i= 0; i<facce.length ; i++ ){
  facce[i]= loadImage("sav/"+i+".jpg");
  




  
  
  }

  //video

  opencv.loadImage(video);
  image(video, 0, 0, dim1, dim2);
  volto();
  griglia();

 
  blendMode(MULTIPLY);
  fill(238,130,238);
  rect(0,0,width,height);
 
    blendMode(NORMAL);
//     image(mask,0,0,width,height);
     currentBackgroundIndex = random.nextInt(5);
     image(backgrounds[currentBackgroundIndex],0,0,width,height);

}
