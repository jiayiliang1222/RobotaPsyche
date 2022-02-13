//Attract the Predators
Frog a;
Frog b;
//Predator
ArrayList<Tadpole> tadpoles1 = new ArrayList<Tadpole>();
ArrayList<Tadpole> tadpoles2 = new ArrayList<Tadpole>();
//Food
Algae j;

void setup() {
  size(1600,800);

  for (int i = 0; i < 100; i++) {
    tadpoles1.add( new Tadpole(random(10,25),1));
  }
    for (int i = 0; i < 100; i++) {
    tadpoles2.add( new Tadpole(random(10,25),0));
  }
  a = new Frog (random(width),random(height),0.03,0.03);
  b = new Frog (random(width),random(height),-0.035,0.05);
  
  j = new Algae();
}

void draw() {
  background(154, 236, 255);

 for (int i = 0; i < tadpoles1.size(); i++) {
   PVector aForce = a.attract(tadpoles1.get(i));
   PVector aforce = j.attract(tadpoles1.get(i));
   tadpoles1.get(i).applyForce(aForce);
   tadpoles1.get(i).applyForce(aforce);
   tadpoles1.get(i).update();
   tadpoles1.get(i).display();
   
       for (int j = 0; j < tadpoles2.size(); j++) {
      if (i != j) {
        PVector force = tadpoles2.get(i).attract(tadpoles1.get(i));
        tadpoles1.get(i).applyForce(force);
      }
      }
  }
  
   for (int i = 0; i < tadpoles2.size(); i++) {
   PVector bForce = b.attract(tadpoles2.get(i));
   PVector bforce = j.attract(tadpoles2.get(i));
   tadpoles2.get(i).applyForce(bforce);
   tadpoles2.get(i).applyForce(bForce);
   tadpoles2.get(i).update();
   tadpoles2.get(i).display();
      for (int j = 0; j < tadpoles1.size(); j++) {
      if (i != j) {
        PVector force = tadpoles1.get(i).attract(tadpoles2.get(i));
        tadpoles2.get(i).applyForce(force);
      }
    }
  }
  
  a.display();
  a.update();
  a.checkEdges();
  
  b.display();
  b.update();
  b.checkEdges();
  
  j.display();
}

class Algae{
float mass;
  PVector location;
  float G;

  Algae() {
    location = new PVector(width/2, height/2);
    mass = 100;
    G = 0.4;
  }

//Algae(food) attracts the tadpoles
  PVector attract(Tadpole m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  void display() {
     noStroke();
    fill(85,180,180);
    ellipse(location.x, location.y, mass*2, mass*2);
  }  
  
 
  
}



class Frog{
 PVector velocity;
 PVector acceleration;
 PVector location;
 float mass;
 float G;
  
 Frog(float x,float y,float aX, float aY){
  mass=50;
  velocity = new PVector(0,0);
  location = new PVector (x,y); 
  acceleration = new PVector (aX,aY);
  G = 0.4;
 }
 
 //Frog attracts the tadpoles as well
  PVector attract(Tadpole m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();

    distance = constrain(distance,5.0, 15.0);

    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
 void display() {
    noStroke();
    fill(0,150,150);
    pushMatrix();
    translate(location.x,location.y);
    rotate(acceleration.heading());
    ellipse(0,0,mass*3,mass*2);
    fill(0);
    ellipse(60,10,20,20);
    ellipse(60,-10,20,20);
    popMatrix();
  }
   
   
 //Frog moves and accelerations for a while and then stops repeatedly
  void update(){
   velocity.add(acceleration);
   location.add(velocity);
    if (abs(velocity.x)>3){
    velocity.mult(0);
   }
  }
 void checkEdges(){
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
      acceleration.x *= -1;
    } else if (location.x < 0) {
      location.x = 0;
      velocity.x *= -1;
      acceleration.x *= -1;
    }

    if (location.y > height) {
      location.y = height;
      velocity.y *= -1;
      acceleration.y *= -1;
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
      acceleration.y *= -1;
    }
  }
}




class Tadpole{

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float mass;
  float G = 0.4;
  int Color;
  float hunger;

  Tadpole(float _mass_, int myColor) {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
    acceleration = new PVector(0, 0);
    mass = _mass_;
    Color = myColor;
    hunger = random(0,1.5);
  }
  
  void applyForce(PVector force){
   PVector f = PVector.div(force,mass);
   acceleration.add(f);
    
  }

//Tadpoles repel other tadpoles with different color
   PVector attract(Tadpole m) {

    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 65.0,85.0);
    force.normalize();

    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);

  if (Color != m.Color){
  force.mult (-0.1);
  }
   return force;
  }

//Hunger makes the acceleration speed varies
  void update() {
    acceleration.mult(hunger);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

    void display() {
   noStroke();
     if (Color == 1){
     fill(0);
     }   else{ 
     fill (150);
     }
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    triangle(0, 5, 0, -5, 20, 0);
    popMatrix();
  }
 
}
