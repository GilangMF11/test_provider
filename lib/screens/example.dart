import '../widget/widget_toast.dart';
import 'package:flutter/material.dart';


class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ToastWidget.show(context, 'Ini adalah pesan toast!');
          },
          child: const Text('Tampilkan Toast'),
        ),
      ),
    );
  }
}
