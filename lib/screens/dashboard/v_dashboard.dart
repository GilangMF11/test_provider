import 'package:sizer/sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider_dzikir/screens/example.dart';
import 'package:provider_dzikir/utils/util_color.dart';
import 'package:provider_dzikir/screens/rekap/v_rekap.dart';
import 'package:provider_dzikir/widget/widget_buttonNavbar.dart';
import 'package:provider_dzikir/screens/presensi/v_presensi.dart';

class DashboardKaryawan extends StatefulWidget {
  const DashboardKaryawan({super.key});

  @override
  State<DashboardKaryawan> createState() => _DashboardKaryawanState();
}

class _DashboardKaryawanState extends State<DashboardKaryawan> {
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getGeoLocationPosition();
  }

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
                          bottomRight: Radius.circular(13)),
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
                                              image: AssetImage(
                                                  "assets/images/profile.png"),
                                              fit: BoxFit.contain),
                                          shape: BoxShape.circle),
                                    )
                                  : Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        height: 13.w,
                                        width: 8.h,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                      ),
                                    ),
                            ),
                            loading == false
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.w),
                                        child: SizedBox(
                                          width: 70.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Selamat Datang,",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Text(
                                                "Nama Karyawan",
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      ColorUtils.primaryColor(),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 3.w),
                                        child: SizedBox(
                                          width: 70.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 30.w,
                                                height: 2.3.h,
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
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
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  5)),
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
                  )),
              Positioned(
                  top: 32.h,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFF4F4F4),
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Column(
                      children: [
                        widgetAplikasi(),
                        loading == false
                            ? widgetImages()
                            : widgetImagesLoading()
                      ],
                    ),
                  )),
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
                          child: loading == false
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: Text(
                                            "Unit Kerja",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    ColorUtils.primaryColor()),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: Text(
                                            "-",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black87),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 7.w),
                                      child: const Center(
                                        child: Text(
                                          "Data",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF0a4f8f)),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 4.w),
                                          child: SizedBox(
                                            width: 22.w,
                                            height: 2.3.h,
                                            child: Shimmer.fromColors(
                                                baseColor: Colors.grey.shade300,
                                                highlightColor:
                                                    Colors.grey.shade300,
                                                child: Container(
                                                  color: Colors.white,
                                                )),
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
                                                highlightColor:
                                                    Colors.grey.shade100,
                                                child: Container(
                                                  color: Colors.white,
                                                )),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )))),
              //ButtonNavBar()
            ],
          ),
        ),
      ),
    );
  }

  //Widget Image
  Widget widgeticons() {
    return Padding(
      padding: EdgeInsets.only(left: 2.w, bottom: 1.h),
      child: Row(children: [
        Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 2.0.h,
        ),
        Text(
          ' Back',
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ]),
    );
  }

  Widget widgetImagesLoading() {
    return Padding(
      padding: EdgeInsets.only(top: 3.w),
      child: Container(
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget widgetImages() {
    return Padding(
      padding: EdgeInsets.only(top: 3.w),
      child: Container(
        height: 20.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            image: const DecorationImage(
                image: AssetImage('assets/images/pmb.jpg'), fit: BoxFit.cover)),
      ),
    );
  }

  Widget _menu(
      {required IconData icon,
      required String text,
      required Color color,
      required VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding:
              EdgeInsets.only(left: 1.w, right: 1.w, top: 1.w, bottom: 1.w),
          decoration: BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.circular(4),
            // border: Border.all(color: Colors.black)
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 23.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 9.sp),
                  ),
                )
              ],
            ),
          )),
    );
  }

// Menu Aplikasi View
  Widget menuView() {
    return Padding(
      padding: EdgeInsets.only(top: 2.4.h, left: 3.w, right: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.camera,
                color: Colors.cyan,
                text: 'Presensi',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PresensiPage()),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.book,
                // color: Colors.amber,
                color: Colors.indigo.shade400,
                text: 'Rekap',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RekapPage()),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.add_alarm_rounded,
                color: Colors.orange,
                text: 'Perizinan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExampleScreen()),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.query_builder_sharp,
                color: Color(0xFFFE6646),
                text: 'Lembur',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExampleScreen()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  Widget menuView2() {
    return Padding(
      padding: EdgeInsets.only(top: 2.4.h, left: 3.w, right: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.menu_book_sharp,
                // color: Color(0xFFF5ACFC9),
                color: Colors.amber,
                text: 'Logbook',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExampleScreen()),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.local_post_office,
                color: Color(0xFFFE6646),
                text: 'E-Surat',
                onTap: () {
                  _launchInBrowser("https://e-surat.ump.ac.id/login/");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => DaftarKelompok()),
                  // );
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.manage_search_rounded,
                color: Colors.cyan,
                text: 'Pengajian',
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExampleScreen()),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.mosque,
                // color: Color(0xFFF5ACFC9),
                color: Colors.green,
                text: 'Ramadhan',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExampleScreen()),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget menuView3() {
    return Padding(
      padding: EdgeInsets.only(top: 3.h, left: 3.w, right: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.account_circle,
                // color: Color(0xFFF5ACFC9),
                color: Colors.indigo.shade400,
                text: 'Simpeg',
                onTap: () {
                  _launchInBrowser("https://simpeg.ump.ac.id/config/index.php");
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.assessment,
                color: Colors.amber,
                text: 'Simaset',
                onTap: () async {
                  // await LaunchApp.openApp(
                  //   androidPackageName: 'app.smartoffice.ac.id',
                  //   iosUrlScheme: 'app.smartoffice.ac.id',
                  //   // appStoreLink:
                  //   //     'itms-apps://itunes.apple.com/us/app/pulse-secure/id945832041',
                  //   // openStore: false
                  // );
                  _launchInBrowser("https://simaset.ump.ac.id/");
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.shopping_bag_outlined,
                // color: Color(0xFFFE6646),
                color: Colors.green,
                text: 'Umplaza',
                onTap: () {
                  _launchInBrowser("https://umplaza.id/");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => DaftarKelompok()),
                  // );
                }),
          ),
          Expanded(
            flex: 2,
            child: _menu(
                icon: Icons.receipt_outlined,
                color: Colors.orange,
                text: 'Sijaru',
                onTap: () {
                  _launchInBrowser("https://sijaru.ump.ac.id/");
                }),
          ),
        ],
      ),
    );
  }

  Widget menuLoading() {
    return Padding(
      padding: EdgeInsets.only(top: 2.4.h, left: 3.w, right: 3.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _menuLoading(
            icon: Icons.camera,
            color: Colors.cyan,
            text: 'Presensi',
          ),
          _menuLoading(
            icon: Icons.book,
            color: Colors.amber,
            text: 'Rekap',
          ),
          _menuLoading(
            icon: Icons.add_alarm_rounded,
            color: Colors.orange,
            text: 'Perizinan',
          ),
          _menuLoading(
            icon: Icons.query_builder_sharp,
            color: Color(0xFFFE6646),
            text: 'Lembur',
          ),
        ],
      ),
    );
  }

// Shimmer Widget Icon Menu App

  Widget _menuLoading(
      {required IconData icon,
      required String text,
      required Color color,
      VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.only(left: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            // border: Border.all(color: Colors.black)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 13.w,
                  height: 8.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: SizedBox(
                  width: 10.w,
                  height: 2.h,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )),
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
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              EdgeInsets.only(left: 0.w, right: 0.w, top: 1.7.h, bottom: 4.5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loading == false
                  ? Container(
                      padding: const EdgeInsets.only(
                          top: 7, bottom: 7, right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: ColorUtils.primaryColor(),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade100,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 18.w,
                        height: 2.2.h,
                        padding: const EdgeInsets.only(
                            top: 7, bottom: 7, right: 20, left: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15))),
                      ),
                    ),
              loading == false ? menuView() : menuLoading(),
              loading == false ? menuView2() : menuLoading(),
              loading == false ? menuView3() : menuLoading(),
            ],
          ),
        ),
      ),
    );
  }
}
