import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gosign/features/document/data/datasources/document_remote_datasource.dart';
import 'package:gosign/features/document/presentation/bloc/document_bloc.dart';
import 'package:gosign/features/document/presentation/pages/document_page.dart';
import 'package:gosign/features/home/presentation/pages/home_page.dart';
import 'package:gosign/features/login/data/datasources/auth_local_datasource.dart';
import 'package:gosign/features/login/data/datasources/auth_remote_datasource.dart';
import 'package:gosign/features/login/presentation/bloc/login_bloc.dart';
import 'package:gosign/features/login/presentation/pages/login_page.dart';
import 'package:gosign/features/setting/presentation/pages/setting_page.dart';
import 'package:gosign/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(AuthRemoteDatasource()),
          ),
          BlocProvider(
            create: (context) => DocumentBloc(DocumentRemoteDatasource()),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              '/login': (context) => const LoginPage(),
              '/dokumen': (context) => const DocumentPage(),
              '/settings': (context) => const SettingPage(),
            },
            home: FutureBuilder<bool>(
                future: AuthLocalDatasource().isAuth(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data == true) {
                    return const HomePage();
                  } else {
                    return SplashScreen();
                  }
                })));
  }
}
