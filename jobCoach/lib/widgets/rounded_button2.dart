import 'package:flutter/material.dart';

class RoundedButton2 extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final bool loading;
  const RoundedButton2({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.white,
    this.textColor = Colors.blue,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          onPressed: () => press (),
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          child: Center(
            child: loading ?
            const SizedBox(
              height: 15,
              width:15,
              child: CircularProgressIndicator(
                  strokeWidth:2,
                  color:Colors.blue),
            )
                : Text(
              text,style: TextStyle(color: textColor,fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    );
  }
}