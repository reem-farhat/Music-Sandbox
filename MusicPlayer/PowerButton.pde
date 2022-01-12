//Global Variables
String powerButton = "off";
color purple=#E35EDC, yellow=#FAF792, resetWhite=#FFFFFF, buttonColour;
float powerButtonX, powerButtonY, powerButtonWidth, powerButtonHeight;
//
void powerButton() {
  //Population
  powerButtonX = displayWidth*29/32;
  powerButtonY = displayHeight*0/16;
  powerButtonWidth = displayWidth*3/32;
  powerButtonHeight = displayHeight*1/16;
}//End powerButton()
//
void powerButtonDraw() {
  //Hoverover
  if (mouseX>powerButtonX && mouseX<powerButtonX+powerButtonWidth && mouseY>powerButtonY && mouseY<powerButtonY+powerButtonHeight) {
    buttonColour = yellow;
    hoverOverButtonFill();
  } else {
    buttonColour = purple;
    hoverOverButtonFill();
  }
  //Text
  textCode(powerButton, displayWidth*3/100 , powerButtonX, powerButtonY, powerButtonWidth, powerButtonHeight);
}//End powerButtonDraw()
//
void powerButtonMousePressed() {
  if (mouseX>powerButtonX && mouseX<powerButtonX+powerButtonWidth && mouseY>powerButtonY && mouseY<powerButtonY+powerButtonHeight) exit();
}//powerButtonMousePressed()
void hoverOverButtonFill() {
    fill(buttonColour);
    rect(powerButtonX, powerButtonY, powerButtonWidth, powerButtonHeight);
    fill(resetWhite);
}//End hoverOverButtonFill
