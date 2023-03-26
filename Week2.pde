import org.gicentre.utils.stat.*; //<>// //<>// //<>//
import controlP5.*;

final int SCREENX = 1800;
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
int focus = 0;
BarChart barChart;
Chart myPieChart;
Flights flights;
//XYChart scatterplot;
boolean doneLoading;
String textValue ="";
ListBox l;

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

  cp5.addSlider("zoom")
    .setPosition(20, 500)
    .setRange(0, 100)
    .setSize(150, 40)
    .setColorForeground(color(#AADEDC))
    .setColorActive(color(#71A2A1))
    .setColorBackground(color(#425A5A))
    .setColorValue(color(0));


  //cp5.addSlider("focus")
  // .setPosition(1300, 450)
  // .setRange(0, 100)
  // .setSize(150, 40)
  // .setColorForeground(color(#AADEDC))
  // .setColorActive(color(#71A2A1))
  // .setColorBackground(color(#425A5A))
  // .setColorValue(color(0));


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

  //scatterplot = new XYChart(this);
  // scatterplot.setData(parseFloat(distances),parseFloat(times));

  //// Axis formatting and labels.
  //scatterplot.showXAxis(true);
  //scatterplot.showYAxis(true);
  //scatterplot.setYFormat("#,###");
  //scatterplot.setXAxisLabel("Distance covered (km)");
  //scatterplot.setYAxisLabel("Duration of flight");
  //scatterplot.setAxisLabelColour(250);
  //scatterplot.setAxisValuesColour(250);
  //// Symbol styles
  //scatterplot.setPointColour(color(180,50,50,100));
  //scatterplot.setPointSize(2);
  //scatterplot.setMaxX(6000);
  //scatterplot.setMinX(300);
  //scatterplot.setMaxY(1000);

  PFont font = createFont("arial", 20);

  cp5 = new ControlP5(this);

  cp5.addTextfield("")
    .setPosition(SCREENX - 400, 100)
    .setSize(200, 40)
    .setFont(font)
    .setFocus(true)
    .setColor(color(255));


  cp5.addBang("clear")
    .setPosition(SCREENX - 170, 100)
    .setSize(80, 40)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);


  l = cp5.addListBox("myList")
    .setPosition(100, 100)
    .setSize(120, 120)
    .setItemHeight(15)
    .setBarHeight(15)
    .setColorBackground(color(255, 128))
    .setColorActive(color(0))
    .setColorForeground(color(255, 100, 0))
    ;

  ////l.captionLabel().toUpperCase(true);
  //l.captionLabel().set("A Listbox");
  //l.captionLabel().setColor(0xffff0000);
  //l.captionLabel().style().marginTop = 3;
  //l.valueLabel().style().marginTop = 3;

  //for (int i=0; i<80; i++) {
  //  ListBoxItem lbi = l.addItem("item "+i, i);
  //  lbi.setColorBackground(0xffff0000);
  //}

  textFont(font);

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
    barChart.draw(40, 50, 600, 400);
    fill(250);
    text("Amount of Arrivals per Airport", 200, 485);
    textFont(myFont, 24);
    text("Dashboard", 25, 30);
    barChart.setMaxValue(500 + zoom * 400);
    fill(#3BE8E6);
    rect(800, 100, 20, 20);
    fill(250);
    textFont(myFont, 16);
    text(("on time (" + int(status[0]) + " out of " + flights.flights.size() + ")"), 825, 115);
    fill(#FFAF1A);
    rect(800, 130, 20, 20);
    fill(250);
    text(("diverted (" + int(status[1]) + " out of " + flights.flights.size() + ")"), 825, 145);
    fill(#20396A);
    rect(800, 160, 20, 20);
    fill(250);
    text(("cancelled (" + int(status[2]) + " out of " + flights.flights.size() + ")"), 825, 175);
    //scatterplot.setMaxX(6000 - (focus*50));
    //scatterplot.draw(1150,50,500,400);
  }
}
