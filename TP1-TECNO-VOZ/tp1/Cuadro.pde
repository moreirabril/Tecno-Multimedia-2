class Cuadro {

  GestorVoz v;
  Cadena estaCadena;
  CaminanteBezier caminante;
  Mancha a;
  PinceladasAmarillo c;
  PinceladasRosa d;
  PinceladasOtro e;
//-----Interacciones con las manchas:
// PINCELADAS AMARILLAS Y ROSAS:
//-cuando el sonido es alto va pincelando el lienzo.
//-cambia de direccion cuando para y registra un sonido grave
//GRABATO:
//-solo se dibuja si hay sonido agudo
//PINCELADAS AZUL OSCURO Y PINTITAS CELESTES CON BLANCO:
//-se van mostrando cuando el sonido es grave
//-mientras hay sonido la manchita blanca de en medio cambia de lugar
//OTRAS PINCELADAS:
//-se muestran cuando el sonido es bajo


  Cuadro() { 
    //-------
    v = new GestorVoz();
    a= new Mancha();
    estaCadena=new Cadena();
    for (int i=0; i<10; i++) {
      estaCadena.click(random(150, width - width/1.5 ), random( 200, height - height/1.5));
    }
    caminante=new CaminanteBezier(estaCadena);
    c = new PinceladasAmarillo("TrazoRecto2.png");
    d = new PinceladasRosa("TrazoRecto1.png");
    e = new PinceladasOtro();

  }

  void dibujarCuadro() {  
    v.Sonido();
    //println(v.);
    //println(v.sonidoAgudo);

    //Pinceladas
    grafico6.beginDraw();
    //grafico1.beginDraw(); 
    //grafico4.beginDraw();

    if (v.volAlto) {
      d.actualizar();//rosa
      d.mover();//rosa
      d.dibujarTrazo();//rosa
      c.actualizar();//amarillo
      c.mover();//amarillo
      c.dibujarTrazo();//amarillo
    } else if (v.volBajo) {
      e.dibujar();//otras
      c.cambiarDireccion();//amarillo
      d.cambiarDireccion();
    }
    //grafico4.endDraw();
    //grafico1.endDraw();
    grafico6.endDraw();
    //Manchas
    grafico2.beginDraw();
    grafico5.beginDraw();
    if (v.sonidoGrave && v.haySonido) {
      a.dibujar();//manchas celestes
      a.PinceladasNegras();//manchas azul oscuro
    }
    grafico5.endDraw();
    grafico2.endDraw();

    //Garabato
    grafico3.beginDraw(); 
    if (v.sonidoAgudo && v.haySonido) {
      caminante.avanzar();
      caminante.dibujar();
    }
    grafico3.endDraw();
    //println(v.volBajo);
  }
}
