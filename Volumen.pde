class Volumen { 
  int id;
  int size = 30;
  float x;
  float y;

  Volumen(int id, float x, float y) {
    this.id = id;
    this.x = x;
    this.y = y;
  }

  void display() {
    //fill(153);
    stroke(0);
    pushMatrix();
    translate(x, y, 45);
    Pyramid p = new Pyramid(30, 0);
    p.display();
    //box(size);
    popMatrix();
  }

  void incrementXY(float x, float y) {
    this.x += x;
    this.y += y;
  }

  //boolean over() {
  //  return mouseX > x - size/2 && mouseX < x + size/2 &&
  //    mouseY > y - size/2 && mouseY < y + size/2;
  //}
}
