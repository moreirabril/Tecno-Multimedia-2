int INTERVALO=200;
class PinceladasRosa {
  //int can = 3;
  //int c = int(random(can));
  //PImage pinceladasR[];// = new PImage [can];
  //Paleta r = new Paleta("rosa.jpg");
  float x, y;
  float t = 20;

  float dir, vel;
  //float tinte;

  PImage imagen;
  int cantidadPorciones = 40;
  int cualPorcion = 0;

  float xa, ya, xd, yd;
  boolean yaTengoCuatrosPuntos = false;

  color elColorOrigen;
  color elColorDestino;
  String estado;
  long marcaEnElTiempo;
  float avance;

  PinceladasRosa(String nombreTrazo) {      
    //pinceladasR=new PImage[can];
    //for (int i = 0; i < can; i++) {
    //  String nombre = "rosa"+nf(i, 2)+".png" ;
    //  pinceladasR[i]= loadImage(nombre);
    //  pinceladasR[i].filter(INVERT);
    //}
    imagen = loadImage( nombreTrazo );
    imagen.filter(INVERT);
    //imagen.mask( imagen );
    x = 300 ;
    y = 400;
    dir = radians( random( 360 ) );
    vel = 5;
    elegirNuevoColor();
    estado="cambio";
  }
  void actualizar() {
    if (estado.equals("cambio")) {
      elColorOrigen=elColorDestino;
      elegirNuevoColor();
      marcaEnElTiempo=millis();
      estado="transicion";
      avance=0;
    } else if (estado.equals("transicion")) {
      long ahora=millis();
      avance=map(ahora, marcaEnElTiempo, marcaEnElTiempo+INTERVALO, 0, 1);
      if (ahora>marcaEnElTiempo+INTERVALO) {
        estado="cambio";
      }
    }
  }

  void dibujar() {
    pushStyle();
    colorMode( HSB );
    color colorActual=lerpColor(elColorOrigen, elColorDestino, avance);
    fill( colorActual );
    noStroke();
    ellipse( x, y, t, t );
    popStyle();
  }

  void elegirNuevoColor() {
    pushStyle();
    colorMode(HSB);
    elColorDestino=color(random(220, 230), 200, 240);
    popStyle();
  }
  void mover() {

    dir += radians(random(-10, 10));

    float dx = vel * cos( dir );
    float dy = vel * sin( dir );

    x = x + dx;
    y = y + dy;

    if ( x>width || x<0 || y>height || y<0 ) {
      yaTengoCuatrosPuntos = false;
    }
    //espacio toroidal para que vuelva al lienzo
    x = ( x>width ? x-width : x );
    x = ( x<0 ? x+width : x );
    y = ( y>height ? y-height : y );
    y = ( y<0 ? y+height : y );

  }

  void cambiarDireccion() {
  dir=random(0, 260);
}

  void dibujarTrazo() {

    cualPorcion = (cualPorcion+1) % cantidadPorciones;
    float anchoNorm = 1.0/cantidadPorciones;

    float u1 = map(cualPorcion, 0, cantidadPorciones, 0, 1);    
    float v1 = 0;

    float u2 = u1+anchoNorm;    
    float v2 = 0;

    float u3 = u2;    
    float v3 = 1;

    float u4 = u1;    
    float v4 = 1;

    float radio = 50;
    float angulo = radians(-90)+dir;
    float xb = radio * cos( angulo ) + x;
    float yb = radio * sin( angulo ) + y;

    angulo = radians(90)+dir;
    float xc = radio * cos( angulo ) + x;
    float yc = radio * sin( angulo ) + y;

    //texturizar
    if ( yaTengoCuatrosPuntos ) {

      pushStyle();
      colorMode( HSB );
      color colorActual=lerpColor(elColorOrigen, elColorDestino, avance);
      tint( colorActual );
      noStroke();
      beginShape();
      textureMode(NORMAL);
      texture(imagen);
      vertex(xa, ya, u1, v1);
      vertex(xb, yb, u2, v2);
      vertex(xc, yc, u3, v3);
      vertex(xd, yd, u4, v4);
      endShape();

      popStyle();
    }

    xa = xb;
    ya = yb;
    xd = xc;
    yd = yc;
    yaTengoCuatrosPuntos = true;
  }


  //void dibujar() {
  //  push();
  //  grafico4.imageMode(CENTER);
  //  float xR = random(500, 500);
  //  float yR= random ( 0, 100 );
  //  grafico4.rotate((random(-1, 0.4)));
  //  grafico4.tint(r.darunColor(), 180);
  //  grafico4.scale ( random (1, 2));    
  //  grafico4.image(pinceladasR[c], xR, yR );
  //  pop();
  //}
}
