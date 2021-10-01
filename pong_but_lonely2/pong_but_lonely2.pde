float ballX = 20;
float ballR;
float ballL;
float ballY = 20;
float dX = random(2, 4);
float dY = random(2, 4);
float paddleX;
float paddleX2;
float paddleY = 10;
float paddleH = 50;
float score = 0;
PFont f;
boolean start = false;
boolean paddle = true;
void setup() {
  size(750, 750);
  paddleX = width - 15;
  paddleX2 = 15;
  f = createFont("Arial",16,true);
  noLoop();
}

void draw() {
  background(255, 255, 255);
  textFont(f,16);
  fill(0);
  text("Score:" + "" +score, 100, 25);
  ellipse(ballX, ballY, 20, 20);
  fill(255,255,255);
  
  if (paddle == true) {
    rect(paddleX, paddleY, 10, paddleH);
  } else if (paddle == false) {
    rect(paddleX2, paddleY, 10, paddleH);
  }

  if ((ballR > paddleX) && (ballY >= paddleY) && (ballY <= paddleY + paddleH) && (paddle == true)) {
    dX = random(-4, -8);
    dY = random(-3, 3);
    score = score + dX*-25;
    paddle = false;
    if (dY < 0.0) {
      score = score + dY*-25;
    } else if (dY > 0.0) {
      score = score + dY*25;
    } else if (dY == 0) {
      score = score + 50;
    }
  }
  
  if ((ballL < paddleX2) && (ballY >= paddleY) && (ballY <= paddleY + paddleH) && (paddle == false)) {
    dX = random(4, 8);
    dY = random(-3, 3);
    score = score + dX*25;
    paddle = true;
    if (dY < 0.0) {
      score = score + dY*-25;
    } else if (dY > 0.0) {
      score = score + dY*25;
    } else if (dY == 0) {
      score = score + 50;
    }
  }

  if (ballY > height) {
    dY = -dY;
  }

  if (ballY < 0) {
    dY = -dY;
  }
  
  if (paddleY > height) {
    paddleY = height - 50;
  }
  
  if (paddleY < 0) {
    paddleY = 25;
  }
  
  if (start == false) {
    fill(0);
    text("Press UP or DOWN to start", 200, 359);
    fill(255,255,255);
  }
  
  if (start == false) {
    ballX = 20;
    ballY = 20;
    dX = 2;
    dY = 2;
  } else if (start == true) {
    ballX = ballX + dX;
    ballY = ballY + dY;
  }
  ballR = ballX + 10;
  ballL = ballX - 15;
  if (ballX > width || ballX < 0) {
    println("Your score was: " +score);
    start = false;
    paddle = true;
    redraw();
  }
}

// based on code from http://processing.org/reference/keyCode.html
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      paddleY = paddleY - 25;
      loop();
      start = true;
    } else if (keyCode == DOWN) {
      paddleY = paddleY + 25;
      loop();
      start = true;
    }
  }
}
