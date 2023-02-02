import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final String title;
  final String hint;
  final Function(String value) onChanged;
  final TextInputType textInputType;
  final TextEditingController? textEditingController;
  final String? error;
  final String? errorKey;

  const FormInput({Key? key, this.errorKey, this.error, required this.textEditingController, required this.title, required this.hint, required this.onChanged, required this.textInputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        const SizedBox(height: 4,),
        TextFormField(
          keyboardType: textInputType,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          onChanged: (value) => onChanged(value.trim()),
          style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
          controller: textEditingController,
          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black26),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black87), borderRadius: BorderRadius.circular(6)),
            enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.black87), borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor), borderRadius: BorderRadius.circular(6)),
            errorMaxLines: 2,
            suffixIconConstraints: const BoxConstraints(maxHeight: 30, maxWidth: 30),
            errorStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.red),
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 4,),
          Text(error ?? '', key: Key(errorKey ?? ''), style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.red),),
        ]
      ],
    );
  }
}
