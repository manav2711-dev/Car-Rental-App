import 'package:my_app/data/datasources/firebase_car_data_source.dart';
import 'package:my_app/data/models/car.dart';
import 'package:my_app/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository{
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars(){
    return dataSource.getCars();
  }

}