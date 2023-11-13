import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:simcodeapp/const/color/colors.dart';
import 'package:simcodeapp/page/home/page/add_number/country_select_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Benim Numaralarım',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LottieBuilder.asset("assets/lottie/add_number.json"),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's ",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: context.general.mediaSize.width / 2.5,
                height: 48,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2, color: dfColor),
                        elevation: .1,
                        shape: RoundedRectangleBorder(
                            borderRadius: context.border.normalBorderRadius),
                        backgroundColor: dfOnBackgroundColor),
                    onPressed: () {
                      context.route.navigateToPage(const CountrySelectPage());
                    },
                    child: const Text(
                      "NUMARA EKLE",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
