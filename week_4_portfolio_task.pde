float ballX; // X coordinate of the ball
float ballY; // Y coordinate of the ball
float ballWidth; // diameter of the ball
float speedX; // speed of movement in X direction
float speedY; // speed of movement in Y direction
float holeX;
float holeY;
float holeWidth;

void setup() {
  size(600, 600);
  // reset ball parameters, position and size
  ballX = width/2;
  ballY = height/2;
  ballWidth = 60;
  // initialize the speed to random values
  initializeSpeed ();
  initializeHole ();
}
void initializeSpeed() {
  speedX = random(5, 10);
  speedY = random(5, 10);
}
void drawColourCircle(float ballX, float ballY, float ballWidth, color c) {
  fill(c);
  ellipse(ballX, ballY, ballWidth, ballWidth);
}

void draw() {
  background(127);
  // draw the ball
  drawColourCircle(ballX, ballY, ballWidth, color(255, 0, 0)) ;
  moveBall();
  bounceBall();
  drawColourCircle(holeX, holeY, holeWidth, color(0));
  if (checkCollide(ballX, ballY, ballWidth, holeX, holeY, holeWidth)) {
    initializeHole () ;
    initializeSpeed () ;
  }
}

// move the ball

void moveBall() {
  ballX = ballX + speedX;
  ballY = ballY + speedY;
}
// bounce the ball ( if necessary)

void bounceBall() {
  if (ballX + 30 >= width || ballX - 30 <= 0) {
    speedX = speedX * -1;
  }
  if (ballY + 30 >= height || ballY - 30 <= 0) {
    speedY = speedY * -1;
  }
}

void keyPressed() {
  if (key == 'x' || key == 'X') {
    speedX = random(5, 10);
  } else if (key == 'y' || key == 'Y') {
    speedY = random(5, 10);
  }
}

void initializeHole() {
  holeX = random(0, width);
  holeY =  random(0, height);
  holeWidth = random(100, 300);
}

float distance (float x1, float y1, float x2, float y2) {
  float side1 = x1 - x2 ;
  float side2 = y1 - y2 ;
  float distance = sqrt((side1*side1) + (side2*side2));
  return distance;
}

boolean checkCollide(float x1, float y1, float ballWidth, float x2, float y2, float holeWidth) {
  float check = distance( x1, y1, x2, y2);
  if (check<= ballWidth/2 + holeWidth/2) {
    return true;
  } else {
    return false;
  }
}
