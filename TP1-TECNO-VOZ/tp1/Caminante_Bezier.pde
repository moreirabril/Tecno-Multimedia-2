
class CaminanteBezier {
  Cadena cadena;
  int cantidadPasos=100;
  int paso=0;
  int contTramo=0;
  float anteX=-1;
  float anteY=-1;
  float variacionAngular;
 

  CaminanteBezier (Cadena cadena_) {
    cadena=cadena_;
    
  }

  void dibujar() {
    if (contTramo< cadena.lista.size()) {
      Curva c=cadena.lista.get(contTramo);
      float pos=float(paso)/cantidadPasos;
      float esteX=bezierPoint(c.x1, c.x2, c.x3, c.x4, pos);
      float esteY=bezierPoint(c.y1, c.y2, c.y3, c.y4, pos);
      //ellipse(esteX,esteY,10,10);
      if (anteX!=-1) {
        grafico3.strokeWeight(2);
        grafico3.line(anteX, anteY, esteX, esteY);
      }
      anteX=esteX;
      anteY=esteY;
    }
  }
  void girar(float valor) {

    variacionAngular = radians(valor );
  }

  void avanzar() {
    paso++;
    if (paso>cantidadPasos) {
      paso=0;
      contTramo++;
    }
  }
}
