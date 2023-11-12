//Arm1

//Upper Arm
float l0 = 125; 
float a0 = 0.3; //Shoulder joint

//Lower Arm
float l1 = 100;
float a1 = 0.3; //Elbow joint

//Hand
float l2 = 50;
float a2 = 0.3; //Wrist joint

Vec2 start_R,start_l1,start_l2,endPoint;

void solve(){
  Vec2 goal = new Vec2(mouseX -20, mouseY -20);
  
  Vec2 startToGoal, startToEndEffector;
  float dotProd, angleDiff;
  
  //Update wrist joint
  startToGoal = goal.minus(start_l2);
  startToEndEffector = endPoint.minus(start_l2);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  if (cross(startToGoal,startToEndEffector) < 0)
    a2 += angleDiff;
  else
    a2 -= angleDiff;
  if(a2 - a1 > PI/2){
    a2 = a1 + PI/2;
  }
  else if(a2 - a1 < -PI/2){
    a2 = a1 - PI/2;
  }
  fk(); //Update link positions with fk (e.g. end effector changed)
  
  
  //Update elbow joint
  startToGoal = goal.minus(start_l1);
  startToEndEffector = endPoint.minus(start_l1);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  if (cross(startToGoal,startToEndEffector) < 0)
    a1 += angleDiff;
  else
    a1 -= angleDiff;
  fk(); //Update link positions with fk (e.g. end effector changed)
  
  
  //Update shoulder joint
  startToGoal = goal.minus(centralRoot);
  if (startToGoal.length() < .0001) return;
  startToEndEffector = endPoint.minus(centralRoot);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  if (cross(startToGoal,startToEndEffector) < 0)
    a0 += angleDiff;
  else
    a0 -= angleDiff;
   
  if(a0 > -7*PI/6){
      a0 = -7*PI/6;
   }
  else if(a0 < -4*PI/3){
     a0 = -4*PI/3;
   }

  fk(); //Update link positions with fk (e.g. end effector changed)
  
  startToGoal = goal.minus(centralRoot);
  if (startToGoal.length() < .0001) return;
  startToEndEffector = endPoint.minus(centralRoot);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
  if (cross(startToGoal,startToEndEffector) < 0)
    aR += angleDiff;
  else
    aR -= angleDiff;
   

  fk(); //Update link positions with fk (e.g. end effector changed)
 
}

void fk(){
  start_l1 = new Vec2(cos(a0)*l0,sin(a0)*l0).plus(centralRoot);
  start_l2 = new Vec2(cos(a0+a1)*l1,sin(a0+a1)*l1).plus(start_l1);
  endPoint = new Vec2(cos(a0+a1+a2)*l2,sin(a0+a1+a2)*l2).plus(start_l2);
  //right = new Box(1, endPoint.x, endPoint.y, armW, l2);
  //println("Right: " + BoxBox(ledge,right));
}
