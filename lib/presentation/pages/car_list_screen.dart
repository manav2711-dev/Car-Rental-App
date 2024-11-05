import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/presentation/bloc/car_bloc.dart';
import 'package:my_app/presentation/bloc/car_state.dart';
import 'package:my_app/presentation/widgets/car_card.dart';
import '../../data/models/car.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state){
        if(state is CarsLoading){
          return Center(child: CircularProgressIndicator(),);
      }
        else if(state is CarsLoaded){
          return ListView.builder(
            itemCount: state.cars.length,
            itemBuilder: (context, index){
              return CarCard(car: state.cars[index]);
              },
          );
      }
        else if (state is CarsError){
          return Center(child: Text('error: ${state.message}'),);
      }
        return Container();
      },
      ),
    );
  }
}

