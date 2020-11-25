class Label {

  Wall w;

  Label() {
    w = getWall();
  }

  void display() {
    text(convert(w.w/100f), w.w/2 + 20, w.h/2);
    text(convert(w.h/100f), w.w/2 - 20, - w.h/2 - 20 );
    text(convertDegree(), w.w/2 + 20, - w.h/3);
  }

  String convert(float f) {
    return String.valueOf(f) + " m";
  }

  String convertDegree() {
    int degree = (int)(w.rotX * 180/PI);
    return String.valueOf(degree)+" °";
  }
}
