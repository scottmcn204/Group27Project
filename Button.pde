/**
* The Button Class is used to implement functionality of buttons
*   throughout the program.
* Buttons can have specific size, text, color and color of text as
*   well as events, set integers used outside the class. 
*/
class Button {
  int xPos, yPos, width, height;
  String label;
  int event;
  color buttonColor, labelColor;
  PFont buttonTextFont;
  boolean hovered;
  /**
   * Constructor method
   * Sets values of above variables to new buttons
   */
  Button(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.xPos=x;
    this.yPos=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.buttonColor=widgetColor;
    this.buttonTextFont=widgetFont;
    labelColor= color(255);
    hovered = false;
  }
  /**
   * Draw method
   * Draws a rounded rectangle on screen filling it with appropriate
   *   color (different when hovered over), text, text color and stroke.
   */
  void draw() {
    if (hovered) {
      stroke(0, 150, 255);
      this.buttonColor = color(255, 100, 0);
    } else {
      stroke(255);
      this.buttonColor = color(0, 45, 90);
    }
    fill(buttonColor);
    rect(xPos, yPos, width, height, 8, 8, 8, 8);
    fill(labelColor);
    text(label, xPos+10, yPos+height-10);
  }
  /**
   * getEvent
   * returns current event number specified in constructor
   *   if mouse is over button, 0 otherwise
   * @param mX the mouse x position
   * @param mY the mouse y position
   * @return the appropriate event
   */
  int getEvent(int mX, int mY) {
    if (mX>xPos && mX < xPos+width && mY >yPos && mY <yPos+height) {
      return event;
    }
    return 0;
  }
  /**
   * setButtonColor method
   * Sets the interior color of the button to a new specified color.
   * @param newColor the new button color
   */
  void setButtonColor(color newColor) {
    this.buttonColor = newColor;
  }
}
