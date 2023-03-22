import java.net.*;
import java.util.Scanner;
import org.json.*;
String strURL = "https://firestore.googleapis.com/v1/projects/groupproject27-a070c/databases/(default)/documents/Flights";
try{
  URL url = new URL(strURL);
  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  connection.setRequestMethod("GET");
  connection.connect();
  int responsecode = connection.getResponseCode();
  
  String inline = "";
  Scanner scanner = new Scanner(url.openStream());
  while(scanner.hasNext()){
    inline += scanner.nextLine();
  }
  scanner.close();
  
  JSONParser parse = new JSONParser();
  JSONObject dataObj = (JSONObject) parse.parse(inline);
  
  JSONObject object = (JSONObject) dataObj.get("documents");
  println(object.get("timestampValue"));
  
  
  
  
}
catch(Exception e){
}
