import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:simcodeapp/const/color/colors.dart';
import 'package:simcodeapp/page/home/page/add_number/buy_number_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Arama Yap',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 48,
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: context.border.normalBorderRadius,
                          borderSide: BorderSide(width: 2, color: dfColor)),
                      contentPadding: const EdgeInsets.only(left: 8, right: 8),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          "assets/icon/icon_list/search_icon.svg",
                          colorFilter:
                              ColorFilter.mode(dfColor, BlendMode.srcIn),
                        ),
                      ),
                      hintText: "Arama yap ...",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: context.border.normalBorderRadius,
                          borderSide: BorderSide(width: 2, color: dfColor))),
                ),
              ),
            ),
            _searchText != ""
                ? LottieBuilder.asset("assets/lottie/search.json")
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
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
                                    "assets/icon/expamle/whatsapp_icon.svg",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "WhatsApp",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "Hemen WhatsApp ve WhatsApp Business destekli numara alarak yeni hesap oluştur ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "146 tane daha numara mevcut",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: dfColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            width: 2, color: dfColor),
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14)),
                                        backgroundColor: dfColor,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const BuyNumberPage(
                                                image:
                                                    "assets/icon/expamle/whatsapp_icon.svg",
                                                desc2:
                                                    "146 tane daha numara mevcut",
                                                title: "WhatsApp",
                                                desc:
                                                    "Hemen WhatsApp ve WhatsApp Business destekli numara alarak yeni hesap oluştur",
                                              ),
                                            ));
                                      },
                                      child: const Text(
                                        "KULLAN",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
          ],
        ));
  }
}
