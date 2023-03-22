import org.gicentre.utils.stat.*;    // For chart classes.
import controlP5.*;

final int SCREENX = 1200;
final int SCREENY = 600;
Table table;
Flight tempFlight;
//ArrayList<Flight> flights;
PFont myFont;
float textXpos = 0;
float textYpos = 0;
float arrivals[];
String dests[];
ControlP5 cp5;
int sliderValue = 0;
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
  for (int i =0; i< flights.flights.size(); i++) {
    for (int j = 0; j < 5; j++) {
      tempFlight = flights.flights.get(i);
      if (tempFlight.DEST.equals(dests[j])) {
        arrivals[j] += 1;
      }
    }
  }

  cp5.addSlider("sliderValue")
    .setPosition(20, 500)
    .setRange(0, 100)
    .setSize(150, 40)
    .setColorForeground(color(#AADEDC))
    .setColorActive(color(#71A2A1))
    .setColorBackground(color(#425A5A))
    .setColorValue(color(0));


  myPieChart = cp5.addChart("pie")
    .setPosition(800, 200)
    .setSize(300, 300)
    .setRange(0, 5000)
    .setView(Chart.PIE)
    ;
  myPieChart.getColor().setBackground(color(255, 100));
  myPieChart.addDataSet("flights");
  myPieChart.setColors("flights", color(255, 0, 255), color(255, 0, 0) );
  myPieChart.setData("flights", arrivals);
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
    background(255);
    textFont(myFont, 16);
    barChart.draw(20, 50, width-600, height-200);
    text("Amount of Arrivals per Airport", 200, 485);
    fill(12);
    textFont(myFont, 24);
    text("Dashboard", 25, 30);
    barChart.setMaxValue(500 + sliderValue * 400);
  }
}
