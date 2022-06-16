class Curva {
  float x1, y1, x2, y2, x3, y3, x4, y4;
  float angulo1;
  float radio1;
  float angulo2;
  float radio2;
  Curva (float x1_, float y1_,float x4_, float y4_,float radio) {
    x1=x1_;
    y1=y1_;
    x4=x4_;
    y4=y4_;
    setRadio1(radio);
    setRadio2(radio);
    setAngulo1(random(radians(360)));
    setAngulo2(random(TWO_PI));
    //angulo1=atan2(y2-y1, x2-x1);
    //radio1=dist(x1, y1, x2, y2);
    //angulo2=atan2(y3-y4, x3-x4);
    //radio2=dist(x3, y3, x4, y4);
  }

  void dibujar() {
    grafico3.bezier(x1, y1, x2, y2, x3, y3, x4, y4);
  }
//------------------
  //void cruz ( float x, float y) {
  //  line (x-10, y, x+10, y);
  //  line (x, y-10, x, y+10);
  //}

  //void dibujarPuntosControl () {
  //  pushStyle();
  //  stroke(0, 255, 0, 100);
  //  line(x1, y1, x2, y2);
  //  line(x3, y3, x4, y4);
    //stroke(255, 0, 0);
    //cruz(x1, y1);
    //cruz(x2, y2);
    //cruz(x3, y3);
    //cruz(x4, y4);
  //  strokeWeight(0);
  //  dibujar();
  //  popStyle();
  //}
//--------------------
  void setAngulo1(float nuevoAngulo) {
    angulo1=nuevoAngulo;
    float dx=radio1*cos(angulo1);
    float dy=radio1*sin(angulo1);
    x2=x1+dx;
    y2=y1+dy;
  }
  void setAngulo2(float nuevoAngulo) {
    angulo2=nuevoAngulo;
    float dx=radio2*cos(angulo2);
    float dy=radio2*sin(angulo2);
    x3=x4+dx;
    y3=y4+dy;
  }
  void setRadio1( float nuevoRadio ) {
    radio1 = nuevoRadio;
    x2 = x1 + radio1 * cos( angulo1 );
    y2 = y1 + radio1 * sin( angulo1 );
  }  
  //---------------------------------------

  void setRadio2( float nuevoRadio ) {
    radio2 = nuevoRadio;
    x2 = x1 + radio1 * cos( angulo1 );
    y2 = y1 + radio1 * sin( angulo1 );
  }  
}
