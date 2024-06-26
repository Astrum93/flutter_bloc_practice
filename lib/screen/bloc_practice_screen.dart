import 'package:bloc_practice/common/widget/button/green_button.dart';
import 'package:bloc_practice/common/widget/width_height_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BlocPracticeScreen extends StatelessWidget {
  const BlocPracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Practice'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GreenButton(
                onTap: () {
                  context.go('/counter');
                },
                text: 'Counter',
              ),
              height20,
              GreenButton(
                onTap: () {
                  context.go('/api');
                },
                text: 'API',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
