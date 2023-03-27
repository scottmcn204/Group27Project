class Pin{
  
  final float CIRCLE_RADIUS = 10;
  final float LINE_LENGTH = 6;
  
  int event;
  float circleX;// xlocation of pin circle 
  float circleY; // y pos of pin circle
  float lineX; // actual x cord of airport 
  float lineY;
  color lineColor;
  
   Pin(float lineX, float lineY, int event)
   {
     this.lineX = lineX;
     this.lineY = lineY;
     this.event = event;

   }
   
   void setup(){
     lineColor = color(0);
     circleX = lineX;
     circleY = (lineY)-LINE_LENGTH;//places circle ontop of line, creating pin
     
   }
   
   void draw(){
     stroke(lineColor);
     line(lineX, lineY, lineX, lineY+LINE_LENGTH);
     circle(circleX, circleY, CIRCLE_RADIUS);
   }
   void mouseOver(){
     lineColor = color(255);
   }
   
   void mouseNotOver(){
     lineColor = color(0);
   }
  
  
}
