import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/data/datasources/firebase_car_data_source.dart';
import 'package:my_app/data/repositories/car_repository_impl.dart';
import 'package:my_app/domain/repositories/car_repository.dart';
import 'package:my_app/domain/usecases/get_cars.dart';
import 'package:my_app/presentation/bloc/car_bloc.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try{
    getIt.registerLazySingleton(()=> FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
            () =>FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
    );
    getIt.registerLazySingleton<CarRepository>(
            () =>CarRepositoryImpl(getIt<FirebaseCarDataSource>())
    );
    getIt.registerLazySingleton<GetCars>(
            () =>GetCars(getIt<CarRepository>())
    );
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  }catch(e){
    throw e;
  }
}