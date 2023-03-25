import org.gicentre.utils.stat.*; //<>//
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
float late[];
String dests[];
ControlP5 cp5;
int zoom = 0;
int date = 0;
BarChart chart;
chartBar arrivalsAirports;
int week = 0;
BarChart barChart;
Chart myPieChart;
Flights flights;
XYChart lateFlightChart;
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
    tempFlight = flights.flights.get(i);
    if (tempFlight.isLate()) {
      
    }
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
    
    
   cp5.addSlider("week")

    .setPosition(1000, 475)
    .setRange(1, 4)
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
  
  lateFlightChart = new XYChart(this);
  lateFlightChart.showXAxis(true);
  lateFlightChart.showYAxis(true);
  lateFlightChart.setMinY(0);
  lateFlightChart.setPointSize(5);
  lateFlightChart.setLineWidth(2);
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
    setLineGraphData(week);
    lateFlightChart.draw(950, 30, 500, 400);
    //scatterplot.setMaxX(6000 - (focus*50));
    //scatterplot.draw(1150,50,500,400);
  }
}
void setLineGraphData(int week) {
   switch (week) {
     case 1:
       float days[] = new float[10];
       for (int i = 1; i <= days.length; i++) days[i - 1] = i;
       float totalDelayed[] = new float[10];
       for (int j = 0; j < flights.flights.size(); j++) {
         for (int i = 0; i < 10; i++) {
           if (flights.flights.get(j).date == i + 1 && flights.flights.get(j).isLate())
             totalDelayed[i]++;
         }
       }
       lateFlightChart.setData(days, totalDelayed);
       break;
     case 2:
       float days2[] = new float[7];
       for (int i = 1; i <= days2.length; i++) days2[i - 1] = i + 10;
       float totalDelayed2[] = new float[7];
       for (int j = 0; j < flights.flights.size(); j++) {
         for (int i = 0; i < 7; i++) {
           if (flights.flights.get(j).date == i + 11 && flights.flights.get(j).isLate())
             totalDelayed2[i]++;
         }
       }
       lateFlightChart.setData(days2, totalDelayed2);
       break;
     case 3:
       float days3[] = new float[7];
       for (int i = 1; i <= days3.length; i++) days3[i - 1] = i + 17;
       float totalDelayed3[] = new float[7];
       for (int j = 0; j < flights.flights.size(); j++) {
         for (int i = 0; i < 7; i++) {
           if (flights.flights.get(j).date == i + 18 && flights.flights.get(j).isLate())
             totalDelayed3[i]++;
         }
       }
       lateFlightChart.setData(days3, totalDelayed3);
       break;
     case 4:
       float days4[] = new float[7];
       for (int i = 1; i <= days4.length; i++) days4[i - 1] = i + 24;
       float totalDelayed4[] = new float[7];
       for (int j = 0; j < flights.flights.size(); j++) {
         for (int i = 0; i < 7; i++) {
           if (flights.flights.get(j).date == i + 25 && flights.flights.get(j).isLate())
             totalDelayed4[i]++;
         }
       }
       lateFlightChart.setData(days4, totalDelayed4);
       break;
   }
}
