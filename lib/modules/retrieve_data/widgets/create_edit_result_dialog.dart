import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEditResultDialog extends StatelessWidget {
  final String title;
  final String fullname;
  final String phone;
  final String email;

  const CreateEditResultDialog({Key? key, required this.title, required this.fullname, required this.phone, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
          const SizedBox(height: 16,),
          Text(fullname, key: const Key('fullname'), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          const SizedBox(height: 6,),
          Text(phone, key: const Key('phone'), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          const SizedBox(height: 6,),
          Text(email, key: const Key('email'), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
          const SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  key: const Key('ok'),
                  onPressed: () => Get.back(),
                  child: const Text('OK', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.green,
                    // minimumSize: Size(double.infinity, minimumSize ?? 50),
                  ),
                ),
              ),
            ],
          )
        ],
      ).paddingAll(16),
    );
  }
}