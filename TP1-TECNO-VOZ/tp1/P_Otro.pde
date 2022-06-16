class PinceladasOtro {
  int can = 2;
  int c = int(random(can));
  PImage PinceladasO[]; //= new PImage [can];
  Paleta o = new Paleta("otro.jpg");

  PinceladasOtro() {
    PinceladasO = new PImage [can];
    for (int i = 0; i < can; i++) {
      String nombre = "otro"+nf(i, 2)+".png" ;
      PinceladasO[i]= loadImage(nombre);
      PinceladasO[i].filter(INVERT);
      PinceladasO[i].resize(40,40);
    }
  }

  void dibujar() {
    push();
    grafico6.imageMode(CENTER);
    grafico6.rotate((random(-5, 10)));
    float xO = random ( width-400, 600 );
    float yO = random (0, height);
    grafico6.rotate((random(-1, 0.4)));
    grafico6.tint(o.darunColor(), 180);
    grafico6.scale ( random (1, 2));
    grafico6.image (PinceladasO[c], xO, yO);

    pop();
  }
}
