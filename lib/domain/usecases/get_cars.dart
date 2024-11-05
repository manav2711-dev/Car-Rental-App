import 'package:my_app/domain/repositories/car_repository.dart';

import '../../data/models/car.dart';

class GetCars{
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async{
    return await repository.fetchCars();
  }
}