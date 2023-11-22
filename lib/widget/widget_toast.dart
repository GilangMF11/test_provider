import 'package:flutter/material.dart';

class ToastWidget extends StatefulWidget {
  final String message;


  const ToastWidget({super.key, required this.message});

  @override
  // ignore: library_private_types_in_public_api
  _ToastWidgetState createState() => _ToastWidgetState();

  static show(BuildContext context, String message) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 16.0,
        left: MediaQuery.of(context).size.width * 0.2,
        child: ToastWidget(message: message),
      ),
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}

class _ToastWidgetState extends State<ToastWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          widget.message,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
