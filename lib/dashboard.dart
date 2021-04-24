import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  miniDots({bool isActive = false}) {
    return Container(
      margin: EdgeInsets.all(2),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isActive ? Colors.black : Colors.grey.shade400),
    );
  }

  updateCards(context, title, subtext, url) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.0),
        width: MediaQuery.of(context).size.width,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              new BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 60.0,
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.dstOut),
                            fit: BoxFit.fill,
                            image: NetworkImage(url))),
                  ),
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 60,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                  Text(subtext,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                              size: 20,
                            )),
                        Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 2),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.search,
                              size: 20,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 36.0, bottom: 24, left: 24.0),
                    child: Text(
                      'Popular this week',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                  ScrollableCard(
                    urls: [
                      'https://images.unsplash.com/photo-1612267441244-a0d945009d92?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1651&q=80',
                      'https://images.unsplash.com/photo-1553344518-c44926bebaa7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1653&q=80',
                      'https://images.unsplash.com/photo-1532929029420-a6f94b233dd2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1655&q=80'
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          miniDots(),
                          miniDots(isActive: true),
                          miniDots(),
                          miniDots(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 34),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Update',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        ),
                        Text(
                          'See more',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              letterSpacing: 0.5),
                        ),
                      ],
                    ),
                  ),
                  updateCards(
                      context,
                      'What\'s the oldest book?',
                      'Global news • Ep5',
                      'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1441&q=80'),
                  updateCards(
                      context,
                      'What\'s the oldest book?',
                      'Romance news • Ep12',
                      'https://images.unsplash.com/photo-1516589178581-6cd7833ae3b2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80'),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 36.0, bottom: 8, left: 24.0),
                    child: Text(
                      'Continue the last story',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                  ScrollableCard(
                    urls: ['', '', ''],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class ScrollableCard extends StatelessWidget {
  List<String> urls = [];
  ScrollableCard({Key key, urls}) : super(key: key) {
    this.urls = urls;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: new ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Stack(
                children: [
                  this.urls[index].isEmpty
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey.shade200),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.amber),
                                    ),
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 30,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 14.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Love/Hate relationship',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.5),
                                      ),
                                      Text('Romance',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.5))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(this.urls[index]))),
                        ),
                  if (this.urls[index].isNotEmpty)
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(1),
                                      Colors.black.withOpacity(0)
                                    ]),
                                borderRadius: BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(40),
                                    bottomEnd: Radius.circular(40))),
                            child: Container(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14.0),
                                    child: Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(.6),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 14.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Why art is expensive",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              letterSpacing: 0.5),
                                        ),
                                        Text('Artist • 14m',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                letterSpacing: 0.5))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )))
                ],
              ),
            ),
          );
        },
        itemCount: this.urls.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
