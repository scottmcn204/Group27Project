final int MARGIN = 10;
final int PADDLEWIDTH = 60;
final int PADDLEHEIGHT = 20;

void setup() {
  size(500, 500);
}
void draw() {
  background(180, 120);
  rect(mouseX, MARGIN, PADDLEWIDTH, PADDLEHEIGHT);
}
