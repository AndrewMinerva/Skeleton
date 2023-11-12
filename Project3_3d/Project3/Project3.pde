Box ledge;
Box right;
Box left;
Camera camera;
void setup(){
  size(840,580, P3D);
  surface.setTitle("Inverse Kinematics [CSCI 5611 Example]");
  ledge = new Box(0, 530, 140, 110, 340);
  camera = new Camera();
}

float armW = 20;

void draw(){
  centralRoot.x += movementX;
  centralRoot.y += movementY;
  stableRoot.x += movementX;
  stableRoot.y += movementY;
  camera.Update(1/frameRate);
  fk();
  solve();
  fk_2();
  solve_2();
  fk_R();
  solve_R();
  lights();
  background(0,0,0);
  
  
  fill(245,241,130);
  
  
  pushMatrix();
  translate(stableRoot.x, stableRoot.y);
  rotate(aR);
  rect(0, -armW/2, lR, armW);
  box(lR, armW,10);
  popMatrix();
  
  //Arm1
  pushMatrix();
  translate(centralRoot.x, centralRoot.y);
  rotate(a0);
  rect(0, -armW/2, l0, armW);
  box(l0, armW,10);
  popMatrix();
  
  pushMatrix();
  translate(start_l1.x,start_l1.y);
  rotate(a0+a1);
  rect(0, -armW/2, l1, armW);
  box(l1, armW,10);
  popMatrix();
  
  pushMatrix();
  translate(start_l2.x,start_l2.y);
  rotate(a0+a1+a2);
  rect(0, -armW/2, l2, armW);
  box(l2, armW,10);
  popMatrix();
  
  //Arm2
  pushMatrix();
  translate(centralRoot.x,centralRoot.y);
  rotate(a0_2);
  rect(0, -armW/2, l0_2, armW);
  box(l0, armW,10);
  popMatrix();
  
  pushMatrix();
  translate(start_l1_2.x,start_l1_2.y);
  rotate(a0_2+a1_2);
  rect(0, -armW/2, l1_2, armW);
  box(l1, armW,10);
  popMatrix();
  
  pushMatrix();
  translate(start_l2_2.x,start_l2_2.y);
  rotate(a0_2+a1_2+a2_2);
  rect(0, -armW/2, l2_2, armW);
  box(l2, armW,10);
  popMatrix();
  
  
  //LEGS
  pushMatrix();
  translate(stableRoot.x + 5, stableRoot.y + 90);
  rotate(PI/3);
  rect(0, -armW/2, lR, armW);
  box(lR, armW,10);
  popMatrix();
  
    //LEGS
  pushMatrix();
  translate(stableRoot.x - 5, stableRoot.y + 90);
  rotate(2*PI/3);
  rect(0, -armW/2, lR, armW);
  box(lR, armW,10);
  popMatrix();
  
  noStroke();
  
  //Skeleton
  pushMatrix();
  translate(stableRoot.x - 10, stableRoot.y-5);
  //rect(0, -armW/2, lR, armW);
  //box(lR, armW,10);
  popMatrix();
  pushMatrix();
  translate(centralRoot.x, centralRoot.y - 20);
  sphere(30);
  popMatrix();
  
  rect(ledge.x, ledge.y, ledge.w, ledge.h);
  
  //Root
  fill(10,100,10);
  circle(centralRoot.x, centralRoot.y, 20);
  circle(stableRoot.x, stableRoot.y, 20);
  
  //Object
  pushMatrix();
  translate(mouseX, mouseY);
  sphere(10);
  popMatrix();
  
}
