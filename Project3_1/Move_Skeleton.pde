  float movementX = 0;
  float movementY = 0;
  
void keyReleased(){
  if(key == 'd'){
    movementX = 0;
  }
  if(key == 'a'){
    movementX = 0;
  }
  if(key == 'w'){
    movementY = 0;
  }
  if(key == 's'){
    movementY = 0;
  }

}

void keyPressed(){

  if(key == 'd'){
      movementX = 1;
  }
  if(key == 'a'){
      movementX = -1;
  }
  if(key == 'w'){
    movementY = -1;
  }
  if(key == 's'){
    movementY = 1;
  }
  
  //movementX = movementX/abs(movementX);
  //movementY = movementY/abs(movementY);
  
}
