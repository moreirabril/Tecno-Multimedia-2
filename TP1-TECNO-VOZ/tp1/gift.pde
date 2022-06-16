class gift{
int maxImage=40;
int imageIndex=0;
PImage [] images=new PImage[maxImage];
  
gift(){
for( int i=0;i<images.length;i++){
  images[i]=loadImage("mancha"+i+".png" );
  images[i].resize(60,80);
  //frameRate(2); ------se rompe todo el programa
}
imageMode(CENTER);
}
void dibujar (float x,float y){
grafico2.image(images[imageIndex],x,y);
imageIndex=(imageIndex+1)%images.length;
}
}
