//import org.gicentre.utils.spatial.*;    // For map projections //<>//

class MapScreen
{
  ArrayList<Pin> myPins;
  ArrayList<String> flightCompareTable;
  final float BACKGROUND_WIDTH =(SCREENX*0.75);
  final float BAKCGROUND_HEIGHT =(SCREENY*0.75);
  PImage backgroundMap;
  final int EVENT_NULL = 0;


  void setup()
  {
    myPins = new ArrayList<Pin>();
    flightCompareTable = new ArrayList<String>();
    Pin pin1, pin2, pin3, pin4, pin5, pin6, pin7, pin8, pin9, pin10,
      pin11, pin12, pin13, pin14, pin15, pin16, pin17, pin18, pin19,
      pin20, pin21, pin22, pin23, pin24, pin25, pin26, pin27, pin28,
      pin29, pin30, pin31, pin32, pin33, pin34, pin35, pin36, pin37,
      pin38, pin39, pin40, pin41, pin42, pin43, pin44, pin45, pin46,
      pin47, pin48, pin49, pin50;
    pin1 = new Pin( 693, 611.625, 1);//DFW
    pin2 = new Pin(892.5, 595, 2);// ATL
    pin3 = new Pin( 805, 428.75, 3);//ORD
    pin4 = new Pin(562.625,462, 4);//DEN
    pin6 = new Pin( 350, 595, 6);//LAX

    myPins.add(pin1);
    myPins.add(pin2);
    myPins.add(pin3);
    myPins.add(pin4);
    myPins.add(pin6);
    readData();
    //WebMercator map = new WebMercator();

    for (int i = 0; i < myPins.size(); i++) {
      Pin aPin = (Pin) myPins.get(i);
      aPin.setup();
    }
  }
  void clearCompare(){
    flightCompareTable.removeAll(flightCompareTable);
  }


  void draw()
  {
    image (backgroundMap, 0, SCREENY - BAKCGROUND_HEIGHT, BACKGROUND_WIDTH, BAKCGROUND_HEIGHT );
    for (int i = 0; i < myPins.size(); i++) {
      Pin aPin = (Pin) myPins.get(i);
      aPin.draw();
    }
  }

  void readData()
  {
    backgroundMap = loadImage ("background.png");
  }
  void getHoverEvent() {
    int event;

    for (int i = 0; i<myPins.size(); i++) {
      Pin aPin = (Pin)myPins.get(i);
      event = aPin.getEvent(mouseX, mouseY);
      if (aPin.hasBeenPressed == false) {
        if (event != EVENT_NULL) {
          aPin.mouseOver();
        } else {
          aPin.mouseNotOver();
        }
      }
    }
  }
  void getMousePress() {
    int event;

    for (int i =0; i<myPins.size(); i++) {
      Pin aPin = (Pin)myPins.get(i);
      event = aPin.getEvent(mouseX, mouseY);
      
      
      

      if (event != EVENT_NULL) {
        aPin.mousePress();
        switch(event) {
        case 1:
          if (flightCompareTable.size() < 6)
            flightCompareTable.add("Dallas/Fort Worth, TX");
          break;
        case 2:
          if (flightCompareTable.size() < 6)
            flightCompareTable.add("Atlanta, GA");
          break;
        default:
          println("no");
        }
      } 
      else {
        aPin.mouseNotPressed();
      }
    }
  }
}
