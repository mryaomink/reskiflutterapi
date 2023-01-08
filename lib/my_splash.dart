import 'package:flutter/material.dart';
import 'package:reski_sample/auth/login_page.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();

    // funsi beralih halaman secara otomatis dalam waktu 3 Detik
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginPage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: const [
          Center(
            child: Text(
              "Selamat Datang\nDi Aplikasi Diskominfo",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
            child: Text(
              "Data Privacy Jadi Aman",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
