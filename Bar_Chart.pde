import org.gicentre.utils.stat.*;
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
  barChart.setBarColour(color(#C1E5B7));
  barChart.setAxisLabelColour(250);
  barChart.setAxisValuesColour(250);
  barChart.setCategoryAxisLabel("Number of arrivals per airport");
  barChart.setBarGap(4.2);

 }
 
 void setData(float[] data, String[] labels){
   barChart.setBarLabels(labels);
   barChart.setData(data);
 }
 
 void draw(){
   barChart.draw(900, 70, 600, 400);
   barChart.setMaxValue(1000 + zoom * 300);
 }
}
