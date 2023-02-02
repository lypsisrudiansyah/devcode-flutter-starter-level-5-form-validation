import 'package:devcode_flutter_starter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Selamat datang di Devcode!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          const SizedBox(height: 10,),
          const Text('Silahkan klik tombol di bawah ini untuk melihat hasil akhir dari perubahan yang kamu lakukan.', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          const SizedBox(height: 6,),
          TextButton(
            key: const Key('router-button'),
            onPressed: () => Get.toNamed(Routes.hello),
            child: const Text('Lihat hasil',
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
