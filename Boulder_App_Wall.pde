import picking.*; //<>//

Picker picker;
Wall wall;
Label l;
Volumen pickedVolume;
ArrayList<Volumen> volumes = new ArrayList<Volumen>();
int volId;

final int DRAG_NONE = 0;
final int DRAG_VOL1 = 1;
final int DRAG_VOL2 = 2;
int dragging = DRAG_NONE;

// Dragging an existing Node:
//final int UNDEFINED = -1; 
//int vol_drag = UNDEFINED;

// Temporary volume coordinate
float temp_x, temp_y;
float wall_x, wall_y;

PVector button_vol1, button_vol2;
PImage img_vol;

void setup() {
  size(1000, 600, P3D);
  picker = new Picker(this);

  smooth();

  wall_x = width/3;
  wall_y = height/2;
  button_vol1 = new PVector(width*7/8, 100);
  button_vol2 = new PVector(width*7/8, 250);
  wall = new Wall();
  l = new Label();
}

void draw() {
  if (mousePressed && pickedVolume != null) {
    pickedVolume.incrementXY(mouseX-pmouseX, mouseY-pmouseY);
  }

  background(32);
  fill(255);
  noStroke();

  // Scrollable choices of volumes
  rect(width*3/4, 0, width*1/4, height);

  pushMatrix();
  translate(width/3, height/2, 0);
  wall.display();
  //l.display();
  for (Volumen vol : volumes) {
    picker.start(vol.id);
    vol.display();
  }
  popMatrix();

  picker.stop();

  createButton("py.png", button_vol1.x, button_vol1.y);
  createButton("py.png", button_vol2.x, button_vol2.y);
  checkVolumeDrag();
}

Wall getWall() {
  return wall;
}

void checkVolumeDrag() {
  textAlign(CENTER);
  if (dragging == DRAG_VOL1) {
    fill(255, 2, 2);
    text("--vol1--", mouseX, mouseY);
  } else if (dragging == DRAG_VOL2) {
    fill(255, 2, 2);
    text("--vol2--", mouseX, mouseY);
    //} else if (vol_drag!=UNDEFINED) {
    //  // Drag an existing node 
    //  Volumen vol = volumes.get(vol_drag);
    //  vol.incrementXY(mouseX-pmouseX, mouseY-pmouseY);
  }
}

void createButton(String filename, float x, float y) {
  imageMode(CENTER);
  img_vol = loadImage(filename);
  image(img_vol, x, y);
}

void mouseDragged() {
  if (mouseButton == RIGHT) 
    wall.moveWall();
}

void keyPressed() {
  switch(keyCode) {
  case UP: 
    wall.increaseHeight();
    break;

  case DOWN:
    wall.decreaseHeight();
    break;

  case RIGHT:
    wall.increaseWidth();
    break;

  case LEFT:
    wall.decreaseWidth();
    break;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    // Possible begin of drag 
    //vol_drag=UNDEFINED; // reset 
    if (mouseX > button_vol1.x-img_vol.width/2 &&
      mouseX < button_vol1.x+img_vol.width/2 && 
      mouseY > button_vol1.y-img_vol.height/2 &&
      mouseY < button_vol1.y+img_vol.height/2) {
      dragging = DRAG_VOL1;
      return;
    } else if (mouseX > button_vol2.x-img_vol.width/2 &&
      mouseX < button_vol2.x+img_vol.width/2 && 
      mouseY > button_vol2.y-img_vol.height/2 &&
      mouseY < button_vol2.y+img_vol.height/2) {
      dragging = DRAG_VOL2;
      return;
    } else {
      //// Search all existing nodes 
      //for (int i = 0; i < volumes.size(); i++) { 
      //  Volumen v = volumes.get(i);
      //  //  // Check if mouse is over the node
      //  if (v.over()) {
      //    vol_drag = i;
      // Retrieve the position of the hold when it is dragged
      temp_x = pmouseX;
      temp_y = pmouseY;
      //return;
      //}
      //}
      int id = picker.get(mouseX, mouseY);
      if (id >= 0 && id < volumes.size()) {
        pickedVolume = volumes.get(id);
      }
    }
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    // Check if the mouse is released over the wall
    if (mouseX > wall_x-wall.w/2 && mouseX < wall_x+wall.w/2 && 
      mouseY > wall_y-wall.h/2 && mouseY < wall_y+wall.h/2) {
      temp_x = mouseX-width/3;
      temp_y = mouseY-height/2;
      Volumen vol;
      // Check if a new node is being dragged
      switch (dragging) {
      case DRAG_VOL1 : 
        dragging = DRAG_NONE;
        vol = new Volumen(volId, temp_x, temp_y);
        volumes.add(vol);
        volId++;
        break;
      case DRAG_VOL2 : 
        dragging = DRAG_NONE;
        vol = new Volumen(volId, temp_x, temp_y);
        volumes.add(vol);
        volId++;
        break;
      }
    } else {
      dragging = DRAG_NONE;
      //if (vol_drag!=UNDEFINED) {
      //  Volumen vol = volumes.get(vol_drag);
      //  vol.incrementXY(temp_x-mouseX, temp_y-mouseY);
      //}
    }
    //vol_drag = UNDEFINED;
  }
  pickedVolume = null;
}
