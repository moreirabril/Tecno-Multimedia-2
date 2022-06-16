class PinceladasAmarillo {
  float x, y;
  float t = 20;
  float dir, vel;
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

  PinceladasAmarillo(String nombreTrazo) {
    //pinceladasA=new PImage[can];
    //for (int i = 0; i < can; i++) {
    //  String nombre = "amarillo"+nf(i, 2)+".png" ;
    //  pinceladasA[i]= loadImage(nombre);
    //  pinceladasA[i].filter(INVERT);
    //}
    imagen = loadImage( nombreTrazo );
    imagen.filter(INVERT);
    //imagen.mask( imagen );
    x = random(width-450, 300  ) ;
    y = random(500, 600);
    dir = radians( random( 360 ) );
    vel = 6;
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
    elColorDestino=color(random(28, 45), 200, 240);
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
//  float x = random(250, width - width/1.5  ) ;
//  float y = random(200, height - height/2);
//  push();
//  grafico1.rotate((random(-1, 0.1)));
//  grafico1.tint(a.darunColor(), 180);
//  grafico1.rotate((random(-0.1, 0)));     
//  //grafico1.scale (random(2, 6));
//  grafico1.image (pinceladasA[c], x, y );
//  pop();
//}
}
