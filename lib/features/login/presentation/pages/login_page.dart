import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gosign/features/home/presentation/pages/home_page.dart';
import 'package:gosign/features/login/data/datasources/auth_local_datasource.dart';
import 'package:gosign/features/login/presentation/bloc/login_bloc.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 50.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isChecked = false;
  bool showPassword = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/ic_logo.webp',
            width: 45.0,
            height: 45.0,
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Masuk ke Gosign",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'NIK',
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            controller: usernameController,
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            obscureText: !showPassword,
            decoration: InputDecoration(
                labelText: 'Kata Sandi',
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                suffixIcon: IconButton(
                  icon: showPassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                )),
            controller: passwordController,
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Checkbox(
                visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0),
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              ),
              Flexible(
                  child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Dengan ini, saya setuju dengan ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Persyaratan Layanan',
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Tautan diklik');
                        },
                    ),
                    const TextSpan(
                      text: ' dan',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: ' Kebijakan Privasi',
                      style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print('Tautan diklik');
                        },
                    ),
                  ],
                ),
              )),
            ],
          ),
          const SizedBox(height: 20.0),
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (authResponseModel) {
                  AuthLocalDatasource().saveAuthData(authResponseModel);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.red,
                  ));
                },
              );
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return state.maybeWhen(orElse: () {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      if (usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          padding: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 25.0),
                          backgroundColor: Colors.red,
                          content: Text(
                              "Username dan Password harus diisi dan tidak boleh kosong"),
                        ));
                      } else {
                        if (_isChecked == false) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                "Anda harus menyetujui Persyaratan Layanan dan Kebijakan Privasi"),
                          ));
                        } else {
                          context.read<LoginBloc>().add(
                                LoginEvent.login(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                ),
                              );
                        }
                      }
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }, loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                });
              },
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Lupa Kata Sandi',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                backgroundColor: Colors.yellow[700],
              ),
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Verifikasi Dokumen",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.qr_code,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          Text(
            "Didukung oleh :",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey[600]),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_bsre.webp',
                width: 120.0,
              ),
              Image.asset(
                'assets/images/ic_logo_gto.webp',
                width: 50.0,
              ),
              const SizedBox(width: 10.0),
              Image.asset(
                'assets/images/ic_logo_sso.webp',
                width: 120.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
