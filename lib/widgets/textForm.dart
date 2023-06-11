import 'package:flutter/material.dart';

class EnterText extends StatelessWidget {
  EnterText({
    super.key,
    required this.controller,
    required this.text,
    required this.icon,
    required this.obscure,
  });
  var controller = TextEditingController();
  var text = '';
  final Icon icon;
  bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        obscureText: obscure,
        key: ValueKey(text.toString()),
        controller: controller,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please Enter your $text';
          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@gmail\.com$').hasMatch(val)) {
            return 'Please enter a valid $text';
          }
          //return null;
          return null;
        },
        decoration: InputDecoration(
          icon: icon,
          hintText: " $text",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
