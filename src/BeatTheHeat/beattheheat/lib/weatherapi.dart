class WeatherForecast {
  String? date;
  int? temperatureC;
  int? temperatureF;
  int? humidity;
  String? summary;
  String? city;

  WeatherForecast(
      {this.date,
      this.temperatureC,
      this.temperatureF,
      this.humidity,
      this.summary,
      this.city});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    temperatureC = json['temperatureC'];
    temperatureF = json['temperatureF'];
    humidity = json['humidity'];
    summary = json['summary'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['temperatureC'] = this.temperatureC;
    data['temperatureF'] = this.temperatureF;
    data['humidity'] = this.humidity;
    data['summary'] = this.summary;
    data['city'] = this.city;
    return data;
  }
}