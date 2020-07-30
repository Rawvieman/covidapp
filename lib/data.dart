class Data {
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int timestamp;

  Data(
      {this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.timestamp});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      timestamp: json['updated'],
    );
  }
}
