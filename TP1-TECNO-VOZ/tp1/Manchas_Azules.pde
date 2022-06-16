class Mancha {
  gift[]gifs=new gift[6];
  int c = int(random(10, 16));
  float x[] = new float [c];
  float y [] = new float [c];
  float t = 20;
  float dir, vel;
  Paleta a = new Paleta("azul.png");


  Mancha() {
    for (int i = 0; i < gifs.length; i++) {
      gifs[i]=new gift();
      x [i] = random(width/2-10, width-40);
      y [i]= random(height/2-10, height-40);
    }
  }

  void dibujar() {
    for (int i = 0; i < gifs.length; i++) {
      gifs[i].dibujar( x[i], y[i]);
      imageMode(CORNER);
    }
  }

 
  void PinceladasNegras() {
    push();
    PImage m = loadImage("trazo.png");
    m.filter(INVERT);
    m.mask(m);
    float x1 = random(width/2, width-60);
    float y1 = random(height/2, height-20);
    grafico5.rotate((random(-10, 10)));
    grafico5.image(m, x1, y1);
    grafico5.tint(a.darunColor(), 180);
    grafico5.scale ( random (-1, 1));
    pop();
  }
}
