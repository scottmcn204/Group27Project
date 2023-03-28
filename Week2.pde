import org.gicentre.utils.stat.*; //<>// //<>// //<>//
import controlP5.*;

final int SCREENX = 1500;
final int SCREENY = 800;
Table table;
Flight tempFlight;
int times[];
int distances[];
PFont myFont;
float textXpos = 0;
float textYpos = 0;
float arrivals[];
float status[];
String dests[];
ControlP5 cp5;
int zoom = 0;
int focus = 0;
BarChart barChart;
Chart myPieChart;
Flights flights;
//XYChart scatterplot;
boolean doneLoading;
String input ="";
ListBox l;
ArrayList<String> searchResults;
int p;

void settings()
{
  size(SCREENX, SCREENY);
}
void setup() {
  doneLoading = false;
  background(180);
  myFont = createFont("Arial", 16);
  cp5 = new ControlP5(this);
  thread("slowLoad");
  searchResults = new ArrayList<String>();
}
void slowLoad() {
  flights = new Flights();
  dests = new String[] {"ABQ", "ADQ", "ALB", "ANC", "ATL"};
  arrivals = new float[5];
  status = new float[3]; // 0 = on time, 1 = diverted, 2 = cancelled
  for (int i =0; i< flights.flights.size(); i++) {
    for (int j = 0; j < 5; j++) {
      tempFlight = flights.flights.get(i);
      if (tempFlight.destinationAirport.equals(dests[j])) {
        arrivals[j] += 1;
      }
    }
  }
  for (int i= 0; i < flights.flights.size(); i++) {
    tempFlight = flights.flights.get(i);
    if (tempFlight.diverted) {
      status[1] += 1;
    } else if (tempFlight.cancelled) {
      status[2] += 1;
    } else {
      status[0] += 1;
    }
  }

  PFont font = createFont("arial", 20);

  cp5 = new ControlP5(this);

  cp5.addTextfield("")
    .setPosition(700, 100)
    .setSize(300, 50)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255));
  textFont(font);

  l = cp5.addListBox("results")
    .setPosition(700, 150)
    .setSize(300, 400)
    .setItemHeight(25)
    .setColorBackground(color(255, 128))
    .setColorActive(color(0))
    .setColorForeground(color(255, 100, 0));
  p = 0;

  doneLoading = true;
}
void keyPressed() {
  if (key == 13) {
    search();
  }
}
void draw()
{
  if (!doneLoading) {
    background(50);
    textFont(myFont, 50);
    fill(250);
    text("Loading...", SCREENX/2 - 90, SCREENY/2 - 100);
  } else {
    background(50);
    textFont(myFont, 16);
    fill(250);
    textFont(myFont, 24);
    text("Search Bar", 25, 30);
    textFont(myFont, 16);
    for (int i = 0; (i < searchResults.size()); i++) {
      l.addItem(searchResults.get(i), p++); 
    }
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isAssignableFrom(Textfield.class)) {
    search();
  }
}

void search() {
  searchResults = new ArrayList<String>();
  int counter = 0;
  l.clear();
  for (int i = 0; (i < flights.airports.size()); i++) {
    if (flights.airports.get(i).toLowerCase().contains(cp5.get(Textfield.class, "").getText().toLowerCase())) {
      searchResults.add(flights.airports.get(i));
      counter++;
    }
    if (counter >= 20) {
      break;
    }
  }
}
