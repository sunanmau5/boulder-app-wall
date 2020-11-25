class Pyramid {
  float t;
  float u;

  public Pyramid(float t, float u) {
    this.t = t;
    this.u = u;
  }

  void display() { 

    beginShape(TRIANGLES);

    fill(100, 100, 100); 
    vertex(-t, -t, -t);
    vertex( t, -t, -t);
    vertex( u, u, t);

    fill(100, 100, 100);
    vertex( t, -t, -t);
    vertex( t, t, -t);
    vertex( u, u, t);

    fill(100, 100, 100);
    vertex( t, t, -t);
    vertex(-t, t, -t);
    vertex( u, u, t);

    fill(100, 100, 100);
    vertex(-t, t, -t);
    vertex(-t, -t, -t);
    vertex( u, u, t);

    endShape();
  }
}
