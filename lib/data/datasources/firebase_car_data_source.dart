
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/data/models/car.dart';

class FirebaseCarDataSource{
  final FirebaseFirestore firestore;
  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async{
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Car.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }
}