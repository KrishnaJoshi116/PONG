
  /* Program Header
 Programmer's Name: Krishna Joshi     
 Name of Program: PONG
 Description: An amazing multiplayer game called PONG. Once the spacebar is pressed, the ball moves around the screen, bouncing off the boundaries. Each player has a paddle that they control by certain keys on the keyboard. 
 They have to try to avoid letting the ball pass their paddle. If it does, the opposite player get's a point. The player to get a score of 5 points first wins. 
 Teacher's Name: Ms. Clayton
 Course Code: ICS201-02
 Date Started: May 10, 2019
 Date Last Updated: June 6, 2019
 */
 
//paddle coordinates
int paddleX1 = 20;  // player 1 paddle X coordinate
int paddleX2 = 1260; // player 2 paddle X coordinate
int paddleY1 = 400;
int paddleY2 = 400;
int paddleSpeed1 = 25;
int paddleSpeed2 = 25;
int paddleWidth = 15;
int paddleHeight = 120;
float ballSpeedX = 0;
float ballSpeedY = 0;
float circleX = 680;  // ball X coordinate
float circleY = 400;  // ball Y coordinate
float circleDiameter = 24; // diameter of the ball
int scoreLeft = 0;         // Score for player 1
int scoreRight = 0;        // score for player 2   

// start button coordinates
int rectStartX1 = 660;
int rectStartY1 = 435;

// Quit button coordinates
int rectStartX2 = 660;
int rectStartY2 = 520;

// Start and Quit button dimensions
int rectStartWidth1 = 150;
int rectStartWidth2 = 150;
int rectStartHeight1 = 75;
int rectStartHeight2 = 75;

String winner; // variable that will later be used to display who won 
String state;  // state is declared as a variable

void setup() {
  size(1280, 800);
  rectMode(CENTER);     
  state = "START";   // game starts at the "START" state

}

// paddle movement//
void keyPressed() { 
  
  if ((key == 'A' || key == 'a') && (paddleY1 - paddleHeight/2 > 10)) //  checks if key 'a' is pressed and the paddle is within boundaries
    paddleY1 = paddleY1 - paddleSpeed1;                  // if above conditions are met the paddle moves up  
 
  if ((key == 'z' || key == 'Z') && (paddleY1 + paddleHeight/2 < 790)) // moves the left paddle if key 'z' is pressed and the paddle is within the boundaries
    paddleY1 = paddleY1 + paddleSpeed1;

  if ((keyCode == UP) && (paddleY2 - paddleHeight/2 > 10)) // moves the right paddle if the UP arrow key is pressed and the paddle is within the boundaries
    paddleY2 = paddleY2 - paddleSpeed2;

  if ((keyCode == DOWN) && (paddleY2 + paddleHeight/2 < 790)) // moves the right paddle if the DOWN arrow key is pressed and the paddle is within the boundaries
    paddleY2 = paddleY2 + paddleSpeed2;
    
if (key == 'N' || key == 'n' && state == "INSTRUCTIONS") // state changes from "INSTRUCTIONS" to "PLAY" when n is pressed
state = "PLAY";

 if (key == ' ' && state == "PLAY" && ballSpeedX == 0 && ballSpeedY == 0){  // the ball starts moving when the space bar is pressed
   ballSpeedX = 8;          // speed of the ball
   ballSpeedY = 8;
}

if (key == 'B' || key == 'b' && state == "PLAY"){
state = "START";

// ball positioned back to the middle for a new game
circleX = 680;                         
circleY = 400;

// paddles re-positioned for a new game 
paddleX1 = 20;
paddleX2 = 1260;
paddleY1 = 400;
paddleY2 = 400;

// score and speeds are reset for a new game  
scoreLeft = 0; 
scoreRight = 0;
ballSpeedX = 0;
ballSpeedY = 0;
}

if (key == 'R' || key == 'r' && state == "GAME OVER"){         // state changes from "GAME OVER" to "PLAY" when r is pressed
state = "PLAY";                                   

// score and speeds are reset for a new game  
scoreLeft = 0;
scoreRight = 0;
ballSpeedX = 0;
ballSpeedY = 0;
paddleX1 = 20;
paddleX2 = 1260;
paddleY1 = 400;
paddleY2 = 400;
}

// the state changes from "GAME OVER" to "START" when 't' is pressed
if (key == 'T' || key == 't' && state == "GAME OVER"){
state = "START";

// ball positioned back to the middle for a new game
circleX = 680;                         
circleY = 400;

// paddles re-positioned for a new game 
paddleX1 = 20;
paddleX2 = 1260;
paddleY1 = 400;
paddleY2 = 400;

// score and speeds are reset for a new game  
scoreLeft = 0; 
scoreRight = 0;
ballSpeedX = 0;
ballSpeedY = 0;
}
}

void mouseClicked(){
  // checks if the play button is clicked, if it's clicked, the state changes to "INSTRUCTIONS"
  if (mouseX > 585 && mouseX < 585 + rectStartWidth1 && mouseY > 395 && mouseY < 395 + rectStartHeight1)    
   state = "INSTRUCTIONS";

 // closes the game if the quit button is clicked
  if (mouseX > 585 && mouseX < 585 + rectStartWidth1 && mouseY > 480 && mouseY < 480 + rectStartHeight2)   // closes the game when the Quit button is pressed
  exit();
}

void draw() {
  background(0);

  if (state == "INSTRUCTIONS") {             // everything under the if statement will run when the state is "INSTRUCTIONS" 
 textSize(100);                              // changes font size 
 fill(156, 103, 250);                        // changes colour

 // inserts text and all the instructions
 text("Instructions", 360, 100);            
 textSize(50);
 text("Player 1", 100, 450);
 text("Player 2", 700, 450);

 fill(65, 198, 201);
 textSize(30);
 text("Move the paddles up and down and try to stop the ball from going past your", 75, 200);
 text("paddle. If the ball goes past your paddle, your opponent gets a point.", 125, 250);
 text("Player 1 and 2 have different key controls. The first player to score 5 points wins.", 45, 300);
 
 textSize(25);
 text("Use the a key to move up", 100, 500);
 text("Use the z key to move down", 100, 550);
 text("Use the UP arrow key to move up", 700, 500);
 text("Use the DOWN arrow key to move down", 700, 550);

textSize(35);
fill(156, 103, 250);
text("Press n to proceed to the game. . . . .", 350, 675); // informs the player of a function of key 'n'
 
}  
  
  if (state == "START") {                            // everything under the if statement will run when the state is "START" 
    background(0);
    fill(65, 198, 201);
    textSize(250);
    text("PONG", 300, 267); 
    textSize(60);
    fill(72, 0, 275);
    rect( rectStartX1, rectStartY1, rectStartWidth1, rectStartHeight1);     // start button
    rect( rectStartX2, rectStartY2, rectStartWidth2, rectStartHeight2);     // Quit button
    fill(255, 75, 75);
    text("By: Krishna Joshi", 425, 675);
    fill(65, 198, 201);
    rect(1200, 300, 50, 200 ); // display of paddles for visual purpose 
    rect(100, 600, 50, 200);
    
    // if the mouse pointer is in the Play button, the text play will turn a green colour and a circle will appear next to it
    if (mouseX > 585 && mouseX < 585 + rectStartWidth1 && mouseY > 395 && mouseY < 395 + rectStartHeight1){ 
    
      textSize(50);
    fill(11, 219, 106);
    text("Play", 610, 450);
    ellipse(525, 435, 25, 25);
    }
    
    // if the mouse pointer isn't in the play button, the text will stay white
    else {
     textSize(50);           
     fill(255);
     text("Play", 610, 450);
    }  

// if the mouse pointer is in the Quit button, the text play will turn a red colour and a circle will appear next to it
if (mouseX > 585 && mouseX < 585 + rectStartWidth1 && mouseY > 480 && mouseY < 480 + rectStartHeight2)  { 
    fill(224, 32, 38);
    text("Quit", 605, 535);       
    ellipse(525, 525, 25, 25);
  }
 
  // if the mouse pointer isn't in the quit button, the text will stay white
  else {                    
    textSize(50);
    fill(255);
    text("Quit", 605, 535);
    
}
  }

    if (state == "PLAY") {       //everything under the if statement will run when the state is "PLAY" 
    //draw both paddles
    fill(46, 211, 255);
    rect(paddleX2, paddleY2, paddleWidth, paddleHeight);
    rect(paddleX1, paddleY1, paddleWidth, paddleHeight);
    
    // draw boundaries
    stroke(159, 120, 252);
    line(680, 0, 680, 800);
    strokeWeight(10);
    line(0, 800, 1280, 800);
    line(0, 0, 1280, 0);
    noStroke();
    
    // draw ball
    fill(280, 4, 48);
    ellipse(circleX, circleY, circleDiameter, circleDiameter);
    
    //display instructions to click the space bar if the speeds of the ball are 0
    if (ballSpeedX == 0 && ballSpeedY == 0){
    textSize(40);
    text("Press the Space Bar to Start...", 400, 520);
    text("Press key b to go back to the title menu at any time", 175, 600); //inform user about a fuction to go back to the title menu
    }
 
 //ball movement according to the set speed
   circleX = circleX + ballSpeedX;
   circleY = circleY + ballSpeedY;
   
   // if the ball goes past this left boundary, it will go back to the middle
    if (circleX < 13) {         
      circleX = 680;
      circleY = 400;
      scoreRight += 1;               // player 2 get's a point
    } 
    
    // if the ball goes past the right boundary, it will go back to the middle
    else if (circleX > 1267) {    
      circleX = 680;
      circleY = 400;
      scoreLeft += 1;               // player 1 get's a point  
    }
    
    else if (circleY < 24)        // checks the top boundary
      ballSpeedY = ballSpeedY + 8;  // makes it bouce off when the ball hits the boundary
    
    else if ( circleY > 776)        // checks the bottom boundary
      ballSpeedY = ballSpeedY - 8; // makes it bounce off when the ball hits the boundary

    //Score Display// 
    textSize(100); 
    text(scoreLeft, 320, 125); // score on display as text for player 1
    text(scoreRight, 960, 125); // score on display as text for player 2
    textSize(50);       
    fill(255);   
    text("Player 1", 10, 60);
    text("Player 2", 1075, 60);
  }

// state changes to "GAME OVER" when one of the players gets 5 points (over 4 points)
    if (scoreLeft > 4 || scoreRight > 4)      
   state = "GAME OVER"; 
   
   if (state == "GAME OVER"){                //everything under the if statement will run when the state is "GAME OVER" 
 textSize(150);
 fill(255, 0, 0);
 text("GAME OVER", 200, 200); // displays text "GAME OVER"
 textSize(125);
 fill(90, 175, 242);
 
// checks if player 1 has a higher score, then the results will be displayed accordingly
 if (scoreLeft > scoreRight)              
winner = "Player 1 Wins";                      

// checks if player 2 has a higher score, then the results will be displayed accordingly
if (scoreLeft < scoreRight)                
winner = "Player 2 Wins";  
text(winner,225, 400);            // the results of who won are displayed 
textSize(60);
text("Press r to play again. . . . ." , 350 , 575);  // directions to change the state to "PLAY" are displayed
text("Press t to go back to the Title Menu", 140, 675 ); // directions to change the state to "START" are displayed

}

// paddle collision
 if ( (circleX - circleDiameter < paddleX1 + paddleWidth/2) && (circleY  < paddleY1 + paddleHeight/2 + circleDiameter) && (circleY > paddleY1 - paddleHeight/2 - circleDiameter) )     // ball bounces off player 1 paddle when it hits
  ballSpeedX *= (-1); 
  if ( (circleX + circleDiameter > paddleX2 - paddleWidth/2) && (circleY  > paddleY2 - paddleHeight/2 - circleDiameter) && (circleY < paddleY2 + paddleHeight/2 + circleDiameter) )    // ball bounces of player 2 paddle when it hits
  ballSpeedX *= (-1); 
}


   
 
