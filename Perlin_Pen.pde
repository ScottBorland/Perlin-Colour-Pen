Spot spot;

//int: number of octaves to be used by the noise
int lod = 2;
//float: falloff factor for each octave
float falloff = 1;

ArrayList<Spot> spots = new ArrayList<Spot>();

float xr = 0.0;
float xg = 100.0;
float xb = 2000.0;

float counter = 0;

float speed = 0.04;

void setup(){
  background(0);
  size(1920, 1080);
  frameRate(30);
}

void draw (){
  for (Spot s : spots) {
  s.update();
  s.display();
  }
  
  xr += speed;
  xg += speed;
  xb += speed;
  
  //limits drawing speed
  counter += 1;
  
  if(lod < 0){
    lod = 0;
  }
  if(falloff < 0){
    falloff = 0;
  }
  if(speed < 0){
    speed = 0;
  }
  //text
  textSize(32);
  text("Lod: ", width - 200,40);
  
  rect(width - 130, 16, lod*30,23 );
  
  text("Falloff:", width -250, 80);
  
  rect(width - 130, 56, falloff * 20, 23);
  
  text("Speed:", width -250, 120);
  
  rect(width - 130, 96, speed * 150, 23);
}

void keyPressed(){
  if(keyCode == RIGHT){
     lod += 1; 
  } else if(keyCode == LEFT){
    lod -= 1;
  } else if(keyCode == UP){
     falloff += 0.25; 
  } else if(keyCode == DOWN){
     falloff -= 0.25; 
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  speed += e * 0.0025;
}


void mouseDragged(){
  if(counter % 2 == 0){
  spots.add(new Spot());
  counter += 1;
  }
}

/*void mouseClicked(){
  spots.add(new Spot());
}*/


class Spot{
  PVector location;
  float strokeChange;
  float currentStroke;
  
  color c;
  
  float r;
  float g;
  float b;
  
  float size;
  
  //comment this out if you want all spots to be the same colour
  float iR = (spots.size() / 15.00);
  float iG = (spots.size() / 15.00);
  float iB = (spots.size() / 15.00);
  
  int lodx = lod;
  float falloffx = falloff;
  
  boolean display;
  
  Spot(){
    location = new PVector(mouseX, mouseY);
    size = 16;
  }
  
  void update(){
    noiseDetail(lodx, falloffx);
    
    //use these for all spots to have the same colour
    //r = map(noise(xr, 1), 0, 1, 0, 255);
    //g = map(noise(xg, 1), 0, 1, 0, 255);
    //b = map(noise(xb, 1), 0, 1, 0, 255);
    
    float rx = xr + iR;
    float gx = xg + iG;
    float bx = xb + iB;
    r = map(noise(rx, 1), 0, 1, 0, 255);
    g = map(noise(gx, 1), 0, 1, 0, 255);
    b = map(noise(bx, 1), 0, 1, 0, 255);
    
    
  }
  
  void display(){
    stroke(0);
    color c = color(r, g, b);
    fill(c);
    ellipse(location.x, location.y, 16, 16);
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
