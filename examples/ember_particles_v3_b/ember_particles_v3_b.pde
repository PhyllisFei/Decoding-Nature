EmberParticles emberParticles;

void setup () {
  size(800, 800);
  background(0);
  colorMode(HSB,360,100,100,100);
  
  emberParticles = new EmberParticles();
}

void draw () {
  noStroke();
  fill(0,30);
  rect(0,0,width,height);  
  
  emberParticles.run1();
}
class Embers {  //a class called Embers
  //GLOBAL VARIABLES
  float theta1, theta2;  //a variable for the cycle
  float theta1Rate, theta2Rate;  //a variable for the cycle rate
  float x, xRun, xAmp, xAmpRate; //a variable for the increment that the amplitube increase by
  float yRise, yRiseRate;  //a variable for the speed of the y movement
  float hue;  //a variable for the initial value of the hue
  float size;  //a variable for the size of the particle

    //CONSTRUCTOR
  Embers (float _x, float _yRiseRate, float _theta1Rate, float _theta2Rate) {  //allows me to change values outside the class
    x = _x;  //a different variable name for for some of the variables in the class...
    yRise = height;
    xAmpRate = 0.7;
    yRiseRate = _yRiseRate;  //so I can change the values in void setup
    theta1Rate = _theta1Rate;
    theta2Rate = _theta2Rate;
    hue = 0;
    size = 0;
  }

  void position1 () {
  }

  void position2 () {
    translate(width/2, height/2);
    rotate(PI/8);
    translate(-width/2, -height/2);
  }

  void position3 () {
    rotate(PI/8);
  }

  void repitition () {  //a function that loops the embers rising motion
    if (yRise < 0) {  //values below reset to the initial values if yEmber is less than zero
      xAmp = 0;
      yRise = height;
      hue = 0;
    }
    //The condition below gives the group of particles that bloated shape
    if (yRise < height/2) {
      xAmpRate = -0.5;  //the amplitude increment becomes negative
    } else {
      xAmpRate = 0.5; //if it doesn't meet the condition it becomes positive again
    }
  }

  void emberMovement () {
    theta2 += PI/theta2Rate;  //the second cycle rate
    theta1 += PI/theta1Rate;  //the first cycle rate
    xAmp += xAmpRate;  //gradually increases the amplitude of an oscillation as the particles rise
    xRun = (xAmp/4)*cos(theta1) + (xAmp/2)*sin(theta2); //the oscillating movement of the particle, which consists of two different oscillations...
    //that are added together for a less consistent looking motion

    yRise += yRiseRate;  //an equation to make embers rise

    hue = map(yRise, 0, height, 360, 0);

        //use one of the emberSize equations below (they are slightly different)
        //the equation using constrain has a minimum value of 1, and the other has a minimum value of 0
    size = constrain((xAmp/20)*cos(theta1/2), 1, width); //an equation that causes the particles to change size (constrain prevents it from becomes negative)
    //size = abs((xAmp/20)*cos(theta1/2)); //an equation that causes the particles to change size (the absolute value function makes the negative values positive)
  }

  void display () {  //a function for the shape
    strokeWeight(size);  //size of the shape
    stroke(hue/1.3, 75, 100);  //color of the shape 
    point(xRun+x, yRise);
  }
}

//----------------------------------------------------------------------------------
class EmberParticles {
  Embers [] embers1 = new Embers [1000];
  Embers [] embers2 = new Embers [1000];
  Embers [] embers3 = new Embers [1000];

  EmberParticles () {
    for (int n = 0; n < embers1.length; n++) {
      embers1 [n] = new Embers(width/2, random(-3, -0.5), random(-60, -50), random(-110, -90));
    }
    for (int n = 0; n < embers2.length; n++) {
      embers2 [n] = new Embers(width/2, random(-3, -0.5), random(-60, -50), random(-110, -90));
    }
    for (int n = 0; n < embers3.length; n++) {
      embers3 [n] = new Embers(width/8, random(-3, -0.5), random(-60, -50), random(-110, -90));
    }
  }

  void run1 () {
    for (int n = 0; n < embers1.length; n++) {
      pushMatrix();
      embers1[n].repitition();
      embers1[n].emberMovement();
      embers1[n].position1();
      embers1[n].display();
      popMatrix();
    }
  }

  void run2 () {
    for (int n = 0; n < embers2.length; n++) {
      embers2[n].repitition();
      embers2[n].emberMovement();
      embers2[n].position2();
      embers2[n].display();
    }
  }

  void run3 () {
    translate(width/2, height/2);
    for (int n = 0; n < embers3.length; n++) {
      embers3[n].repitition();
      embers3[n].emberMovement();
      embers3[n].position3();
      embers3[n].display();
    }
  }
}


