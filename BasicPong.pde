/*
@Name: Matthew Sun-Ren
@Project: A simple Pong game. 
@Date: July 15, 2018
*/

//NOTE: For the music to play is necessary to import the Sound Library. 
//This can be achieved by following these steps: 
//Sketch > Import Library > Add Library > Search> Sound> Install


import processing.sound.*; // import Processing's Sound Library

SoundFile startMusic; // Name an mp3 file as startMusic

// Inititialize floats
float x, y, sX, sY;
float ballSize = 50;
float rectSize = 250;


void setup() { // begin global setup
  size(800, 800);// size of the screen
  background(0); // bacground colour is black

  startMusic = new SoundFile(this, "DarliFra.mp3"); // insert MP3 file 
  startMusic.loop(); // loops the MP3 file 
  startMusic.amp(0.2); // sets the volume of the MP3 file to be 20% of the normal volume

  textAlign(CENTER); // aligns the text to the center
  textSize(25); // text size is 25
  text("CLICK AND HOLD ANYWHERE TO PLAY GAME", width/2, height/2); // holds the parameters for the text and its position

  start(); //Intitialize start function
}

void start() { // begin start function
  
  fill(255); //set fill colour to white
 
  // sets the x and y values to a random value between 0 and 800 
  x = random(0, 800);
  y = random(0, 800);
  // sets the sX and sY values to a random value between 3 and 5. sX and sY determine how fast the ball will go
  sX = random(3, 5);
  sY = random(3, 5);
} //end start function

void reset() { // begin reset function
  startMusic.loop(); // start the music again once reset is called
  startMusic.amp(0.2);// set the volume of the music to 20% of its normal volume
  
  //See the start function for comments regarding the following:
  fill(255);
  x = random(0, 800);
  y = random(0, 800);
  sX = random(3, 5);
  sY = random(3, 5);
} // end reset function

void draw() { //begin draw function



  if (mousePressed) { // if the mouse is pressed and held then
  
    background(0); // set the background to black


    ellipse(x, y, ballSize, ballSize); //draw a circle aka the Ball

    rect(0, 0, 20, height); // draw left rectangle aka the Bouncy Barrier
    rect(width-30, mouseY-rectSize/2, 10, rectSize); // draw the position of the controlled rectangle aka What-the-player-controls rectangle

    //indicates how many pixels the Ball moves by
    x += sX; 
    y += sY;

    // if ball hits What-the-player-controls, invert x direction
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {
      fill(random(0,255), random(0, 255), 255);
      sX = sX * -1;
    } 

    // if ball hits Bouncy Barrier, change direction of x
    if (x < 25) {
      fill(255, random(0, 255), random(0, 255));
      sX *= -1.1;
      sY *= 1.1;
      x += sX;
    }


    // if ball hits the top or the bottom, change direction of y 
    if ( y > height || y < 0 ) {
      fill(random(0, 255), 255, random(0, 255));
      sY *= -1;
    }

    // if ball is not hit by the What-the-player-controls, then the game is over
    if (x > width || x < 0) {
      fill(255, 0, 0);
      text("GAME OVER", width/2, height/2);
      startMusic.stop();
    }
  }
}// end draw function

void keyPressed() { // start keyPressed function

  reset(); // call the reset function
}// end keyPressed function
