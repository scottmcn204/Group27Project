class Button {
  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean hovered;

  Button(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(255);
    hovered = false;
  }
  void draw() {
    if (hovered) {
      stroke(0, 150, 255);
      this.widgetColor = color(255, 100, 0);
    } else {
      stroke(255);
      this.widgetColor = color(0, 45, 90);
    }
    fill(widgetColor);
    rect(x, y, width, height, 8, 8, 8, 8);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
  int getEvent(int mX, int mY) {
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      return event;
    }
    return 0;
  }
  void setWidgetColor(color newColor) {
    this.widgetColor = newColor;
  }
}
