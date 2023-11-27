import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class MenuAplikasi extends StatefulWidget {
  const MenuAplikasi(
      {required this.text,
      required this.icon,
      required this.color,
      required this.onTap});

  final String text;
  final Icon icon;
  final Color color;
  final VoidCallback? onTap;

  @override
  _MenuAplikasiState createState() => _MenuAplikasiState();
}

class _MenuAplikasiState extends State<MenuAplikasi> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 10.h,
                height: 10.h,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.black38, blurRadius: 1)
                    ],
                    color: widget.color,
                    borderRadius: BorderRadius.circular(20)),
                child: widget.icon),
            SizedBox(
              height: 2.h,
            ),
            Center(
              child: Text(
                widget.text,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
