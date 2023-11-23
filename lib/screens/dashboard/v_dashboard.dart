import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider_dzikir/utils/util_color.dart';




class DashboardKaryawan extends StatefulWidget {
  const DashboardKaryawan({super.key});

  @override
  State<DashboardKaryawan> createState() => _DashboardKaryawanState();
}

class _DashboardKaryawanState extends State<DashboardKaryawan> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0.h,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13)
                    ),
                    color: Color(0xFF0a4f8f),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 27.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0.w),
                            child: loading == true
                            ? Container(
                              width: 13.w,
                              height: 8.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/profile.png"),
                                  fit: BoxFit.contain
                                  ),
                                  shape: BoxShape.circle
                              ),
                            ) : Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 13.w,
                                width: 8.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                              ), 
                              ), 
                            ), 
                            loading == true
                            ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(
                                  left: 3.w),
                                  child: SizedBox(
                                    width: 70.w,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Selamat Datang,",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        )
                                      ],
                                    ),
                                  ),
                                  )
                              ],
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 3.w),
                                  child: SizedBox(width: 70.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                        height: 2.3.h,
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      SizedBox(
                                        width: 50.w,
                                        height: 2.7.h,
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(5)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),
                                )
                              ],
                            ) 

                        ],
                      )
                    ],
                  ),
                )
                ),
                Positioned(
                  top: 32.h,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFF4F4F4),
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Column(
                      children: [
                        widgetAplikasi()
                      ],
                    ),
                  ) 
                  ),
                  Positioned(
                    top: 22.h,
                    left: 5.w,
                    right: 5.w,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: loading == true 
                        ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Text(
                                    "Unit Kerja",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorUtils.primaryColor()  
                                    ),
                                  ),
                                  ),
                                  SizedBox(
                                height:  2.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87
                                  ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 7.w),
                              child: const Center(
                                child: Text("Data"),
                              ), 
                              )
                              
                          ],
                        ) 
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: SizedBox(
                                    width: 22.w,
                                    height: 2.3.h,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300, 
                                    highlightColor: Colors.grey.shade300,
                                      child: Container(
                                      color: Colors.white,
                                    )
                                    ),
                                  ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: SizedBox(
                                      width: 30.w,
                                      height: 2.3.h,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300, 
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                        color: Colors.white,
                                        
                                      )
                                      ),
                                    ), 
                                    )
                              ],
                            )
                          ],
                        )
                      )
                    ))
            ],
          ),
        ),
      ),
    );
  }


Widget widgetAplikasi() {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: MediaQuery.of(context as BuildContext).size.width,
      child: Padding(padding: EdgeInsets.only(
        left: 0.w,
        right: 0.w,
        top: 1.7.h,
        bottom: 4.5.h
      ),child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loading == true 
          ? Container(
            padding: const EdgeInsets.only(
              top: 7, bottom: 7, right: 20, left: 20
            ),
            decoration: BoxDecoration(
              color: ColorUtils.primaryColor(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
              )
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold

              ),
            ),
          )
          : Shimmer.fromColors(
            baseColor: Colors.grey.shade100,
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: 18.w,
              height: 2.2.h,
              padding: const EdgeInsets.only(top: 7, bottom: 7, right: 20, left: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
                )
              ),
            ),
          )
        ],
      ),
      ),
      
    ), 
    );
}


}