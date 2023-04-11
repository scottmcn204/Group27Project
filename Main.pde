//Please install the below libraries before running: //<>// //<>//
import org.gicentre.utils.stat.*;
import controlP5.*;
import gifAnimation.*;
import uibooster.*;
//7/8 downscale from 1800
final int SCREENX = 1575;
final int SCREENY = 787;
Table table;
MapScreen mainMap;
Flight tempFlight;
int times[];
int distances[];
PFont myFont;
float textXpos = 0;
float textYpos = 0;
float trees[];
float arrivals[];
float status[];
float late[];
String dests[];
float emissions[];
ControlP5 cp5, cp5Map, cp5zoom, cp5focus;
int zoom = 0;
int date = 0;
int focus = 0;
BarChart chart;
chartBar emissionCO2;
chartBar arrivalsAirports;
int week = 0;
BarChart barChart;
PieChart statusPie;
Flights flights;
XYChart lateFlightChart;
boolean doneLoading;
int totalArrivals;
ArrayList<String> searchResults;
int p;
ListBox l;
int selectedScreen = 0;
Button btnToDB, btnToMap, btnCO2, clearButton, btnInstructions, btnCO2ToDB, btnToCO2;
Gif planeAnimation;
PImage logo;
PImage tree;
PImage halfTree;

void settings()
{
  size(SCREENX, SCREENY);
}
void setup() {
  doneLoading = false;
  planeAnimation = new Gif(this, "planeLoading.gif");
  tree = loadImage("pineTree.png");
  tree.resize(30,0);
  halfTree = loadImage("halftree.png");
  halfTree.resize(15,0);
  logo = loadImage("logo.png");
  planeAnimation.play();
  background(178, 210, 221);
  myFont = createFont("Arial", 16);
  cp5 = new ControlP5(this);
  cp5zoom = new ControlP5(this);
  cp5focus = new ControlP5(this);
  cp5Map = new ControlP5(this);
  cp5.setAutoDraw(false);
  cp5zoom.setAutoDraw(false);
  cp5focus.setAutoDraw(false);
  cp5Map.setAutoDraw(false);
  searchResults = new ArrayList<String>();
  btnToDB = new Button(1250, 600, 180, 40,
    "Compare Selected", color(0, 45, 90), myFont, 1);
  btnToMap = new Button(1300, 700, 180, 40,
    "Back To Map", color(255), myFont, 2);
  clearButton = new Button(1250, 550, 180, 40,
    "Clear", color(0, 45, 90), myFont, 8);
  btnCO2 = new Button(1250, 650, 180, 40,
    "View CO2 emission", color(0, 45, 90), myFont, 9);
  btnInstructions = new Button(1090, 145, 100, 35,
    "Help", color(0, 45, 90), myFont, 7);
  btnToCO2 = new Button(1100, 700, 180, 40,
    "To CO2 Page", color(0, 45, 90), myFont, 3);
  btnCO2ToDB = new Button(1100, 700, 180, 40,
    "To Dashboard", color(0, 45, 90), myFont, 4);
  thread("slowLoad");
}
void slowLoad() {
  mainMap = new MapScreen();
  flights = new Flights();
  dests = new String[] {"ABQ", "ADQ", "ALB", "ANC", "ATL"};
  status = new float[3]; // 0 = on time, 1 = diverted, 2 = cancelled



  PFont font = createFont("arial", 20);

  cp5Map.addTextfield(" ")
    .setPosition(1250, 100)
    .setSize(300, 50)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255));
  textFont(font);

  l = cp5Map.addListBox("results")
    .setPosition(1250, 150)
    .setSize(300, 200)
    .setItemHeight(25)
    .setColorBackground(color(255, 128))
    .setColorActive(color(245))
    .setColorForeground(color(255, 100, 0))
    .setColorValueLabel(color(0))
    .setColorLabel(color(0));
  p = 0;

  searchResults.addAll(flights.airports);

  for (int i = 0; (i < searchResults.size()); i++) {
    l.addItem(searchResults.get(i), p++);
  }
  mainMap.setup();

  chart = new BarChart(this);
  arrivalsAirports = new chartBar(chart, "Number of arrivals per airport");
  emissionCO2 = new chartBar(chart, "estimated CO2 emission per airport (Mkg)");

  cp5zoom.addSlider("zoom")
    .setPosition(1025, 520)
    .setRange(0, 100)
    .setValue(100)
    .setSize(150, 40)
    .setColorForeground(color(255, 100, 0))
    .setColorActive(color(255, 100, 0))
    .setColorBackground(color(0, 45, 90))
    .setColorValue(color(0));

  cp5focus.addSlider("focus")
    .setPosition(175, 520)
    .setRange(0, 100)
    .setValue(100)
    .setSize(150, 40)
    .setColorForeground(color(255, 100, 0))
    .setColorActive(color(255, 100, 0))
    .setColorBackground(color(0, 45, 90))
    .setColorValue(color(0));


  cp5.addSlider("week")

    .setPosition(500, 520)
    .setRange(1, 4)
    .setSize(150, 40)
    .setColorForeground(color(255, 100, 0))
    .setColorActive(color(255, 100, 0))
    .setColorBackground(color(0, 45, 90))
    .setColorValue(color(0));

  statusPie = new PieChart(status, 30, 100);

  lateFlightChart = new XYChart(this);
  lateFlightChart.showXAxis(true);
  lateFlightChart.showYAxis(true);
  lateFlightChart.setMinY(0);
  lateFlightChart.setPointSize(7);
  lateFlightChart.setLineWidth(2.5);
  lateFlightChart.setAxisLabelColour(color(0, 45, 90));
  lateFlightChart.setAxisValuesColour(color(0, 45, 90));
  lateFlightChart.setLineColour(color(0, 150, 255));
  lateFlightChart.setPointColour(color(255, 100, 0));
  lateFlightChart.setXAxisLabel("Days of Selected Week");
  lateFlightChart.setYAxisLabel("Number of Late Flights");

  mainMap.clearCompare();

  new UiBooster().createNotification("You can now use the program", "Flights are ready");
  doneLoading = true;
}

void draw()
{
  if (!doneLoading) {
    background(204, 234, 247);
    surface.setTitle("Loading...");
    textFont(myFont, 50);
    fill(255);
    image(planeAnimation, 410, 200);
    text("Loading your Flights...", SCREENX/2 - 250, SCREENY/2 - 100);
  } else {
    if (selectedScreen == 0) {
      background(170, 211, 223);
      surface.setTitle("Map");
      textFont(myFont, 16);
      mainMap.draw();
      cp5Map.draw();
      btnToDB.draw();
      clearButton.draw();
      btnCO2.draw();
      btnInstructions.draw();
      fill(0, 45, 90);
      text("Selected cities (max 6):", 1250, 367);
      text("Search:", 1250, 93);
      stroke(255);
      fill(0, 45, 90);
      rect(1250, 375, 270, 150, 8, 8, 8, 8);
      fill(0);
      image(logo, 10, 10, 500, 154);
      fill(255);


      if (mainMap.flightCompareTable != null ) {
        for (int i = 0; (i < mainMap.flightCompareTable.size()); i++) {
          text(mainMap.flightCompareTable.get(i), 1270, 400 + (i * 20));
        }
      }
    } else if (selectedScreen == 1) {
      background(170, 211, 223);
      fill(0, 45, 90);
      textFont(myFont, 24);
      text("Dashboard", 25, 30);
      textFont(myFont, 16);
      surface.setTitle("Dashboard");
      cp5.draw();
      cp5zoom.draw();
      fill(0, 45, 90);
      btnToMap.draw();
      btnToCO2.draw();
      statusPie.draw(60, 450);
      arrivalsAirports.NotTransposedGraph();
      arrivalsAirports.draw(950, 70, 300, zoom);
      lateFlightChart.draw(425, 70, 500, 400);
      setLineGraphData(week, mainMap.flightCompareTable);
      fill(0, 45, 90);
      stroke(255);
      rect(46, 585, 270, 150, 8, 8, 8, 8);
      fill(255);
      if (mainMap.flightCompareTable != null ) {
        for (int i = 0; (i < mainMap.flightCompareTable.size()); i++) {
          text(mainMap.flightCompareTable.get(i), 50, 610 + (i * 20));
        }
      }
      fill(0, 45, 90);
      text("Selected cities:", 46, 575);
    } else {
      background(170, 211, 223);
      surface.setTitle("CO2 Emissions");
      textFont(myFont, 16);
      btnToMap.draw();
      btnCO2ToDB.draw();
      getEmission(mainMap.flightCompareTable);
      emissionCO2.setData(emissions, mainMap.flightCompareTable, "estimated CO2 emission per airport (megatonnes)");
      emissionCO2.transposeGraph();
      emissionCO2.draw(50, 70, 50, focus);
/*<<<<<<< HEAD
      treesNeeded.setData(trees, mainMap.flightCompareTable, "trees to offset carbon emission from airport (100 thousands)");
      treesNeeded.NotTransposedGraph();
      treesNeeded.draw(750, 70, 50, focus);
<<<<<<< HEAD
=======
=======
      emissionCO2.draw(50, 120, 50, focus);
>>>>>>> Stashed changes
=======
>>>>>>> 79520ddaf91bf16a0a833d48e656c2c8a03c153b
>>>>>>> parent of 76e70a6 (Revert "polish")
*/
      cp5focus.draw();
      fill(0, 45, 90);
      textFont(myFont, 18);
      text("Trees needed to offset the carbon emission from airport", 750, 70);
      image(tree,1295,100);
      text(" : 5 million trees", 1320, 125);
      image(halfTree, 1295, 160);
      text(" : < 5 million trees", 1320, 185);
      stroke(255);
      fill(255);
      rect(750, 100, 470, (35*trees.length), 8, 8, 8, 8);
      for (int i =0; i < trees.length; i++){
        fill(0, 45, 90);
        text( mainMap.flightCompareTable.get(i) + " Airport: " + nf(trees[i],0,2) + " million trees", 765, 130 +(30*i));
        float treeNumber = trees[i];
        int j =0;
        while (treeNumber > 5){
          image(tree, 750+(30*j), 350+(60*i));
          j++;
          treeNumber = treeNumber - 5;
        }
        if (treeNumber > 0){
          image(halfTree, 750+(30*j), 350+(60*i));
        }
        fill(0, 45, 90);
        text(emissionCO2.airports[i], 710,380+(60*i));
        
      }
    }   
  }
}
void controlEvent(ControlEvent theEvent) {
  if (selectedScreen == 0) {
    if (theEvent.isAssignableFrom(Textfield.class)) {
      search();
    }
    if (keyPressed == false) {
      if (mainMap.flightCompareTable.size() < 6) {
        mainMap.flightCompareTable.add(searchResults.get((int)l.getValue()));
        mainMap.removeDuplicateAirports();
      } else new UiBooster().showWarningDialog("Cannot add more than 6 cities!", "WARN");
    }
  }
}

void search() {
  searchResults.removeAll(searchResults);
  l.clear();
  for (int i = 0; (i < flights.airports.size()); i++) {
    if (flights.airports.get(i).toLowerCase().contains(cp5Map.get(Textfield.class, " ").getText().toLowerCase())) {
      searchResults.add(flights.airports.get(i));
    }
  }
  p = 0;
  if (searchResults != null) {
    for (int i = 0; (i < searchResults.size()); i++) {
      l.addItem(searchResults.get(i), p++);
    }
  }
}

void mouseMoved() {
  if (doneLoading && selectedScreen == 0) {
    mainMap.getHoverEvent();
    int event = btnToDB.getEvent(mouseX, mouseY);
    if (event == 1) btnToDB.hovered = true;
    else btnToDB.hovered = false;
    event = clearButton.getEvent(mouseX, mouseY);
    if (event == 8) clearButton.hovered = true;
    else clearButton.hovered = false;
    event =  btnCO2.getEvent(mouseX, mouseY);
    if (event == 9)  btnCO2.hovered = true;
    else  btnCO2.hovered = false;
    event =  btnInstructions.getEvent(mouseX, mouseY);
    if (event == 7)  btnInstructions.hovered = true;
    else  btnInstructions.hovered = false;
  } else if (doneLoading && selectedScreen == 1) {
    int event = btnToMap.getEvent(mouseX, mouseY);
    if (event == 2) btnToMap.hovered = true;
    else btnToMap.hovered = false;
    event = btnToCO2.getEvent(mouseX, mouseY);
    if (event == 3) btnToCO2.hovered = true;
    else btnToCO2.hovered = false;
  } else if (doneLoading && selectedScreen == 2) {
    int event = btnToMap.getEvent(mouseX, mouseY);
    if (event == 2) btnToMap.hovered = true;
    else btnToMap.hovered = false;
    event = btnCO2ToDB.getEvent(mouseX, mouseY);
    if (event == 4) btnCO2ToDB.hovered = true;
    else btnCO2ToDB.hovered = false;
  }
}

void mousePressed() {
  int event;
  if (doneLoading && selectedScreen == 0) {
    mainMap.getMousePress();
    event = btnToDB.getEvent(mouseX, mouseY);
    if (event == 1) {
      if (mainMap.flightCompareTable.size() >= 1) {
        selectedScreen = 1;
        getData(mainMap.flightCompareTable);
        arrivalsAirports.setData(arrivals, mainMap.flightCompareTable, "Number of arrivals per airport");
        statusPie.changeData(status);
      } else new UiBooster().showWarningDialog("You cannot access the Dashboard without selecting cities!", "WARN");
    } else {
      event =  btnCO2.getEvent(mouseX, mouseY);
      if (event == 9) {
        if (mainMap.flightCompareTable.size() >= 1) {
          selectedScreen = 2;
        } else new UiBooster().showWarningDialog("You cannot access CO2 emission information without selecting cities!", "WARN");
      }
      event = btnInstructions.getEvent(mouseX, mouseY);
      if (event == 7) new UiBooster().showInfoDialog("Select up to 6 cities by selecting from the pins" +
        " on the map or by searching and/or selecting from the list. Use Compare Selected to see stats or" +
        " view the Environmental Report.");
    }
  } else if (doneLoading && selectedScreen == 1) {
    event = btnToMap.getEvent(mouseX, mouseY);
    if (event == 2) {
      selectedScreen = 0;
      mainMap.clearCompare();
    }
    event = btnToCO2.getEvent(mouseX, mouseY);
    if (event == 3) selectedScreen = 2;
  } else if (doneLoading && selectedScreen == 2) {
    event = btnToMap.getEvent(mouseX, mouseY);
    if (event == 2) {
      selectedScreen = 0;
      mainMap.clearCompare();
    }
    event = btnCO2ToDB.getEvent(mouseX, mouseY);
    if (event == 4) {
      selectedScreen = 1;
      getData(mainMap.flightCompareTable);
      arrivalsAirports.setData(arrivals, mainMap.flightCompareTable, "Number of arrivals per airport");
      statusPie.changeData(status);
    }
  }

  if (doneLoading && selectedScreen == 0) {
    event = clearButton.getEvent(mouseX, mouseY);
    if (event == 8) mainMap.clearCompare();
  }
}
void keyPressed() {
  if (key == 13 && selectedScreen == 0) {
    search();
  }
}
void setLineGraphData(int week, ArrayList<String> airports) {
  switch (week) {
  case 1:
    float days[] = new float[10];
    for (int i = 1; i <= days.length; i++) days[i - 1] = i;
    float totalDelayed[] = new float[10];
    for (int j = 0; j < flights.flights.size(); j++) {
      for (int k = 0; k < airports.size(); k++) {
        Flight temp =flights.flights.get(j);
        if (temp.destinationCity.equals(airports.get(k)))
          for (int i = 0; i < 10; i++) {
            if (temp.date == i + 1 && temp.isLate()) {

              totalDelayed[i]++;
            }
          }
      }
    }
    lateFlightChart.setData(days, totalDelayed);
    break;
  case 2:
    float days2[] = new float[7];
    for (int i = 1; i <= days2.length; i++) days2[i - 1] = i + 10;
    float totalDelayed2[] = new float[7];
    for (int j = 0; j < flights.flights.size(); j++) {
      for (int k = 0; k < airports.size(); k++) {
        Flight temp =flights.flights.get(j);
        if (temp.destinationCity.equals(airports.get(k))) {
          for (int i = 0; i < 7; i++) {
            if (flights.flights.get(j).date == i + 11 && flights.flights.get(j).isLate()) {
              totalDelayed2[i]++;
            }
          }
        }
      }
    }
    lateFlightChart.setData(days2, totalDelayed2);
    break;
  case 3:
    float days3[] = new float[7];
    for (int i = 1; i <= days3.length; i++) days3[i - 1] = i + 17;
    float totalDelayed3[] = new float[7];
    for (int j = 0; j < flights.flights.size(); j++) {
      for (int k = 0; k < airports.size(); k++) {
        Flight temp =flights.flights.get(j);
        if (temp.destinationCity.equals(airports.get(k))) {
          for (int i = 0; i < 7; i++) {
            if (flights.flights.get(j).date == i + 18 && flights.flights.get(j).isLate()) {
              totalDelayed3[i]++;
            }
          }
        }
      }
    }
    lateFlightChart.setData(days3, totalDelayed3);
    break;
  case 4:
    float days4[] = new float[7];
    for (int i = 1; i <= days4.length; i++) days4[i - 1] = i + 24;
    float totalDelayed4[] = new float[7];
    for (int j = 0; j < flights.flights.size(); j++) {
      for (int k = 0; k < airports.size(); k++) {
        Flight temp =flights.flights.get(j);
        if (temp.destinationCity.equals(airports.get(k))) {
          for (int i = 0; i < 7; i++) {
            if (flights.flights.get(j).date == i + 25 && flights.flights.get(j).isLate()) {
              totalDelayed4[i]++;
            }
          }
        }
      }
    }
    lateFlightChart.setData(days4, totalDelayed4);
    break;
  }
}

void getData(ArrayList<String> airports) {
  arrivals = new float[airports.size()];
  for (int i =0; i < 3; i++) {
    status[i] = 0;
  }
  totalArrivals = 0;

  for (int i =0; i< flights.flights.size(); i++) {
    tempFlight = flights.flights.get(i);

    for (int j = 0; j < airports.size(); j++) {
      tempFlight = flights.flights.get(i);
      if (tempFlight.destinationCity.equals(airports.get(j))) {
        arrivals[j] += 1;
        if (tempFlight.diverted) {
          status[1] += 1;
        } else if (tempFlight.cancelled) {
          status[2] += 1;
        } else {
          status[0] += 1;
        }
      }
    }
  }
  for (int i = 0; i< airports.size(); i++) {
    totalArrivals += arrivals[i];
  }
}
void getEmission(ArrayList<String> airports) {
  emissions = new float[airports.size()];
  trees = new float[airports.size()];
  for (int i =0; i< flights.flights.size(); i++) {
    tempFlight = flights.flights.get(i);

    for (int j = 0; j < airports.size(); j++) {
      tempFlight = flights.flights.get(i);
      if (tempFlight.originCity.equals(airports.get(j))) {
        emissions [j] += tempFlight.getCO2emission();
        trees[j] += tempFlight.getTreesNeeded();
      }
    }
  }
  for (int i=0; i< airports.size(); i++) {
    emissions[i] = emissions[i] / 1000000;
    trees[i] = trees[i] / 1000000;
  }
  
}
