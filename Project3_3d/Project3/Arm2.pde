//Arm2

//Upper Arm
float l0_2 = 125/2.5; 
float a0_2 = 0.3; //Shoulder joint

//Lower Arm
float l1_2 = 100/2.5;
float a1_2 = 0.3; //Elbow joint

//Hand
float l2_2 = 50/2.5;
float a2_2 = 0.3; //Wrist joint

Vec2 start_l1_2,start_l2_2,endPoint_2;


void solve_2(){
Vec2 goal = new Vec2(mouseX -20, mouseY -20);
  
  Vec2 startToGoal, startToEndEffector;
  float dotProd, angleDiff;
  
  //Update wrist joint
  startToGoal = goal.minus(start_l2_2);
  startToEndEffector = endPoint_2.minus(start_l2_2);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  if (cross(startToGoal,startToEndEffector) < 0)
    a2_2 += angleDiff;
  else
    a2_2 -= angleDiff;
    
  if(a2_2 - a1_2 > PI/2){
    a2_2 = a1_2 + PI/2;
  }
  else if(a2_2 - a1_2 < -PI/2){
    a2_2 = a1_2 - PI/2;
  }

  fk_2(); //Update link positions with fk (e.g. end effector changed)
  
  //Update elbow joint
  startToGoal = goal.minus(start_l1_2);
  startToEndEffector = endPoint_2.minus(start_l1_2);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  if (cross(startToGoal,startToEndEffector) < 0)
    a1_2 += angleDiff;
  else
    a1_2 -= angleDiff;
  fk_2(); //Update link positions with fk (e.g. end effector changed)
  
  
  //Update shoulder joint
  startToGoal = goal.minus(centralRoot);
  if (startToGoal.length() < .0001) return;
  startToEndEffector = endPoint_2.minus(centralRoot);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  if (cross(startToGoal,startToEndEffector) < 0)
    a0_2 += angleDiff;
  else
    a0_2 -= angleDiff;
  /*TODO: Shoulder joint limits here*/    
  if(a0_2 > PI/3){
    a0_2 = PI/3;
  }
  else if(a0_2 < PI/6){
    a0_2 = PI/6;
  }
  fk_2(); //Update link positions with fk (e.g. end effector changed)
}

void fk_2(){
  start_l1_2 = new Vec2(cos(a0_2)*l0_2,sin(a0_2)*l0_2).plus(centralRoot);
  start_l2_2 = new Vec2(cos(a0_2+a1_2)*l1_2,sin(a0_2+a1_2)*l1_2).plus(start_l1_2);
  endPoint_2 = new Vec2(cos(a0_2+a1_2+a2_2)*l2_2,sin(a0_2+a1_2+a2_2)*l2_2).plus(start_l2_2);
  left = new Box(1, endPoint_2.x, endPoint_2.y, armW, l2);
  println("Left: " +BoxBox(ledge,left));
}
