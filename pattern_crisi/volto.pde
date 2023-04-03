int num;
int cropdim1= 330;
int cropdim2= 0;
void volto() {


  Rectangle[] volto = opencv.detect();

  for (int i = 0; i < volto.length; i++) {
    //println(volto[i].x, volto[i].y);
    PImage crop= get(volto[i].x, volto[i].y, volto[i].width, volto[i].height);
    image(crop, cropdim1, cropdim2, 50,50);
  }



  //salvataggio immagine
  PImage imgsav= get(cropdim1, cropdim2, 50,50);

  if (volto.length>0) {
    //ritardo
    //delay(50);
    num= int(random(50));
   
 
    
    imgsav.save("sav/"+ num +".jpg");
    //imgsav.save("sav/"+ti +"."+ tim +"."+ time +"/"+ time1 +"."+ time2 +"."+ time3 + "/"+ num +".jpg");
  }
}
