Human human;
FlowField flowfield;
ArrayList<Wave> waves1;
//ArrayList<Wave> waves2;
ArrayList<Particle> particles;
ArrayList<Sun> suns;

boolean devour;

void setup() {
  size(1280, 800);
  background(0);
  //background(255);
  devour = false;
  
  // ***** add waves *****//
  flowfield = new FlowField(30); //initial: 20

  waves1 = new ArrayList<Wave>();
  for (int i = 0; i < 5000; i++) {
    waves1.add(new Wave(new PVector(random(width), random(650, height)), 
      random(1, 3), random(0.01, 0.05)));
  }

  //waves2 = new ArrayList<Wave>();
  //for (int i = 0; i < 5000; i++) {
  //  waves2.add(new Wave(new PVector(random(width), random(0, 150)), 
  //    random(1, 3), random(0.01, 0.05)));
  //}

  // ***** generate one sun ***** //
  particles = new ArrayList<Particle>();
  for (int i=0; i<1; i++) {
    particles.add(new Particle( -15, height/3, 50));
    //particles.add(new Particle( -15, height/3, 35));
    //particles.add(new Particle( -15, height/3, 25));
    //particles.add(new Particle( -15, height/3, 20));
  }

  // ***** human interaction ***** //
  human = new Human(-15, height/3);
}


void draw() {
  drawbg();

  // ***** draw sun with mouse interaction ***** //
  human.pos.x = mouseX;
  human.pos.y = mouseY;

  // ***** waves ***** //
  flowfield.update();
  //flowfield.display();

  for (Wave w : waves1) {
    w.follow(flowfield);
    w.devour(suns);
    w.run();
  }
  //for (Wave w : waves2) {
  //  w.follow(flowfield);
  //  w.run();
  //}

  // ***** display suns ***** //
  for (Particle p : particles) {
    p.run();
  }
}
