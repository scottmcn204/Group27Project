  //import org.gicentre.utils.spatial.*;    // For map projections

class MapScreen
{
  ArrayList<Pin> myPins;
final float BACKGROUND_WIDTH =(SCREENX*0.75); 
final float BAKCGROUND_HEIGHT =(SCREENY*0.75);
PImage backgroundMap;


  void setup()
  {
    myPins = new ArrayList<Pin>();
    Pin pin1, pin2, pin3, pin4, pin5, pin6, pin7, pin8, pin9, pin10;
    pin1 = new Pin( 1220, 500, 1);
    pin2 = new Pin( 400, 680, 2);
    pin3 = new Pin
    myPins.add(pin1);
    myPins.add(pin2);
    readData();
    //WebMercator map = new WebMercator();
    
        for (int i = 0; i < myPins.size(); i++){
      Pin aPin = (Pin) myPins.get(i);
      aPin.setup();
    }
  }
  
  
  
  void draw() 
  {
    image (backgroundMap,0,SCREENY - BAKCGROUND_HEIGHT ,BACKGROUND_WIDTH, BAKCGROUND_HEIGHT );
    for (int i = 0; i < myPins.size(); i++){
      Pin aPin = (Pin) myPins.get(i);
      aPin.draw();
    }
    
  }
  
  void readData()
  {
    backgroundMap = loadImage ("background.png");
    
    
    
    // create pins here SYNTAX Pin(float lineX, float lineY, int event)

    
  }
  
}
