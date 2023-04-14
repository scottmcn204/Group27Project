import org.gicentre.utils.stat.*;
import controlP5.*;
/**
* The ChartBar Class is used to implement the two bar charts used
*   throughout the program.
* Using giCentre's BarChart
*/
class ChartBar {
  BarChart barChart;
  String[] airports;

  ChartBar(BarChart chart, String label) {
    barChart = chart;
    barChart.setMinValue(0);
    barChart.setMaxValue(1000);
    barChart.showValueAxis(true);
    barChart.showCategoryAxis(true);
    barChart.setBarColour(color(0, 150, 255));
    barChart.setAxisLabelColour(color(0, 45, 90));
    barChart.setAxisValuesColour(color(0, 45, 90));
    barChart.setCategoryAxisLabel(label);
    barChart.setBarGap(6);
  }

  void setData(float[] data, ArrayList<String> labels, String label) {
    barChart.setCategoryAxisLabel(label);
    airports = new String[labels.size()];
    for (int i = 0; i < labels.size(); i++) {
      boolean found = false;
      int count = 0;
      while (!found) {
        Flight temp = flights.flights.get(count);
        if (temp.originCity.equals(labels.get(i))) {
          airports[i] = temp.originAirport;
          found = true;
        }
        count += 1;
      }
    }
    barChart.setData(data);
    barChart.setBarLabels(airports);
  }

  void transposeGraph() {
    barChart.transposeAxes(true);
  }
  void NotTransposedGraph() {
    barChart.transposeAxes(false);
  }

  void draw(int xpos, int ypos, int zoomer, int slider) {
    barChart.draw(xpos, ypos, 600, 400);
    barChart.setMaxValue(1000 + slider * zoomer);
  }
}
