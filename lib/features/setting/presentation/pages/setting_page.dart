import 'package:flutter/material.dart';
import 'package:gosign/features/login/data/datasources/auth_local_datasource.dart';
import 'package:gosign/features/login/presentation/pages/login_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Text('Pengaturan'),
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: const Text(
            'Konfigurasi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
          child: GestureDetector(
            onTap: () {
              print("Visualisasi TTE");
            },
            child: const Row(children: [
              Icon(
                Icons.image_outlined,
              ),
              SizedBox(
                width: 15,
              ),
              Text('Visualisasi TTE'),
              Spacer(),
              Icon(Icons.chevron_right),
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
          child: GestureDetector(
            onTap: () {
              print("Aktifkan Bimoetric Login");
            },
            child: const Row(children: [
              Icon(
                Icons.fingerprint_outlined,
              ),
              SizedBox(
                width: 15,
              ),
              Text('Aktifkan Bimoetric Login'),
              Spacer(),
              Icon(Icons.chevron_right),
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
          child: GestureDetector(
            onTap: () {
              print("Notifikasi");
            },
            child: const Row(children: [
              Icon(
                Icons.notifications_outlined,
              ),
              SizedBox(
                width: 15,
              ),
              Text('Notifikasi'),
              Spacer(),
              Icon(Icons.chevron_right),
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
          child: GestureDetector(
            onTap: () {
              print("Panduan Penggunaan");
            },
            child: const Row(children: [
              Icon(
                Icons.book_outlined,
              ),
              SizedBox(
                width: 15,
              ),
              Text('Panduan Penggunaan'),
              Spacer(),
              Icon(Icons.chevron_right),
            ]),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10.0,
            left: 20.0,
            right: 20.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 15.0, bottom: 15.0),
          child: GestureDetector(
            onTap: () {
              AuthLocalDatasource().removeAuthData();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: Container(
              child: const Row(children: [
                Icon(
                  Icons.logout_outlined,
                ),
                SizedBox(
                  width: 15,
                ),
                Text('Keluar'),
                Spacer(),
                Icon(Icons.chevron_right),
              ]),
            ),
          ),
        )
      ])),
    ));
  }
}
