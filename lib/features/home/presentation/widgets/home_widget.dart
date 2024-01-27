import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gosign/core/components/custom_alert_dialog.dart';
import 'package:gosign/features/login/data/datasources/auth_local_datasource.dart';
import 'package:gosign/features/login/presentation/pages/login_page.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Image.asset(
      'assets/images/ic_logo_white.webp',
      width: 100,
    ),
    actions: <Widget>[
      Container(
        width: 40.0,
        height: 40.0,
        margin: const EdgeInsets.only(right: 15.0),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: IconButton(
          icon: const Icon(
            Icons.person_3_outlined,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
      )
    ],
    backgroundColor: Colors.blue,
  );
}

Widget reusableText(String text) {
  return Container(
    margin: const EdgeInsets.only(bottom: 4.0),
    child: Text(
      text,
      style: const TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );
}

Widget cardSigner() {
  return Container(
    margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
    width: 350.0,
    height: 150.0,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "SIGNER NAME",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          const Row(children: [
            Icon(Icons.person_2_outlined),
            Text(
              "Gosign Development",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ]),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            "ENROLLMENT STATUS",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.8),
            ),
          ),
          const Row(children: [
            Icon(Icons.check_circle, color: Colors.green),
            Text(
              "ISSUE",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ]),
        ],
      ),
    ),
  );
}

Widget buildGridMenu(BuildContext context) {
  final List<Map<String, dynamic>> menuItems = [
    {
      'label': 'Lihat Dokumen',
      'image': 'assets/images/ic_document.webp',
      'route': '/dokumen'
    },
    {
      'label': 'Riwayat',
      'image': 'assets/images/ic_document_history.webp',
      'route': '/riwayat'
    },
    {
      'label': 'Verifikasi Dokumen',
      'image': 'assets/images/ic_qrcode.webp',
      'route': '/verifikasi_dokumen'
    },
    {
      'label': 'Statistik',
      'image': 'assets/images/ic_chart.webp',
      'route': '/statistik'
    },
    {
      'label': 'Pengaturan',
      'image': 'assets/images/ic_settings.webp',
      'route': '/settings'
    },
  ];
  return Container(
    width: 350.0,
    height: 300.0,
    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
    child: GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 25.0,
      crossAxisSpacing: 1.0,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            print(menuItems[index]['label']);
            Navigator.pushNamed(context, menuItems[index]['route']);
          },
          child: Container(
            margin: EdgeInsets.only(left: 5.0, right: 5.0),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 5.0,
                offset: Offset(0, 2),
              ),
            ], borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  menuItems[index]['image'],
                  width: 50.0,
                ),
                SizedBox(height: 8.0),
                Text(
                  menuItems[index]['label'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}

Widget cardNews() {
  return Container(
    margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
    width: 350.0,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      children: [
        Container(
          child: Image.asset('assets/images/not-found.png'),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: const Text(
            "Sekda Kota Gorontalo: TTE Dapat Tingkatkan Pelayanan Publik",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 10.0, bottom: 15.0),
          child: const Text(
            "Sekda Kota Gorontalo, Ismail Madjid menyebutkan, tanda tangan elektronik (TTE) dapat meningkatkan kualitas pelayanan publik yang ada di Kota Gorontalo.",
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12.0,
                overflow: TextOverflow.ellipsis),
            maxLines: 2,
          ),
        ),
      ],
    ),
  );
}
