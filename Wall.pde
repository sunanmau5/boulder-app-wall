class Wall {
  float rotX, rotY;
  PShape wall;
  int w = 500;
  int h = 300;

  void display() {  
    fill(250);
    stroke(0);
    rotateX(rotX);
    rotateY(-rotY);
    wall = createShape(BOX, w, h, 30);
    shape(wall);
  }

  void moveWall() {
    if (mouseX < width*3/4) {
      if (rotX > -PI/4) {
        if (mouseY > pmouseY) {
          rotX -= (mouseY - pmouseY) * 0.01;
        }
      }
      if (rotX < PI/12) {
        if (mouseY <= pmouseY) {
          rotX -= (mouseY - pmouseY) * 0.01;
        }
      }
    }
  }

  //void increaseAngle() {
  //  if (rotX < PI/12) {
  //    rotX += 0.05;
  //  }
  //}

  //void decreaseAngle() {
  //  if (rotX > -PI/4) {
  //    rotX -= 0.05;
  //  }
  //}

  void increaseHeight() {
    h += 20;
  }

  void decreaseHeight() {
    h -= 20;
  }

  void increaseWidth() {
    w += 20;
  }

  void decreaseWidth() {
    w -= 20;
  }
}
