import 'package:flutter/material.dart';
import 'package:flutter_template/common/widget/logo_widget.dart';
import 'package:flutter_template/core/extension/spaceing_extentsion.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 0.10.height(context),
          ),
          const LogoWidget(),
          SizedBox(
            height: 0.0592.height(context),
          ),
          Column(
            children: [
              SizedBox(
                height: 0.0426.height(context),
                width: 1.0410.width(context),
                child: Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: Text(
                    "...  حياكم الله مجددا",
                    textAlign: TextAlign.end,
                    style: textTheme.headlineLarge!.copyWith(
                      shadows: <Shadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.30),
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5,
                          spreadRadius: -1.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.30),
                          offset: const Offset(-3.0, -3.0),
                          blurRadius: 5,
                          spreadRadius: -1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 26.0),
                child: SizedBox(
                  height: 0.0426.height(context),
                  width: 1.0410.width(context),
                  child: Text(
                    '... أسفرت وأنورت ',
                    textAlign: TextAlign.center,
                    style: textTheme.headlineLarge!.copyWith(
                      shadows: <Shadow>[
                        BoxShadow(
                          color: Colors.black.withOpacity(0.30),
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5,
                          spreadRadius: -1.0,
                        ),
                        BoxShadow(
                          color: Colors.white.withOpacity(0.30),
                          offset: const Offset(-3.0, -3.0),
                          blurRadius: 5,
                          spreadRadius: -1.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
