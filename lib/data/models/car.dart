class Car{
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;
  

  Car({required this.model, required this.distance, required this.fuelCapacity, required this.pricePerHour,});

  factory Car.fromMap(Map<String, dynamic> map){
    return Car(
      model: map['model'],
      distance: (map['distance'] is int)? (map['distance']as int).toDouble(): map['distance'],
      fuelCapacity: (map['fuelCapacity'] is int)? (map['fuelCapacity']as int).toDouble(): map['fuelCapacity'],
      pricePerHour: (map['pricePerHour'] is int)? (map['pricePerHour']as int).toDouble(): map['pricePerHour'],
    );
  }
}