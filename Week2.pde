import org.gicentre.utils.stat.*;    //<>//
import controlP5.*;

final int SCREENX = 1500;
final int SCREENY = 900;
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
int date = 0;
BarChart barChart;
Chart myPieChart;
Flights flights;
XYChart scatterplot;
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
      if (tempFlight.destinationAirport.equals(dests[j])) {
        arrivals[j] += 1;
      }
    }
  }
  for (int i= 0; i < flights.flights.size(); i++){
    tempFlight = flights.flights.get(i);
    if (tempFlight.diverted){
      status[1] += 1;
    }
    else if (tempFlight.cancelled){
      status[2] += 1;
    }
    else{
      status[0] += 1;
    }
  }

  cp5.addSlider("zoom")
    .setPosition(30, 520)
    .setRange(0, 100)
    .setSize(150, 40)
    .setColorForeground(color(#AADEDC))
    .setColorActive(color(#71A2A1))
    .setColorBackground(color(#425A5A))
    .setColorValue(color(0));
    
    
   cp5.addSlider("date")
    .setPosition(1000, 475)
    .setRange(0, 31)
    .setSize(150, 40)
    .setColorForeground(color(#AADEDC))
    .setColorActive(color(#71A2A1))
    .setColorBackground(color(#425A5A))
    .setColorValue(color(0));


  myPieChart = cp5.addChart("pie")
    .setPosition(675, 200)
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
  barChart.setAxisLabelColour(250);
  barChart.setAxisValuesColour(250);
  times = flights.getTimes();
  distances = flights.getDistances();
/*  
  scatterplot = new XYChart(this);
   scatterplot.setData(parseFloat(distances),parseFloat(times));
  
  // Axis formatting and labels.
  scatterplot.showXAxis(true); 
  scatterplot.showYAxis(true); 
  scatterplot.setYFormat("#,###");
  scatterplot.setXAxisLabel("Distance covered (km)");
  scatterplot.setYAxisLabel("Duration of flight");
  scatterplot.setAxisLabelColour(250);
  scatterplot.setAxisValuesColour(250);
  // Symbol styles
  scatterplot.setPointColour(color(180,50,50,100));
  scatterplot.setPointSize(2);
  scatterplot.setMaxX(6000);
  scatterplot.setMinX(300);
  scatterplot.setMaxY(1000);
*/
  doneLoading = true;
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
    barChart.draw(30, 50, 500, 400);
    fill(250);
    text("Amount of Arrivals per Airport", 150, 485);
    textFont(myFont, 24);
    text("Dashboard", 25, 30);
    barChart.setMaxValue(500 + zoom * 400);
    fill(#3BE8E6);
    rect(700,100,20,20);
    fill(250);
    textFont(myFont, 16);
    text(("on time (" + int(status[0]) + " out of " + flights.flights.size() + ")"), 725,115);
    fill(#FFAF1A);
    rect(700,130,20,20);
    fill(250);
    text(("diverted (" + int(status[1]) + " out of " + flights.flights.size() + ")"), 725, 145);
    fill(#20396A);
    rect(700,160,20,20);
    fill(250);
    text(("cancelled (" + int(status[2]) + " out of " + flights.flights.size() + ")"), 725, 175);
    //scatterplot.setMaxX(6000 - (focus*50));
    //scatterplot.draw(1150,50,500,400);
  }
  
}
