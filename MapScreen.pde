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
    pin4 = new Pin(562.625, 462, 4);//DEN
    pin6 = new Pin( 350, 595, 6);//LAX
    pin7 = new Pin(962, 763, 7); //MIA
    pin8 = new Pin(1063, 448, 8); // JFK
    pin9 = new Pin(912, 413, 9); // DTW
    pin10 = new Pin(1112, 415, 10); // BOS
    pin11 = new Pin(279, 518, 11); // SFO
    pin12 = new Pin(753, 347, 12); // MSP
    pin13 = new Pin(451, 441, 13); // SLC
    pin14 = new Pin(1043, 466, 14); // PHL
    pin15 = new Pin(963, 746, 15); // FLL
    pin16 = new Pin(924, 719, 16); // TMP
    pin17 = new Pin(683, 677, 17); // AUS
    pin18 = new Pin(861, 548, 18); // BNA
    pin19 = new Pin(1020, 481, 19); // BWI
    pin20 = new Pin(1005, 489, 20); // IAD
    pin21 = new Pin(365, 617, 21); // SAN
    pin22 = new Pin(276, 331, 21); // PDX


    myPins.add(pin1);
    myPins.add(pin2);
    myPins.add(pin3);
    myPins.add(pin4);
    myPins.add(pin6);
    myPins.add(pin7);
    myPins.add(pin8);
    myPins.add(pin9);
    myPins.add(pin10);
    myPins.add(pin11);
    myPins.add(pin12);
    myPins.add(pin13);
    myPins.add(pin14);
    myPins.add(pin15);
    myPins.add(pin16);
    myPins.add(pin17);
    myPins.add(pin18);
    myPins.add(pin19);
    myPins.add(pin20);
    myPins.add(pin21);
    myPins.add(pin22);
    readData();
    //WebMercator map = new WebMercator();

    for (int i = 0; i < myPins.size(); i++) {
      Pin aPin = (Pin) myPins.get(i);
      aPin.setup();
    }
  }
  void clearCompare() {
    flightCompareTable.removeAll(flightCompareTable);
  }


  void draw()
  {
    image (backgroundMap, 0, SCREENY - BAKCGROUND_HEIGHT, BACKGROUND_WIDTH, BAKCGROUND_HEIGHT);
    noFill();
    strokeWeight(16);
    stroke(0, 45, 90);
    rect(0, SCREENY - BAKCGROUND_HEIGHT, BACKGROUND_WIDTH, BAKCGROUND_HEIGHT);

    /*strokeWeight(4);
     stroke(0);
     rect( 4, SCREENY - BAKCGROUND_HEIGHT, BACKGROUND_WIDTH -9 , BAKCGROUND_HEIGHT - 8 );
     */
    strokeWeight(1);
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
        mainMap.removeDuplicateAirports();
      } else {
        aPin.mouseNotPressed();
        println(mouseX, mouseY);
      }
    }
  }
  void removeDuplicateAirports() {
    ArrayList<String> tempList = new ArrayList<String>();
    for (String element : flightCompareTable) {
      if (!tempList.contains(element)) {
        tempList.add(element);
      }
    }
    flightCompareTable = tempList;
  }
}
