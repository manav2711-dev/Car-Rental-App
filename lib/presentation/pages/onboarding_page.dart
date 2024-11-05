
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/presentation/pages/car_list_screen.dart';
import 'package:my_app/presentation/pages/register_screen.dart';
import 'package:my_app/presentation/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<Auth>(context, listen: false);
    return Scaffold(

      backgroundColor: Color(0xff2C2B34),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child:Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/onboarding.png'),
                fit: BoxFit.cover
                )
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Premium cars \nEnjoy the luxury',
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold ),
                  ),
                  SizedBox(height: 10,),
                  Text('Premium and prestige car daily rental. \nExperiencd the thrill at a lower price',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 320,
                    height: 54,
                    child: ElevatedButton(
                        onPressed: (){

                          ap.isSignedIn == true  //when true,then fetch shared prefrence data
                              ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=> const RegisterScreen()))
                          : Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context)=>CarListScreen()),
                                  (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,

                        ),
                        child: Text(
                            'let\'s Go',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )

    );
  }
}
