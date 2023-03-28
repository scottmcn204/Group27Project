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
    Pin pin1;
    Pin pin2;
    Pin pin3, pin4, pin5, pin6, pin7, pin8, pin9, pin10;
    Pin pin11, pin12, pin13, pin14, pin15, pin16, pin17;
    Pin pin18, pin19, pin20, pin21, pin22, pin23, pin24, pin25, pin26, pin27, pin28, pin29, pin30, pin31, pin32, pin33, pin34, pin35, pin36,
    pin37, pin38, pin39, pin40, pin41, pin42, pin43, pin44, pin45, pin46, pin47, pin48, pin49, pin50;
    pin1 = new Pin( 792, 699, 1);//DFW
    pin2 = new Pin(1020, 680, 2);// ATL
    pin6 = new Pin( 400, 680, 6);//LAX
    
    myPins.add(pin1);
    myPins.add(pin2);
    myPins.add(pin6);
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
