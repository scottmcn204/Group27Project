  import org.gicentre.utils.spatial.*;    // For map projections

class MapScreen
{
  ArrayList Pin;
final float BACKGROUND_WIDTH =(SCREENX*0.75); 
final float BAKCGROUND_HEIGHT =(SCREENY*0.75);
PImage backgroundMap;


  void setup()
  {
    readData();
    WebMercator map = new WebMercator();
  }
  
  
  
  void draw() 
  {
    image (backgroundMap,0,SCREENY - BAKCGROUND_HEIGHT ,BACKGROUND_WIDTH, BAKCGROUND_HEIGHT );
    
  }
  
  void readData()
  {
    backgroundMap = loadImage ("background.png");
  }
  
}
