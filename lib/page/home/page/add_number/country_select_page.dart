import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:simcodeapp/const/color/colors.dart';
import 'package:simcodeapp/page/home/page/add_number/buy_number_page.dart';

class CountrySelectPage extends StatelessWidget {
  const CountrySelectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: dfColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Ülkeler',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 31,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: CountryWidget(
                isButton: true,
                buttontitle: "KULLAN",
                image: "assets/icon/expamle/united_kingdom.svg",
                desc2: "146 tane daha numara mevcut",
                title: "United Kingdom",
                desc: "+44 XXXX XXXXXXX",
              ),
            );
          },
        ));
  }
}

class CountryWidget extends StatelessWidget {
  const CountryWidget({
    super.key,
    required this.buttontitle,
    this.isButton,
    required this.title,
    required this.desc,
    required this.desc2,
    required this.image,
  });
  final String buttontitle;
  final bool? isButton;
  final String title;
  final String desc;
  final String desc2;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: context.border.normalBorderRadius,
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 1,
                color: Colors.blueGrey.withOpacity(.2))
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: SvgPicture.asset(
              image,
              height: 52,
              width: 52,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  desc2,
                  style: TextStyle(
                      fontSize: 12,
                      color: dfColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(width: 2, color: dfColor),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                backgroundColor: dfColor,
              ),
              onPressed: () {
                if (isButton ?? false) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BuyNumberPage(
                          image: "assets/icon/expamle/united_kingdom.svg",
                          desc2: "146 tane daha numara mevcut",
                          title: "United Kingdom",
                          desc: "+44 XXXX XXXXXXX",
                        ),
                      ));
                }
              },
              child: Text(
                buttontitle,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
