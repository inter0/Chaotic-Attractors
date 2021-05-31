import peasy.*;

//chatoic attractors
//https://www.dynamicmath.xyz/strange-attractors/

//TODO: create seperate file with all the attractor functions

//coordinates
//float x = 1;
//float y = 0;
//float z = 0;

//changes
double dx;
double dy;
double dz;

float c = 0;
int high = 5;

//timestep
double dt = 0.005;

float scalingfactor = 5;

PeasyCam cam;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
 size(1200, 800, P3D);
 colorMode(HSB);
 cam = new PeasyCam(this, width/2, height/2, 0, 50);
 
 for(int i = 0; i < 2000; i++){
   points.add(new PVector(random(high), random(high), random(high)));
 }
}

void draw(){
  background(0);
  
  lorentz();
  
  //points.add(new PVector(x, y, z));
  
  //translate(0, 0, -80);
  translate(width/2, height/2);
  scale(scalingfactor);
  //noFill();
  
  
  //beginShape();
  for(PVector v : points){
    stroke(c, 255, 255);
    point(v.x, v.y, v.z);
  }
  c = (c + 0.1) % 255;
  //endShape();
}

void lorentz(){
  float sigma = 10;
  float beta = 8/3;
  float rho = 28;
 
   for(PVector v : points){ 
    dx = (sigma*(v.y - v.x))*dt;
    dy = (v.x*(rho - v.z) - v.y)*dt;
    dz = (v.x*v.y - beta*v.z)*dt;
  
    update(v);
   }
  
}

void dadras(){
 float a = 3;
 float b = 2.7;
 float c = 1.7;
 float d = 2;
 float e = 9;
 
 for(PVector v : points){
   dx = (v.y - a*v.x + b*v.y*v.z)*dt;
   dy = (c*v.y - v.x*v.z + v.z)*dt;
   dz = (d*v.x*v.y - e*v.z)*dt;
   
   update(v);
 }

}

/*
void chen(){
  //at some point i get only NaN's
 float alpha = 5;
 float beta = -10;
 float delta = -0.38;
 
 dx = (alpha*x - y*z)*dt;
 dy = (beta*y + x*z)*dt;
 dz = (delta*z + x*(y/3))*dt;
 
 update();
}
*/

void halvorsen(){
 float a = 1.4;
 
 for(PVector v : points){
   dx = (-a*v.x - 4*v.y - 4*v.z - v.y*v.y)*dt;
   dy = (-a*v.y - 4*v.z - 4*v.x - v.z*v.z)*dt;
   dz = (-a*v.z - 4*v.x - 4*v.y - v.x*v.x)*dt;

   update(v);
 }
}

void update(PVector v){
 v.x += dx;
 v.y += dy;
 v.z += dz;
}
