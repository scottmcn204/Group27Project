class Pin{
  
  final float CIRCLE_RADIUS = 10;
  final float LINE_LENGTH = 6;
  
  float circleX;// xlocation of pin circle 
  float circleY; // y pos of pin circle
  float lineX; // actual x cord of airport 
  float lineY;
  
   Pin(float lineX, float lineY){
     this.lineX = lineX;
     this.lineY = lineY;

   }
   
   void setup(){
     circleX = lineX;
     circleY = (lineY)-LINE_LENGTH;//places circle ontop of line, creating pin
     
   }
   
   void draw(){
     line(lineX, lineY, lineX, lineY+LINE_LENGTH);
     circle(circleX, circleY, CIRCLE_RADIUS);
   }
  
  
}
