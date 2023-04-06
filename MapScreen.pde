//import org.gicentre.utils.spatial.*;    // For map projections //<>// //<>// //<>// //<>//
import uibooster.*;
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
    pin5 = new Pin(934, 562, 5); // CLT
    pin6 = new Pin( 350, 595, 6);//LAX
    pin7 = new Pin(281, 268, 7); // SEA
    pin8 = new Pin(1062, 440, 8); // LGA
    pin9 = new Pin(463, 617, 9); // PHX
    //pin10 = new Pin(1056, 450, 10); //EWR
    pin11 = new Pin(951, 717, 11); // MCO
    pin12 = new Pin(718, 670, 12); // IAH
    pin13 = new Pin(1011, 497, 13); //DCA
    pin14 = new Pin(397, 548, 14); // LAS

    pin15 = new Pin(962, 763, 15); //MIA
   // pin16 = new Pin(1093, 438, 16); // JFK
    pin17 = new Pin(912, 413, 17); // DTW
    pin18 = new Pin(1112, 400, 18); // BOS
    pin19 = new Pin(279, 518, 19); // SFO
    pin20 = new Pin(753, 347, 20); // MSP
    pin21 = new Pin(451, 441, 21); // SLC
    pin22 = new Pin(1037, 465, 22); // PHL
    //pin23 = new Pin(963, 746, 23); // FLL
    pin24 = new Pin(928, 746, 24); // TPA
    pin25 = new Pin(683, 677, 25); // AUS
    pin26 = new Pin(861, 548, 26); // BNA

    //pin27 = new Pin(993, 460, 27); // BWI

    // pin28 = new Pin(1005, 489, 28); // IAD
    pin29 = new Pin(365, 617, 29); // SAN
        //pin30 = new Pin(700, 611.625 30); // DAL
    pin31 = new Pin(276, 331, 31); // PDX
    pin32 = new Pin(379, 366, 32); // BOI
    pin33 = new Pin(595, 373, 33); //RAP
    pin34 = new Pin(623,297, 34); //BIS
    pin35 = new Pin(1129, 362, 35);//PWM
    pin36 = new Pin(543, 573, 36);//ABQ
    pin37 = new Pin(707, 546, 37); // TUL
    pin38 = new Pin(122, 299, 38); //ANC
    pin39 = new Pin(84, 681, 39); //HNL



    myPins.add(pin1);
    myPins.add(pin2);
    myPins.add(pin3);
    myPins.add(pin4);
    myPins.add(pin5);
    myPins.add(pin6);

    myPins.add(pin7);
    myPins.add(pin8);
    myPins.add(pin9);
    // myPins.add(pin10);
    myPins.add(pin11);
    myPins.add(pin12);
    myPins.add(pin13);
    myPins.add(pin14);
    myPins.add(pin15);
   // myPins.add(pin16);
    myPins.add(pin17);
    myPins.add(pin18);
    myPins.add(pin19);
    myPins.add(pin20);
    myPins.add(pin21);
    myPins.add(pin22);
    //myPins.add(pin23);
    myPins.add(pin24);

    myPins.add(pin25);
    myPins.add(pin26);
    // myPins.add(pin27);
    // myPins.add(pin28);
    myPins.add(pin29);
    //myPins.add(pin30);
        myPins.add(pin31);
    myPins.add(pin32);
    myPins.add(pin33);
    myPins.add(pin34);
    myPins.add(pin35);
    myPins.add(pin36);
    myPins.add(pin37);
    myPins.add(pin38);
    myPins.add(pin39);
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
        if (flightCompareTable.size() < 6) {
          switch(event) {
          case 1:
              flightCompareTable.add("Dallas/Fort Worth, TX");
            break;
          case 2:
              flightCompareTable.add("Atlanta, GA");
            break;
          case 3:
              flightCompareTable.add("Chicago, IL");
            break;
          case 4:
              flightCompareTable.add("Denver, CO");
            break;
          case 5:
              flightCompareTable.add("Charlotte, NC");
            break;
          case 6:
              flightCompareTable.add("Los Angeles, CA");
            break;
          case 7:
              flightCompareTable.add("Seattle, WA");
            break;
          case 8:
              flightCompareTable.add("New York, NY");
            break;
          case 9:
              flightCompareTable.add("Phoenix, AZ");
            break;
          case 10:
              flightCompareTable.add("Newark, NJ");
            break;
          case 11:
              flightCompareTable.add("Orlando, FL");
            break;
          case 12:
              flightCompareTable.add("Houston, TX");
            break;
          case 13:
              flightCompareTable.add("Washington, DC");
            break;
          case 14:
              flightCompareTable.add("Dallas/Fort Worth, TX");
            break;
          case 15:
              flightCompareTable.add("Miami, FL");
            break;
          case 16:
              flightCompareTable.add("New York, NY");
            break;
          case 17:
              flightCompareTable.add("Detroit, MI");
            break;
          case 18:
              flightCompareTable.add("Boston, MA");
            break;
          case 19:
              flightCompareTable.add("San Francisco, CA");
            break;
          case 20:
              flightCompareTable.add("Minneapolis, MN");
            break;
          case 21:
              flightCompareTable.add("Salt Lake City, UT");
            break;
          case 22:
              flightCompareTable.add("Philadelphia, PA");
            break;
          case 23:
              flightCompareTable.add("Fort Lauderdale, FL");
            break;
          case 24:
              flightCompareTable.add("Tampa, FL");
            break;
          case 25:
              flightCompareTable.add("Austin, TX");
            break;
          case 26:
              flightCompareTable.add("Nashville, TN");
            break;
          case 27:
              flightCompareTable.add("Baltimore, MD");
            break;
          case 28:
              flightCompareTable.add("Washington, DC");
            break;
          case 29:
              flightCompareTable.add("San Angelo, TX");
            break;
          case 30:
              flightCompareTable.add("Portland, OR");
            break;
           case 31:
              flightCompareTable.add("Portland, OR");
            break;
          case 32:
             flightCompareTable.add("Boise, ID");
             break;
          case 33:
               flightCompareTable.add("Rapid City, SD");
               break;
          case 34:
              flightCompareTable.add("Bismarck/Mandan, ND");
               break;
          case 35:
              flightCompareTable.add("Portland, ME");
              break;
          case 36:
              flightCompareTable.add("Albuquerque, NM");
              break;
          case 37:
              flightCompareTable.add("Tulsa, OK");
              break;
          case 38:
              flightCompareTable.add("Anchorage, AK");
              break;
          case 39:
              flightCompareTable.add("Honolulu, HI");
              break;
          default:
            println("N/A");
          }
        }
        else new UiBooster().showWarningDialog("Cannot add more than 6 cities!", "WARN");
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
