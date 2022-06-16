
int TAMANIO_RADIO=300;
class Cadena {
  ArrayList <Curva> lista ;
  float x, y;
  String estado;

  Cadena() {
    lista= new ArrayList();
    estado="espera";
  }

  void click(float x_, float y_) {
    if (estado.equals("espera")) {
      x=x_;
      y=y_;
      estado="primero";
    } else if (estado.equals("primero")) {
      Curva curva = new Curva(x, y, x_, y_, TAMANIO_RADIO);
      lista.add (curva);
      estado="siguientes";
      x=x_;
      y=y_;
    } else if (estado.equals("siguientes")){
    Curva ultimo = lista.get(lista.size()-1);
    Curva curva=new Curva (x, y, x_, y_, TAMANIO_RADIO);
    curva.setAngulo1(ultimo.angulo2+PI);
    lista.add(curva);
    x=x_;
    y=y_;
    }
    }
  
  void cruz ( float x, float y) {
    line (x-10, y, x+10, y);
    line (x, y-10, x, y+10);
  }

  void dibujar() {
    if (estado.equals("primero")) {
      cruz(x, y);
    } else if (estado.equals("siguientes")) {
      for (Curva c : lista) {
        c.dibujar();
      }
    }
  }
}
