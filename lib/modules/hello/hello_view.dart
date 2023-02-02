import 'package:devcode_flutter_starter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelloView extends StatelessWidget {
  const HelloView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/png/devcode-logo.png', key: const Key('devcode-logo'), width: 200, height: 200),
          const Align(
            alignment: Alignment.center, child: Text("I'm ready for the next challenge!", key: Key('devcode-title'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          ),
          const SizedBox(height: 8,),
          TextButton(
            key: const Key('router-button'),
            onPressed: () {
              Get.toNamed(Routes.retrieveData);
            },
            child: const Text('Level Selanjutnya',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.lightBlueAccent,
              // minimumSize: Size(double.infinity, minimumSize ?? 50),
            ),
          )
        ],
      ),
    );
  }
}
