class Spring { 
  
  boolean useMouse = true;
  // Screen values 
  float xpos, ypos;
  float tempxpos, tempypos; 
  int size = 20; 
  boolean over = false; 
  boolean move = false; 

  // Spring simulation constants 
  float mass;       // Mass 
  float k = 0.2;    // Spring constant 
  float damp;       // Damping 
  float rest_posx;  // Rest position X 
  float rest_posy;  // Rest position Y 

  // Spring simulation variables 
  //float pos = 20.0; // Position 
  float velx = 0.0;   // X Velocity 
  float vely = 0.0;   // Y Velocity 
  float accel = 0;    // Acceleration 
  float force = 0;    // Force 

  Spring[] friends;
  int me;
  
  char letter;

  // Constructor
  Spring(float x, float y, int s, float d, float m, 
  float k_in, Spring[] others, int id, char c) { 
    xpos = tempxpos = x; 
    ypos = tempypos = y;
    rest_posx = x;
    rest_posy = y;
    size = s;
    damp = d; 
    mass = m; 
    k = k_in;
    friends = others;
    me = id;
    letter = c;
  } 

  void update() { 
    if (move) { 
      if(useMouse){
        rest_posy = mouseY; 
        rest_posx = mouseX;
      }else{
        rest_posy = ypos; 
        rest_posx = xpos;
        while(moveLeft(rest_posx, rest_posy) && rest_posx > 15){
          rest_posx -= 14;
        }
      }
      //rest_posy = height/2; 
      //rest_posx = width/2;
    } 

    force = -k * (tempypos - rest_posy);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    vely = damp * (vely + accel);         // Set the velocity 
    tempypos = tempypos + vely;           // Updated position 

    force = -k * (tempxpos - rest_posx);  // f=-ky 
    accel = force / mass;                 // Set the acceleration, f=ma == a=f/m 
    velx = damp * (velx + accel);         // Set the velocity 
    tempxpos = tempxpos + velx;           // Updated position 


    if ((ifThreshold())) { 
      over = true;
      move = true;
    } else { 
      over = false;
      released();
    }
  } 
  
  boolean ifThreshold(){
    if (rawDepth[int(xpos/2)+int(ypos/2)*kinect2.depthWidth] >= minDepth && rawDepth[int(xpos/2)+int(ypos/2)*kinect2.depthWidth] <= maxDepth) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean moveLeft(float x, float y){
    if (rawDepth[int(x/2)+int(y/2)*kinect2.depthWidth] >= minDepth && rawDepth[int(x/2)+int(y/2)*kinect2.depthWidth] <= maxDepth) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    if(move){
      fill(127);
    }else{
      fill(255);
    }
    text(letter, tempxpos, tempypos);
  } 

  void released() { 
    move = false; 
    rest_posx = xpos;
    rest_posy = ypos;
  }
} 