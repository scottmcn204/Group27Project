import org.gicentre.utils.stat.*;    // For chart classes. //<>// //<>// //<>//
import controlP5.*;

final int SCREENX = 1800;
final int SCREENY = 900;
Table table;
Flight tempFlight;
//ArrayList<Flight> flights;
PFont myFont;
float textXpos = 0;
float textYpos = 0;
float arrivals[];
float status[];
String dests[];
ControlP5 cp5;
int zoom = 0;
BarChart barChart;
Chart myPieChart;
Flights flights;
boolean doneLoading;

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
}
void slowLoad() {
  flights = new Flights();
  dests = new String[] {"ABQ", "ADQ", "ALB", "ANC", "ATL"};
  arrivals = new float[5];
  status = new float[3]; // 0 = on time, 1 = diverted, 2 = cancelled
  for (int i =0; i< flights.flights.size(); i++) {
    for (int j = 0; j < 5; j++) {
      tempFlight = flights.flights.get(i);
      if (tempFlight.DEST.equals(dests[j])) {
        arrivals[j] += 1;
      }
    }
  }
  for (int i= 0; i < flights.flights.size(); i++){
    tempFlight = flights.flights.get(i);
    if (tempFlight.DIVERTED){
      status[1] += 1;
    }
    else if (tempFlight.CANCELLED){
      status[2] += 1;
    }
    else{
      status[0] += 1;
    }
  }

  cp5.addSlider("zoom")
    .setPosition(20, 500)
    .setRange(0, 100)
    .setSize(150, 40)
    .setColorForeground(color(#AADEDC))
    .setColorActive(color(#71A2A1))
    .setColorBackground(color(#425A5A))
    .setColorValue(color(0));


  myPieChart = cp5.addChart("pie")
    .setPosition(775, 200)
    .setSize(300, 300)
    .setRange(0, 5000)
    .setView(Chart.PIE)
    .setCaptionLabel("DIVERTED")
    ;
  myPieChart.getColor().setBackground(color(255, 100));
  myPieChart.addDataSet("flights");
  myPieChart.setColors("flights", color(#3BE8E6), color(#FFAF1A), color(#20396A));
  myPieChart.setData("flights", status);


  //<>//
  barChart = new BarChart(this);
  barChart.setData(arrivals);

  // Axis scaling
  barChart.setMinValue(0);
  barChart.setMaxValue(1000);

  barChart.showValueAxis(true);
  barChart.showCategoryAxis(true);
  barChart.setBarLabels(dests);
  barChart.setBarColour(color(200, 80, 80, 150));
  doneLoading = true;
}

void draw()
{
  if (!doneLoading) {
    background(255);
    textFont(myFont, 50);
    text("Loading...", SCREENX/2 - 90, SCREENY/2 - 100);
    fill(12);
  } else {
    background(color(222,225,230));
    textFont(myFont, 16);
    barChart.draw(40, 50, 600, 400);
    text("Amount of Arrivals per Airport", 200, 485);
    fill(12);
    textFont(myFont, 24);
    text("Dashboard", 25, 30);
    barChart.setMaxValue(500 + zoom * 400);
    fill(#3BE8E6);
    rect(800,100,20,20);
    fill(12);
    textFont(myFont, 16);
    text(("on time (" + int(status[0]) + " out of " + flights.flights.size() + ")"), 825,115);
    fill(#FFAF1A);
    rect(800,130,20,20);
    fill(12);
    text(("diverted (" + int(status[1]) + " out of " + flights.flights.size() + ")"), 825, 145);
    fill(#20396A);
    rect(800,160,20,20);
    fill(12);
    text(("cancelled (" + int(status[2]) + " out of " + flights.flights.size() + ")"), 825, 175);
  }
  
  
}
