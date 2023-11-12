  float movementX = 0;
  float movementY = 0;
  
void keyReleased(){
  if(key == 'j'){
    movementX = 0;
  }
  if(key == 'l'){
    movementX = 0;
  }
  if(key == 'i'){
    movementY = 0;
  }
  if(key == 'k'){
    movementY = 0;
  }

  camera.HandleKeyReleased();
}

void keyPressed(){

  if(key == 'l'){
    movementX = 1;
  }
  if(key == 'j'){
    movementX = -1;
  }
  if(key == 'i'){
    movementY = -1;
  }
  if(key == 'k'){
    movementY = 1;
  }
  camera.HandleKeyPressed();
  
}
