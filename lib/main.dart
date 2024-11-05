import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/firebase_options.dart';
import 'package:my_app/injection_container.dart';
import 'package:my_app/presentation/bloc/car_bloc.dart';
import 'package:my_app/presentation/bloc/car_event.dart';
import 'package:my_app/presentation/pages/MapsDetailsPage.dart';
import 'package:my_app/presentation/pages/onboarding_page.dart';
import 'package:my_app/presentation/pages/otp_screen.dart';
import 'package:my_app/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/material/text_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await FirebaseAppCheck.instance.activate(
  );
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
      ],
      child: BlocProvider(
        create: (_) => getIt<CarBloc>()..add(LoadCars()),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: OnboardingPage(),
        ),
      ),
    );
  }
}


