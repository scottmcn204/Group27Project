class Pin {

  final float CIRCLE_RADIUS = 15;
  final float LINE_LENGTH = 6;
  final int EVENT_NULL = 0;

  int event;
  private boolean hasBeenPressed;
  float circleX;// xlocation of pin circle
  float circleY; // y pos of pin circle
  float lineX; // actual x cord of airport
  float lineY;
  color lineColor;
  color fillColor;

  Pin(float lineX, float lineY, int event)
  {
    this.lineX = lineX;
    this.lineY = lineY;
    this.event = event;
  }

  void setup() {
    hasBeenPressed = false;
    lineColor = color(0, 150, 255);
    circleX = lineX;
    circleY = (lineY)-LINE_LENGTH;//places circle ontop of line, creating pin
  }

  void draw() {
    stroke(lineColor);
    line(lineX, lineY, lineX, lineY+LINE_LENGTH);
    if (hasBeenPressed) {
      fill(fillColor);
    } else {
      fill(255, 100, 0);
    }
    circle(circleX, circleY, CIRCLE_RADIUS);
  }
  void mouseOver() {
    lineColor = color(255);
    //println("HOVER"+event);
  }

  void mouseNotOver() {
    lineColor = color(0, 150, 255);
  }

  void mousePress() {
    hasBeenPressed = true;
    fillColor = color(0, 45, 90);
    lineColor = color(0);
  }
  void  mouseNotPressed() {
    hasBeenPressed = false;
    fillColor = color(255);
  }
  int getEvent(int mX, int mY) {

     if (mX>(circleX-CIRCLE_RADIUS) && mX < circleX+ CIRCLE_RADIUS && mY >(circleY - CIRCLE_RADIUS) && mY < circleY +CIRCLE_RADIUS) {
      return event;
    }
   
   else{
    return EVENT_NULL;
   }
  }
}
