import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/assets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              height: media.size.height - 26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  media.size.height > 400
                      ? Image.asset(
                          Assets.assetsLogo,
                          width: media.size.height / 3,
                          height: media.size.height / 4,
                          isAntiAlias: true,
                        )
                      : const SizedBox.shrink(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Хабр",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        "Карьера",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            showCursor: true,
                            textAlign: TextAlign.start,
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.account_circle,
                                size: 23,
                              ),
                              prefixIconConstraints: BoxConstraints.tight(
                                const Size(40, 30),
                              ),
                              border: const OutlineInputBorder(),
                              labelText: "E-mail",
                              labelStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: TextField(
                            showCursor: true,
                            textAlign: TextAlign.start,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 23,
                              ),
                              prefixIconConstraints: BoxConstraints.tight(
                                const Size(40, 30),
                              ),
                              border: const OutlineInputBorder(),
                              labelText: "Пароль",
                              labelStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () =>
                                  {Navigator.pushNamed(context, '/home')},
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 40),
                                // minimumSize: const Size.fromHeight(50),
                              ),
                              child: const Text(
                                "Войти",
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: const Text(
                            "Забыли пароль?",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () => {
                            _launchInWebViewOrVC(
                              Uri(
                                  scheme: 'https',
                                  host: 'account.habr.com',
                                  path: 'login/reminder/'),
                            ),
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            _buildRegistraionWidget(),
          ],
        ),
      ),
    );
  }

  Row _buildRegistraionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Нет аккаунта?',
          style: TextStyle(fontSize: 11),
        ),
        GestureDetector(
          child: const Text(
            "Регистрация",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                decoration: TextDecoration.underline),
          ),
          onTap: () => {
            _launchInWebViewOrVC(
              Uri(scheme: 'https', host: 'account.habr.com', path: 'register/'),
            ),
          },
        ),
      ],
    );
  }
}
