import http.requests.*;
int state = 0;

String apiKey = "OY9L7eYd91XAHZ3u4XRTAVlaAQz2nD4v";
String[] concept_types = {
  "nytd_geo", 
  "nytd_per", 
  "nytd_org", 
  "nytd_des"    
};
String specific_concept_name = "Kansas";

void setup() 
{
  size(400, 400);
  smooth();

  GetRequest get = new GetRequest("http://api.nytimes.com/svc/semantic/v2/concept/name/" + 
    concept_types[0] + "/" + specific_concept_name + ".json?fields=all&api-key=" + apiKey);
  get.send();

  //println("Reponse Content: " + get.getContent());
  //println("Reponse Content-Length Header: " + get.getHeader("Content-Length"));

  JSONObject response = parseJSONObject(get.getContent());

  JSONArray results = response.getJSONArray("results");
  JSONObject results_obj = results.getJSONObject(0);

  JSONArray links= results_obj.getJSONArray("links");  
  for (int i = 1; i < links.size(); i++) {
    JSONObject element = links.getJSONObject(i);
    String link = element.getString("link"); 
    println("link: " + link);
  }

  JSONArray geocodes = results_obj.getJSONArray("geocodes");
  JSONObject geocodes_obj = geocodes.getJSONObject(0);
  float latitude = geocodes_obj.getFloat("latitude");
  float longitude = geocodes_obj.getFloat("longitude");
  String timeZone = geocodes_obj.getString("time_zone_id");
  println(" ");
  println("latitude: " + latitude);
  println("longitude: " + longitude);
  println("timeZone: " + timeZone);

}
