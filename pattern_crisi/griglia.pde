int i;
int dquad=120;
int xgriglia=1;
void griglia(){


for( int x=xgriglia ; x<xgriglia+dquad*60; x= x+dquad ){
  
  ArrayList<PImage> imageList = new ArrayList<PImage>(Arrays.asList(facce)); // Convert array to ArrayList
Collections.shuffle(imageList); // Shuffle the ArrayList
facce = imageList.toArray(facce); // Convert the shuffled ArrayList back to an array
  
 for( int y=0 ; y<dquad*40; y= y+dquad){ 
   
    i=i+1;
    
    if(i>49){ i= 0;}
image(facce[i],x,y,dquad,dquad);

//delay(100);
}




}
}
