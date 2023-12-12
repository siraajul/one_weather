class Weather {
  final String cityName;
  final double temperature;
  final String minCondition;

  Weather({required this.cityName,
    required this.minCondition,
    required this.temperature});

  factory Weather.fromJson(Map<String, dynamic>json){
    return Weather(cityName: json['name'],
        minCondition: json['weather'][0]['main'],
        temperature: json['main']['temp'].toDouble(),
    );
  }
}
