//box[] 

public class Box {
    public float x, y, w, h;
    public int ID;
    public Box(int ID,float x, float y, float w, float h){
      this.ID = ID;
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }
}    public boolean BoxBox(Box b1, Box b2){
       boolean hit = false;
      if ((abs(b1.x - b2.x) > ((b1.w + b2.w)/2)) || (abs(b1.y - b2.y) > ((b1.h + b2.h)/2))){
        hit = false;
        return hit;
    }
    if (b1.ID != b2.ID){
        hit = true;
    }
      return hit;
    }
    
    
