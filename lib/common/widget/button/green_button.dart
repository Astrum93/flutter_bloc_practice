import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const GreenButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 200,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.lightGreenAccent,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(1, 3)),
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          'Counter',
        ),
      ),
    );
  }
}
