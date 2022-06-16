/*
 | TP1 | Tmm2 | FdA | UNLP |
 ------- TP1 Etapa Final -------
 Comision: Lisandro | Prof.Lisandro Peralta
 Alumna:Moreira Abril(88127/2).
 */
import oscP5.*;
PImage fondo;
//PGraphics grafico1; //Pinceladas Amarillas//
PGraphics grafico2; //MACHAS AZULES//
PGraphics grafico3; //GARABATO//
//PGraphics grafico4; //Pinceladas Rosas//
PGraphics grafico5; //Pinceladas azul oscuro//
PGraphics grafico6; //Otras Pinceladas //
Cuadro c;


void setup() {  
  size(800, 950,P3D);
  fondo=loadImage("fondo.png");
  //grafico1 = createGraphics(800, 950);
  grafico2 = createGraphics(800, 950);
  grafico3 = createGraphics(800, 950);
  //grafico4 = createGraphics(800, 950);
  grafico5 = createGraphics(800, 950);
  grafico6 = createGraphics(800, 950);
  c = new Cuadro();
  background(fondo);
}

void draw() {
  c.dibujarCuadro();
  image(grafico6, 0, 0);
  //image(grafico1, 0, 0);
  //image(grafico4, 0, 0);
  image(grafico5, 0, 0);
  image(grafico3, 0, 0);
  image(grafico2, 0, 0);
}
