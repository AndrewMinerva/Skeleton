Box ledge;
Box right;
Box left;

void setup(){
  size(840,580);
  surface.setTitle("Inverse Kinematics [CSCI 5611 Example]");
  ledge = new Box(0, 530, 140, 110, 340);
}

float armW = 20;

void draw(){
  centralRoot.x += movementX;
  centralRoot.y += movementY;
  stableRoot.x += movementX;
  stableRoot.y += movementY;
  
  fk();
  solve();
  fk_2();
  solve_2();
  fk_R();
  solve_R();
  
  background(250,250,250);
  
  
  fill(245,241,130);
  
  
  pushMatrix();
  translate(stableRoot.x, stableRoot.y);
  rotate(aR);
  rect(0, -armW/2, lR, armW);
  popMatrix();
  
  //Arm1
  pushMatrix();
  translate(centralRoot.x, centralRoot.y);
  rotate(a0);
  rect(0, -armW/2, l0, armW);
  popMatrix();
  
  pushMatrix();
  translate(start_l1.x,start_l1.y);
  rotate(a0+a1);
  rect(0, -armW/2, l1, armW);
  popMatrix();
  
  pushMatrix();
  translate(start_l2.x,start_l2.y);
  rotate(a0+a1+a2);
  rect(0, -armW/2, l2, armW);
  popMatrix();
  
  //Arm2
  pushMatrix();
  translate(centralRoot.x,centralRoot.y);
  rotate(a0_2);
  rect(0, -armW/2, l0_2, armW);
  popMatrix();
  
  pushMatrix();
  translate(start_l1_2.x,start_l1_2.y);
  rotate(a0_2+a1_2);
  rect(0, -armW/2, l1_2, armW);
  popMatrix();
  
  pushMatrix();
  translate(start_l2_2.x,start_l2_2.y);
  rotate(a0_2+a1_2+a2_2);
  rect(0, -armW/2, l2_2, armW);
  popMatrix();
  
  
  //LEGS
  pushMatrix();
  translate(stableRoot.x + 5, stableRoot.y + 90);
  rotate(PI/3);
  rect(0, -armW/2, lR, armW);
  popMatrix();
  
    //LEGS
  pushMatrix();
  translate(stableRoot.x - 5, stableRoot.y + 90);
  rotate(2*PI/3);
  rect(0, -armW/2, lR, armW);
  popMatrix();
  
  
  //Skeleton
  rect(stableRoot.x - 10, stableRoot.y-5, armW, 100);
  circle(centralRoot.x, centralRoot.y - 20, 75);
  //rect(ledge.x, ledge.y, ledge.w, ledge.h);
  
  //Root
  fill(0,0,0);
  //circle(centralRoot.x, centralRoot.y, 20);
  //circle(stableRoot.x, stableRoot.y, 20);
  
  //Object
  circle(mouseX, mouseY, 50);
  
}
