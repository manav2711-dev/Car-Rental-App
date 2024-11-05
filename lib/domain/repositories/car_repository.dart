import 'package:my_app/data/models/car.dart';

abstract class CarRepository{
  Future<List<Car>> fetchCars();
}