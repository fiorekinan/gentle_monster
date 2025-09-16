import 'package:flutter/material.dart';

class SizeConfig {
  //media query class yg berfungsi untuk membuat aplikasi menjadi responsif
  //dgn cara mengambil ukuran aktual pada layar platform
  static MediaQueryData _mediaQueryData = MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window,
  );

  // variable yang menampung default size dari aplikasi,
  //sebelum di deploy ke platform yg spesifik dan mendapat
  //ukuran aktual dari platform tsb misal: di deploy ke platform android
  static double screenWidth= 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;

  // fungsinya adalah untuk pemanggilan awal ketika aplikasi dijalankan
  //dan untuk mendapatkan ukuran dari layar platform
  void init(BuildContext context) {
    //berfungsi untuk mengambu=il ukuran aktual dari platform.
    // karena di dalam variable_mediaQueryData,
    //Di dalamnya memanggil class Media Query
    //yang class Media Query itu sendiri berfungsi untuk mengambil ukuran aktual dari platform
    _mediaQueryData = MediaQuery.of(context);
    //untuk mengambil hanya data ukuran width saja
    screenWidth = _mediaQueryData.size.width;
    //untuk mengambil hanya data ukuran height saja
    screenHeight = _mediaQueryData.size.height;
  }
}

//menggunakan side standar dari handphone x (812 x 375)
double getProporsionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  //ini adalah perhitungan untuk menghasilkan nilai dan ukuran objek yang responsif sesuai platform
  return (inputHeight / 812.0) * screenHeight;
}

double getProporsionateScreenWidth(double inputWidth) {
  double screenwidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenwidth;
}