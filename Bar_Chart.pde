import org.gicentre.utils.stat.*;    //<>//
import controlP5.*;

class chartBar{       
  BarChart barChart;
  
  chartBar(BarChart chart, float[] data, String[] labels){
  barChart = chart;
  barChart.setData(data);
  barChart.setMinValue(0);
  barChart.setMaxValue(1000);
  
  barChart.showValueAxis(true);
  barChart.showCategoryAxis(true);
  barChart.setBarLabels(labels);
  barChart.setBarColour(color(200, 80, 80, 150));
  barChart.setAxisLabelColour(250);
  barChart.setAxisValuesColour(250);
  
 }
 
 void setData(float[] data, String[] labels){
   barChart.setBarLabels(labels);
   barChart.setData(data);
 }
 
 void draw(){
   barChart.draw(15, 50, 500, 400);
   barChart.setMaxValue(500 + zoom * 400);
 }
}
