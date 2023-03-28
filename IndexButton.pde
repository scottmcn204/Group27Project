class IndexButton{
  int x, y, width, height;
String label; int event;
color indexColor, labelColor;
PFont indexFont;
IndexButton(int x,int y, int width, int height, String label,
color indexColor, PFont indexFont, int event){
this.x=x; this.y=y; this.width = width; this.height= height;
this.label=label; this.event=event;
this.indexColor=indexColor; this.indexFont=indexFont;
labelColor= color(0);
}
void draw(){
fill(indexColor);
rect(x,y,width,height);
fill(labelColor);
text(label, x+10, y+height-10);
}
int getEvent(int mX, int mY){
if(mX>x && mX < x+width && mY >y && mY <y+height){
return event;
}
return 0;
}
  
  
  
}
