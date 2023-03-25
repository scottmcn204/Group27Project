import org.gicentre.utils.stat.*;    //<>// //<>//
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
BarChart chart;
chartBar arrivalsAirports;
Chart myPieChart;
Flights flights;
XYChart scatterplot;
boolean doneLoading;
int totalArrivals;

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
    }
  }
  
  for (int i = 0; i<5; i++){
    totalArrivals += arrivals[i];
  }
  
  chart = new BarChart(this);
  arrivalsAirports = new chartBar(chart,arrivals, dests);

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
    .setRange(0, 1000)
    .setView(Chart.PIE)
    .setCaptionLabel("DIVERTED")
    ;
  myPieChart.getColor().setBackground(color(255, 100));
  myPieChart.addDataSet("flights");
  myPieChart.setColors("flights", color(#3BE8E6), color(#FFAF1A), color(#20396A));
  myPieChart.setData("flights", status);

  // times = flights.getTimes();
  //distances = flights.getDistances();
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
    arrivalsAirports.draw();
    fill(250);
    text("Number of Arrivals per Airport", 150, 485);
    textFont(myFont, 24);
    text("Dashboard", 25, 30);
    
    fill(#3BE8E6);
    rect(700,100,20,20);
    fill(250);
    textFont(myFont, 16);

    text(("on time (" + int(status[0]) + " out of " + totalArrivals + ")"), 725,115);
    fill(#FFAF1A);
    rect(700,130,20,20);
    fill(250);

    text(("diverted (" + int(status[1]) + " out of " + totalArrivals + ")"), 725, 145);

    fill(#20396A);
    rect(700,160,20,20);
    fill(250);
    text(("cancelled (" + int(status[2]) + " out of " + totalArrivals + ")"), 725, 175);

    //scatterplot.setMaxX(6000 - (focus*50));
    //scatterplot.draw(1150,50,500,400);
  }
  
}
