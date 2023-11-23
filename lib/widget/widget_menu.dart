import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class MenuAplikasi extends StatefulWidget {
  const MenuAplikasi(
      {required this.text,
      required this.icon,
      required this.color,
      required this.ontap});

  final String text;
  final Icon icon;
  final Color color;
  final VoidCallback? ontap;

  @override
  _MenuAplikasiState createState() => _MenuAplikasiState();
}

class _MenuAplikasiState extends State<MenuAplikasi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 10.h,
              height: 10.h,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1
                  )
                ],
                
                
              ),
              child: widget.icon,
            )
          ],
        ),
      ),
    );
  }
}
