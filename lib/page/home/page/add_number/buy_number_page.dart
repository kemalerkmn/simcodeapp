import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:simcodeapp/const/color/colors.dart';
import 'package:simcodeapp/page/home/page/add_number/country_select_page.dart';

class BuyNumberPage extends StatefulWidget {
  const BuyNumberPage(
      {Key? key,
      required this.title,
      required this.desc,
      required this.desc2,
      required this.image})
      : super(key: key);
  final String title;
  final String desc;
  final String desc2;
  final String image;
  @override
  State<BuyNumberPage> createState() => _BuyNumberPageState();
}

class _BuyNumberPageState extends State<BuyNumberPage> {
  late PageController _pageController;
  int currentPage = 0;
  int totalPages = 7; // Toplam sayfa sayısı

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Otomatik kaydırma işlemi için bir Timer oluşturun
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentPage < totalPages - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: dfColor,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ],
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryWidget(
                buttontitle: '155.55 ₺',
                image: widget.image,
                desc2: widget.desc2,
                title: widget.title,
                desc: widget.desc,
              ),
              SizedBox(
                height: context.general.mediaSize.height * 0.02,
              ),
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller:
                      _pageController, // _pageController'ı ilişkilendirin

                  itemCount: totalPages,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                      child: ContentWidget(),
                    );
                  },
                ),
              ),
              SizedBox(
                height: context.general.mediaSize.height * 0.02,
              ),
              Text(
                "Nasıl Kullanılır?",
                style: context.general.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Column(
                children: List.generate(
                    6,
                    (index) => Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(111, 209, 209, 209),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: context.general.textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.general.mediaSize.width * 0.03,
                              ),
                              const Flexible(
                                child: Text(
                                    """ Lorem Ipsum is simply dummy text of the printing and typesetting industry.,"""),
                              )
                            ],
                          ),
                        )),
              ),
              SizedBox(
                height: context.general.mediaSize.height * 0.03,
              ),
              Center(
                child: SizedBox(
                  height: 52,
                  width: context.general.mediaSize.width / 1.5,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2, color: dfColor),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        backgroundColor: dfColor,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "ŞİMDİ SATIN AL",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: context.border.normalBorderRadius,
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 1,
                color: Colors.blueGrey.withOpacity(.2))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )),
            ),
            Text(
              "Robert - 02.10.2023",
              style: context.general.textTheme.bodySmall,
            )
          ],
        ),
        SizedBox(
          height: context.general.mediaSize.height * 0.01,
        ),
        Text(
          "Fantastic App",
          style: context.general.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: context.general.mediaSize.height * 0.02,
        ),
        Text(
          "The only app I use to create a whatsapp account. You can create an account without a sim card",
          style: context.general.textTheme.bodyMedium,
        )
      ]),
    );
  }
}
