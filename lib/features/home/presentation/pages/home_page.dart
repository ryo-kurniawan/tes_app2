import 'package:flutter/material.dart';
import 'package:gosign/features/home/presentation/widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText("Informasi Sertifikat Anda"),
                Center(
                  child: cardSigner(),
                ),
                reusableText("Akses Menu"),
                Center(
                  child: buildGridMenu(context),
                ),
                reusableText("Info GoSign"),
                cardNews(),
                cardNews(),
                cardNews(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
