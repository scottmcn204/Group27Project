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
PieChart statusPie;
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
    .setPosition(1025, 520)
    .setRange(0, 100)
    .setSize(150, 40)
    .setColorForeground(color(#AADEDC))
    .setColorActive(color(#71A2A1))
    .setColorBackground(color(#425A5A))
    .setColorValue(color(0));
    
    
   cp5.addSlider("week")

    .setPosition(500, 520)
    .setRange(1, 4)
    .setSize(150, 40)
    .setColorForeground(color(#AADEDC))
    .setColorActive(color(#71A2A1))
    .setColorBackground(color(#425A5A))
    .setColorValue(color(0));

  statusPie = new PieChart(status, 30, 100);

 

  // times = flights.getTimes();
  //distances = flights.getDistances();
  doneLoading = true;
  
  lateFlightChart = new XYChart(this);
  lateFlightChart.showXAxis(true);
  lateFlightChart.showYAxis(true);
  lateFlightChart.setMinY(0);
  lateFlightChart.setPointSize(7);
  lateFlightChart.setLineWidth(2.5);
  lateFlightChart.setAxisLabelColour(250);
  lateFlightChart.setAxisValuesColour(250);
  lateFlightChart.setLineColour(color(#FF00A2));
  lateFlightChart.setPointColour(color(255));
  lateFlightChart.setXAxisLabel("Days of Selected Week");
  lateFlightChart.setYAxisLabel("Number of Late Flights");
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
    textFont(myFont, 24);
    text("Dashboard", 25, 30);
    
    statusPie.draw(60, 450);

    setLineGraphData(week);
    lateFlightChart.draw(425, 70, 500, 400);
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
