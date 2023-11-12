//-----------------
// Vector Library
//-----------------

//Vector Library
//CSCI 5611 Vector 2 Library [Example]
// Stephen J. Guy <sjguy@umn.edu>

public class Vec2 {
  public float x, y;
  
  public Vec2(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public String toString(){
    return "(" + x+ "," + y +")";
  }
  
  public float length(){
    return sqrt(x*x+y*y);
  }
  
  public Vec2 plus(Vec2 rhs){
    return new Vec2(x+rhs.x, y+rhs.y);
  }
  
  public void add(Vec2 rhs){
    x += rhs.x;
    y += rhs.y;
  }
  
  public Vec2 minus(Vec2 rhs){
    return new Vec2(x-rhs.x, y-rhs.y);
  }
  
  public void subtract(Vec2 rhs){
    x -= rhs.x;
    y -= rhs.y;
  }
  
  public Vec2 times(float rhs){
    return new Vec2(x*rhs, y*rhs);
  }
  
  public void mul(float rhs){
    x *= rhs;
    y *= rhs;
  }
  
  public void clampToLength(float maxL){
    float magnitude = sqrt(x*x + y*y);
    if (magnitude > maxL){
      x *= maxL/magnitude;
      y *= maxL/magnitude;
    }
  }
  
  public void setToLength(float newL){
    float magnitude = sqrt(x*x + y*y);
    x *= newL/magnitude;
    y *= newL/magnitude;
  }
  
  public void normalize(){
    float magnitude = sqrt(x*x + y*y);
    x /= magnitude;
    y /= magnitude;
  }
  
  public Vec2 normalized(){
    float magnitude = sqrt(x*x + y*y);
    return new Vec2(x/magnitude, y/magnitude);
  }
  
  public float distanceTo(Vec2 rhs){
    float dx = rhs.x - x;
    float dy = rhs.y - y;
    return sqrt(dx*dx + dy*dy);
  }
}

Vec2 interpolate(Vec2 a, Vec2 b, float t){
  return a.plus((b.minus(a)).times(t));
}

float interpolate(float a, float b, float t){
  return a + ((b-a)*t);
}

float dot(Vec2 a, Vec2 b){
  return a.x*b.x + a.y*b.y;
}

float cross(Vec2 a, Vec2 b){
  return a.x*b.y - a.y*b.x;
}


Vec2 projAB(Vec2 a, Vec2 b){
  return b.times(a.x*b.x + a.y*b.y);
}

float clamp(float f, float min, float max){
  if (f < min) return min;
  if (f > max) return max;
  return f;
}
public class Vec3 {
  public float x, y, z;

  public Vec3(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  public String toString() {
    return "(" + x + "," + y + "," + z + ")";
  }

  public float length() {
    return sqrt(x * x + y * y + z * z);
  }

  public float lengthSqr() {
    return x * x + y * y + z * z;
  }

  public Vec3 plus(Vec3 rhs) {
    return new Vec3(x + rhs.x, y + rhs.y, z + rhs.z);
  }

  public void add(Vec3 rhs) {
    x += rhs.x;
    y += rhs.y;
    z += rhs.z;
  }

  public Vec3 minus(Vec3 rhs) {
    return new Vec3(x - rhs.x, y - rhs.y, z - rhs.z);
  }

  public void subtract(Vec3 rhs) {
    x -= rhs.x;
    y -= rhs.y;
    z -= rhs.z;
  }

  public Vec3 times(float rhs) {
    return new Vec3(x * rhs, y * rhs, z * rhs);
  }

  public void mul(float rhs) {
    x *= rhs;
    y *= rhs;
    z *= rhs;
  }

  public void clampToLength(float maxL) {
    float magnitude = sqrt(x * x + y * y + z * z);
    if (magnitude > maxL) {
      x *= maxL / magnitude;
      y *= maxL / magnitude;
      z *= maxL / magnitude;
    }
  }

  public void setToLength(float newL) {
    float magnitude = sqrt(x * x + y * y + z * z);
    x *= newL / magnitude;
    y *= newL / magnitude;
    z *= newL / magnitude;
  }

  public void normalize() {
    float magnitude = sqrt(x * x + y * y + z * z);
    x /= magnitude;
    y /= magnitude;
    z /= magnitude;
  }

  public Vec3 normalized() {
    float magnitude = sqrt(x * x + y * y + z * z);
    return new Vec3(x / magnitude, y / magnitude, z / magnitude);
  }

  public float distanceTo(Vec3 rhs) {
    float dx = rhs.x - x;
    float dy = rhs.y - y;
    float dz = rhs.z - z;
    return sqrt(dx * dx + dy * dy + dz * dz);
  }
}

Vec3 interpolate(Vec3 a, Vec3 b, float t) {
  return a.plus((b.minus(a)).times(t));
}


float dot(Vec3 a, Vec3 b) {
  return a.x * b.x + a.y * b.y + a.z * b.z;
}

Vec3 cross(Vec3 a, Vec3 b) {
  Vec3 crossVec = new Vec3(0,0,0);
  crossVec.x = a.y * b.z - a.z * b.y;
  crossVec.y = a.z * b.x - a.x * b.z;
  crossVec.z = a.z * b.y - a.y * b.x;
  return crossVec;
}

Vec3 projAB(Vec3 a, Vec3 b) {
  return b.times(a.x * b.x + a.y * b.y + a.z * b.z);
}

Vec3 perpendicular(Vec3 a) {
  return new Vec3(-a.y, a.x, a.z);
}
