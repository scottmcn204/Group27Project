class Flight {
  String date;
  String airlineCarrier;
  int flightNumber;
  String originAirport;
  String originCity;
  String originState;
  int originWAC;
  String destinationAirport;
  String destinationCity;
  String destinationState;
  int destinationWAC;
  int CRSDepartureTime;
  int actualDepartureTime;
  int CRSArrivalTime;
  int actualArrivalTime;
  boolean cancelled;
  boolean diverted;
  int distance;
  String[] airports = {
    New York, NY
    Los Angeles, CA
    St. Louis, MO
    Chicago, IL
    Charlotte, NC
    Atlanta, GA
    Dallas/Fort Worth, TX
    Charlotte Amalie, VI
    Philadelphia, PA
    Austin, TX
    Las Vegas, NV
    San Jose, CA
    Honolulu, HI
    Detroit, MI
    Miami, FL
    Tucson, AZ
    Wichita, KS
    Orlando, FL
    Indianapolis, IN
    Boston, MA
    San Diego, CA
    Santa Ana, CA
    Jacksonville, FL
    Phoenix, AZ
    Raleigh/Durham, NC
    Tulsa, OK
    Newark, NJ
    Nashville, TN
    Washington, DC
    Des Moines, IA
    Fort Lauderdale, FL
    El Paso, TX
    Kahului, HI
    Denver, CO
    New Orleans, LA
    San Francisco, CA
    Baltimore, MD
    Burbank, CA
    Rochester, NY
    West Palm Beach/Palm Beach, FL
    Reno, NV
    Key West, FL
    Eugene, OR
    Seattle, WA
    Cleveland, OH
    Tampa, FL
    Columbus, OH
    Fort Myers, FL
    Christiansted, VI
    San Juan, PR
    Salt Lake City, UT
    Memphis, TN
    Kansas City, MO
    Minneapolis, MN
    Ontario, CA
    Albuquerque, NM
    Hartford, CT
    Spokane, WA
    Cincinnati, OH
    Houston, TX
    Richmond, VA
    Sacramento, CA
    Wilmington, NC
    Greer, SC
    Jackson, WY
    San Antonio, TX
    Birmingham, AL
    Providence, RI
    Santa Barbara, CA
    Charleston, SC
    Fresno, CA
    Buffalo, NY
    Missoula, MT
    Palm Springs, CA
    Oklahoma City, OK
    Eagle, CO
    Portland, OR
    Pittsburgh, PA
    Norfolk, VA
    Sarasota/Bradenton, FL
    Grand Rapids, MI
    Albany, NY
    Gunnison, CO
    Hayden, CO
    Mission/McAllen/Edinburg, TX
    Bozeman, MT
    Kona, HI
    Montrose/Delta, CO
    Savannah, GA
    Omaha, NE
    Madison, WI
    Milwaukee, WI
    Lihue, HI
    Pensacola, FL
    Portland, ME
    Syracuse, NY
    Greensboro/High Point, NC
    Bismarck/Mandan, ND
    Aspen, CO
    Grand Junction, CO
    Yuma, AZ
    Harrisburg, PA
    Knoxville, TN
    Harlingen/San Benito, TX
    Idaho Falls, ID
    Flagstaff, AZ
    Bristol/Johnson City/Kingsport, TN
    Santa Fe, NM
    Bend/Redmond, OR
    Manchester, NH
    Cedar Rapids/Iowa City, IA
    Arcata/Eureka, CA
    Killeen, TX
    St. George, UT
    Scranton/Wilkes-Barre, PA
    Colorado Springs, CO
    Shreveport, LA
    San Angelo, TX
    Long Beach, CA
    Gainesville, FL
    South Bend, IN
    Fort Smith, AR
    Roswell, NM
    Fort Wayne, IN
    Sioux Falls, SD
    Billings, MT
    Baton Rouge, LA
    Bakersfield, CA
    Corpus Christi, TX
    Green Bay, WI
    Durango, CO
    San Luis Obispo, CA
    Traverse City, MI
    Fargo, ND
    Lexington, KY
    Huntsville, AL
    White Plains, NY
    Little Rock, AR
    Columbia, MO
    Columbia, SC
    Evansville, IN
    Toledo, OH
    Fayetteville, AR
    Springfield, MO
    Brownsville, TX
    Bloomington/Normal, IL
    Longview, TX
    Laredo, TX
    Gulfport/Biloxi, MS
    Peoria, IL
    Kalamazoo, MI
    Jackson/Vicksburg, MS
    Waterloo, IA
    La Crosse, WI
    Lawton/Fort Sill, OK
    Abilene, TX
    Lake Charles, LA
    Chattanooga, TN
    Dubuque, IA
    Moline, IL
    Manhattan/Ft. Riley, KS
    Marquette, MI
    Boise, ID
    Lubbock, TX
    Texarkana, AR
    Tyler, TX
    Champaign/Urbana, IL
    Tallahassee, FL
    Montgomery, AL
    Mobile, AL
    Stillwater, OK
    Alexandria, LA
    Monterey, CA
    Garden City, KS
    Grand Island, NE
    Louisville, KY
    Rochester, MN
    Springfield, IL
    Waco, TX
    Monroe, LA
    Dayton, OH
    College Station/Bryan, TX
    Myrtle Beach, SC
    Wichita Falls, TX
    Lansing, MI
    Beaumont/Port Arthur, TX
    Appleton, WI
    Asheville, NC
    Lafayette, LA
    Valparaiso, FL
    Del Rio, TX
    Midland/Odessa, TX
    Allentown/Bethlehem/Easton, PA
    Flint, MI
    Mosinee, WI
    Burlington, VT
    Charlottesville, VA
    Roanoke, VA
    Hilton Head, SC
    Akron, OH
    Erie, PA
    Bangor, ME
    Daytona Beach, FL
    Melbourne, FL
    Columbus, GA
    Panama City, FL
    Augusta, GA
    New Bern/Morehead/Beaufort, NC
    Charleston/Dunbar, WV
    Jacksonville/Camp Lejeune, NC
    Fayetteville, NC
    Santa Rosa, CA
    Medford, OR
    Amarillo, TX
    Rapid City, SD
    Newport News/Williamsburg, VA
    Greenville, NC
    Lynchburg, VA
    State College, PA
    Florence, SC
    Ashland, WV
    Ithaca/Cortland, NY
    Watertown, NY
    Salisbury, MD
    Islip, NY
    Worcester, MA
    Anchorage, AK
    Dallas, TX
    Fairbanks, AK
    Oakland, CA
    Kotzebue, AK
    Juneau, AK
    Adak Island, AK
    Yakima, WA
    Great Falls, MT
    Redding, CA
    Walla Walla, WA
    Pullman, WA
    Pasco/Kennewick/Richland, WA
    Everett, WA
    Wenatchee, WA
    Kalispell, MT
    Bellingham, WA
    Sun Valley/Hailey/Ketchum, ID
    Helena, MT
    Kodiak, AK
    Bethel, AK
    Barrow, AK
    Ketchikan, AK
    Sitka, AK
    Ponce, PR
    Aguadilla, PR
    Minot, ND
    Elmira/Corning, NY
    Grand Forks, ND
    Lewiston, ID
    Escanaba, MI
    Aberdeen, SD
    Lincoln, NE
    Alpena, MI
    Sault Ste. Marie, MI
    Twin Falls, ID
    Hibbing, MN
    Williston, ND
    Rhinelander, WI
    Iron Mountain/Kingsfd, MI
    Butte, MT
    Bemidji, MN
    Pellston, MI
    International Falls, MN
    Brainerd, MN
    Cedar City, UT
    Casper, WY
    Elko, NV
    Pocatello, ID
    Duluth, MN
    Brunswick, GA
    Albany, GA
    Saginaw/Bay City/Midland, MI
    Dothan, AL
    Valdosta, GA
    Columbus, MS
    Binghamton, NY
    Newburgh/Poughkeepsie, NY
    Trenton, NJ
    Punta Gorda, FL
    St. Petersburg, FL
    Sanford, FL
    St. Cloud, MN
    Rockford, IL
    Provo, UT
    Belleville, IL
    Portsmouth, NH
    Plattsburgh, NY
    Concord, NC
    Stockton, CA
    Hilo, HI
    Atlantic City, NJ
    Latrobe, PA
    Guam, TT
    Saipan, TT
    Cody, WY
    Hobbs, NM
    Dickinson, ND
    Dodge City, KS
    Clarksburg/Fairmont, WV
    Lewisburg, WV
    Prescott, AZ
    Scottsbluff, NE
    Alamosa, CO
    Cape Girardeau, MO
    Fort Leonard Wood, MO
    Hancock/Houghton, MI
    Devils Lake, ND
    Jamestown, ND
    Cheyenne, WY
    Eau Claire, WI
    Kearney, NE
    Joplin, MO
    Muskegon, MI
    Decatur, IL
    Fort Dodge, IA
    Paducah, KY
    Sioux City, IA
    Gillette, WY
    Rock Springs, WY
    Johnstown, PA
    Salina, KS
    Laramie, WY
    North Platte, NE
    Ogdensburg, NY
    Mason City, IA
    Staunton, VA
    Pueblo, CO
    Sheridan, WY
    Vernal, UT
    Riverton/Lander, WY
    Hattiesburg/Laurel, MS
    Hays, KS
    Moab, UT
    Liberal, KS
    Victoria, TX
    Meridian, MS
    Bishop, CA
    Nome, AK
    Dillingham, AK
    King Salmon, AK
    Cordova, AK
    Yakutat, AK
    Petersburg, AK
    Wrangell, AK
    Santa Maria, CA
    "Niagara Falls, NY",
    "Hagerstown, MD",
    "Presque Isle/Houlton, ME",
    "Pierre, SD",
    "Watertown, SD",
    "North Bend/Coos Bay, OR",
    "Deadhorse, AK",
    "Wilmington, DE",
    "Ogden, UT",
    "Pago Pago, TT",
    "Owensboro, KY"
  };

  Flight(String date, String airlineCarrier, int flightNumber, String originAirport, String originCity,
    String originState, int originWAC, String destinationAirport, String destinationCity, String destinationState,
    int destinationWAC, int CRSDepartureTime, int actualDepartureTime, int CRSArrivalTime, int actualArrivalTime, boolean cancelled,
    boolean diverted, int distance) {
    this.date = date;
    this.airlineCarrier = airlineCarrier;
    this.flightNumber = flightNumber;
    this.originAirport = originAirport;
    this.originCity = originCity;
    this.originState = originState;
    this.originWAC = originWAC;
    this.destinationAirport = destinationAirport;
    this.destinationCity = destinationCity;
    this.destinationState = destinationState;
    this.destinationWAC = destinationWAC;
    this.CRSDepartureTime = CRSDepartureTime;
    this.actualDepartureTime = actualDepartureTime;
    this.CRSArrivalTime = CRSArrivalTime;
    this.actualArrivalTime = actualArrivalTime;
    this.cancelled = cancelled;
    this.diverted = diverted;
    this.distance = distance;
  }
}
