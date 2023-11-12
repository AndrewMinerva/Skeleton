//Root
Vec2 centralRoot = new Vec2(320+l0/2+10, 120);
Vec2 stableRoot = new Vec2(320, 320);

float lR = 100;
float aR = PI/2;

Vec2 start_R1, start_R2, endPoint_R;

void solve_R(){
  Vec2 goal = new Vec2(mouseX, mouseY);
  
  Vec2 startToGoal, startToEndEffector;
  float dotProd, angleDiff;
  
  
  startToGoal = goal.minus(stableRoot);
  startToEndEffector = endPoint_R.minus(stableRoot);
  dotProd = dot(startToGoal.normalized(),startToEndEffector.normalized());
  dotProd = clamp(dotProd,-1,1);
  angleDiff = acos(dotProd);
    if (cross(startToGoal,startToEndEffector) < 0)
    aR += angleDiff;
  else
    aR -= angleDiff;
  
  if(aR > 5*PI/3){
      aR = 5*PI/3;
   }
  else if(aR < 4*PI/3){
     aR = 4*PI/3;
   }  
  //aR = 3*PI/2;
  
  fk_R();
  
  centralRoot = endPoint_R;
  
  
}

void fk_R(){
  endPoint_R = new Vec2(cos(aR)*lR,sin(aR)*lR).plus(stableRoot);
}
