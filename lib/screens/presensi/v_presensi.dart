import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trust_location/trust_location.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:provider_dzikir/utils/util_color.dart';
import 'package:provider_dzikir/bloc/lokasi/bloc/lokasi_bloc.dart';
import 'package:provider_dzikir/bloc/lokasi/bloc/lokasi_state.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  String? _timeStringS;
  String? _dateString;
  String? _dayString;
  Timer? timer;
  bool _isLoading = false;
  bool _isLoadingLocation = false;

  String location = 'Null, Press Button';
  String Address = 'Lokasi Belum di Ketahui';
  String statusrad = 'Belum';

  File? _image;
  String? fileInBase64;
  String? _timeString;
  var currentSelectedValue;
  var currentSelectedValuekampus;
  var jarakradius;
  var lo;
  var la;

  List<String> statusPM = ["Masuk", "Pulang"];
  double? pLatt;
  double? pLngg;
  int? raddius;

  Future<void> getLocationAA() async {
    try {
      TrustLocation.onChange.listen((values) => setState(() {
            _isMockLocation = values.isMockLocation;
            print("mock up${_isMockLocation}");
          }));
    } on PlatformException catch (e) {
      print('PlatformException $e');
    }
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      if (kampus != null) {
        setState(() {
          _isLoading = false;
          _isLoadingLocation = false;
          Fluttertoast.showToast(
              msg: "Izinkan GPS permision untuk menggunakan aplikasi ini",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      } else {
        setState(() {
          _isLoading = false;
          _isLoadingLocation = false;
        });
      }

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  late Position _currentPosition1;
  double earthRadius = 6371000;

  var kampus;

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    final String formattedDateTime2 = _formatDateTime2(now);
    final String formattedDateTime3 = _formatDateTime3(now);
    setState(() {
      _timeStringS = formattedDateTime;
      _dateString = formattedDateTime2;
      _dayString = formattedDateTime3;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
    // return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  String _formatDateTime2(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime);
    // return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  String _formatDateTime3(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
    // return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  // String? _latitude;
  // String? _longitude;
  bool? _isMockLocation;
  String? idLokasi;

  @override
  void initState() {
    super.initState();
    TrustLocation.start(1);
    getLocationAA();
    _timeStringS = _formatDateTime(DateTime.now());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      _getTime();
    });
  }

  // geolocation

  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isLoading == false
          ? SizedBox(
              height: 15.h,
              width: 15.w,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 223, 64, 56),
                child: const Text(
                  "Simpan",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            )
          : SizedBox(
              height: 15.h,
              width: 15.w,
              child: FloatingActionButton(
                onPressed: () {},
                elevation: 2,
                backgroundColor: Colors.grey,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
      appBar: AppBar(
        backgroundColor: ColorUtils.primaryColor(),
        title: const Text(
          'Presensi',
          style: TextStyle(fontSize: 12),
        ),
        actions: [
          InkWell(
            onTap: () {
            cameraImage();
            },
            child: const Center(
              child: Text(
                'Pilih Foto',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          InkWell(
              onTap: () {
                //galleryImage();
                cameraImage();
              },
              child: const Icon(
                Icons.camera,
                size: 20,
                color: Colors.white,
              )),
          SizedBox(width: 4.w)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 3.w, left: 3.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 22.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/clock3.png",
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$_timeStringS'.substring(0, 2),
                        style: TextStyle(
                            color: const Color(0xFF1F2633),
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                            color: const Color(0xFF1F2633),
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '$_timeStringS'.substring(3, 5),
                        style: TextStyle(
                            color: const Color(0xFF1F2633),
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                            color: const Color(0xFF1F2633),
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '$_timeStringS'.substring(6, 8),
                        style: TextStyle(
                            color: const Color(0xFF1F2633),
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ]),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$_dayString',
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xFF757D90)),
                  ),
                  Text(
                    '$_dateString',
                    style: const TextStyle(
                        color: Color(0xFF757D90),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.w),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        offset: const Offset(0, 3))
                  ]),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfffe66646),
                        ),
                        child: const Icon(
                          Icons.pin_drop_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
 Expanded(
  flex: 1,
  child: BlocBuilder<LokasiBloc, LokasiState>(
    builder: (context, state) {
      if (state is LokasiLoadingState) {
        return CircularProgressIndicator();
      } else if (state is LokasiLoadedState) {
        List<String> locations = state.labels;

        return DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: const Text("Pilih Lokasi"),
            icon: const Visibility(
              visible: true,
              child: Icon(Icons.keyboard_arrow_down_rounded),
            ),
            isExpanded: true,
            value: currentSelectedValue,
            items: locations
              .map((location) => DropdownMenuItem<String>(
                value: location,
                child: Text(location),
              ))
              .toList(),
            onChanged: (selectedLocation) {
              setState(() {
                currentSelectedValue = selectedLocation;
              });
            },
          ),
        );
      } else if (state is LokasiErrorState) {
        return Text(state.errorMessage);
      }

      return const CircularProgressIndicator();
    },
  ),
)
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: 4.w,
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 0.5,
                            blurRadius: 2,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          )
                        ],
                      ),
                      child: Row(children: <Widget>[
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orange),
                          child: const Icon(
                            Icons.alarm,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Expanded(
                          flex: 1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: const Text("Pilih Status"),
                              icon: const Visibility(
                                  visible: true,
                                  child:
                                      Icon(Icons.keyboard_arrow_down_rounded)),
                              isExpanded: true,
                              items: statusPM.map((val) {
                                return DropdownMenuItem(
                                  value: val,
                                  child: Text(val),
                                );
                              }).toList(),
                              value: currentSelectedValue,
                              onChanged: (value) {
                                setState(() {
                                  currentSelectedValue = value.toString();
                                });
                              },
                            ),
                          ),
                        )
                      ]))),
              _image == null
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(top: 6.w, left: 15, right: 15),
                      child: Column(children: [
                        Center(
                            child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                )
                              ],
                              image: DecorationImage(
                                  image: FileImage(_image!),
                                  fit: BoxFit.cover)),
                          height: 20.h,
                          width: MediaQuery.of(context).size.width,
                        )),
                      ])),
              Padding(
                padding: EdgeInsets.only(top: 6.w),
                child: Container(
                    padding: const EdgeInsets.all(50),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: const Color(0xff7c94b6),
                      color: Colors.white,
                      // border: Border.all(
                      //   color: Colors.black87,
                      //   width: 0.5,
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 0.5,
                          blurRadius: 2,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        )
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Address == 'Lokasi Belum di Ketahui!!' ||
                                    _isMockLocation == true
                                ? const Text(
                                    'Lokasi Belum di Ketahui!!',
                                    style: TextStyle(color: Colors.redAccent),
                                  )
                                : Text(Address)))),
              ),
              _isLoadingLocation == false
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 6.w),
                      child: InkWell(
                        onTap: () async {
                          getLocationAA();
                          setState(() async {
                            _isLoadingLocation = true;
                            await getDistance();
                          });
                          Position position = await _getGeoLocationPosition();
                        },
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 6.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFF0a4f8f),
                                // color: Color(0xFF345DA7),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 0.5,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  )
                                ]),
                            child: Text('Klik Lokasi',
                                style: TextStyle(
                                    fontSize: 11.sp, color: Colors.white))),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: 6.w),
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            _isLoadingLocation = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 6.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey,
                              boxShadow: []),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  //Camera Image
  Future cameraImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        print('File ls = ' + _image.toString());
        List<int> fileInByte = _image!.readAsBytesSync();
        fileInBase64 = base64Encode(fileInByte);
        print('asd: $fileInBase64');
      } else {
        print('No image selected.');
      }
    });
  }

  //Galerry
  Future galleryImage() async {
    final ImagePicker _picker = ImagePicker();
    final image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      if (image != null) {
        _image = File(image.path);
        print('File is = ' + _image.toString());
        List<int> fileInByte = _image!.readAsBytesSync();
        fileInBase64 = base64Encode(fileInByte);
        print('asd : $fileInBase64');
        print('asd : $_image');
      } else {
        print("No Image selected");
      }
    });
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      galleryImage();
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      cameraImage();
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  getDistance() async {
    print(la);
    print(lo);
    print(raddius);
    if (currentSelectedValuekampus == null) {
      Position position = await _getGeoLocationPosition();
      setState(() {
        _isLoadingLocation = false;
        _isLoading = false;
      });
      Fluttertoast.showToast(
          msg: "Set Lokasi Kampus Sebelumnya",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (currentSelectedValuekampus != null) {
      Position position = await _getGeoLocationPosition();
      var dLat = math.radians(la! - position.latitude);
      var dLng = math.radians(lo! - position.longitude);
      //Add Address
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      print(placemarks);
      Placemark place = placemarks[0];

      //Rumus Radius Jarak
      var a = sin(dLat / 2) * sin(dLat / 2) +
          cos(math.radians(position.latitude)) *
              cos(math.radians(la!)) *
              sin(dLng / 2) *
              sin(dLng / 2);
      var c = 2 * atan2(sqrt(a), sqrt(1 - a));
      var d = earthRadius * c;

      //set long & lat
      lo = position.latitude;
      la = position.longitude;
      setState(() {
        location = "$lo $la";
        jarakradius = d;
      });

      print(jarakradius); //d is the distance in meters
      if (d < raddius!) {
        setState(() {
          _isLoading = false;
          _isLoadingLocation = false;
          Address =
              '${place.street}, ${place.subLocality}, ${place.locality}, ${place.country}';
          if (_isMockLocation == false) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Color(0xFF0a4f8f),
              content: Text("Anda Dalam Radius Kantor"),
            ));
          } else if (_isMockLocation == true) {
            Fluttertoast.showToast(
                msg: "Anda Terdeteksi Memakai Fake GPS.",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          print('Masuk Kampus 1');
          statusrad = 'masuk';
        });
      } else {
        setState(() {
          _isLoading = false;
          _isLoadingLocation = false;
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Anda Berada Diluar Radius Kantor!!"),
          ));
          print('Gagal');
          statusrad = 'gagal';
        });
      }
    }
  }
}
