import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/shoes_by_category.dart';

class DetailScreen extends StatelessWidget {
  void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar(context),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg-three.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                child: Text(
                  'Explore\n Nike Series',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(left: 24.0),
                height: MediaQuery.of(context).size.height * 0.72,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 32.0),
                    special,
                    SizedBox(height: 16.0),
                    favorite,
                    SizedBox(height: 32.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) => PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Row(
            children: [
              GestureDetector(
                onTap: () => navigateBack(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.keyboard_backspace, size: 16.0),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get special => Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: Data.specialShoes.length,
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Data.specialShoes[index].backgroundColor,
                        ),
                        margin: const EdgeInsets.only(right: 20),
                        width: 190,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Data.specialShoes[index].title,
                                style: TextStyle(
                                  color: Data.specialShoes[index].titleColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '433 Items',
                                        style: TextStyle(
                                          color: Data
                                              .specialShoes[index].titleColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        '\$200',
                                        style: TextStyle(
                                          color: Data
                                              .specialShoes[index].titleColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0,
                                      vertical: 12.0,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 40,
                        child: Image.asset(
                          Data.specialShoes[index].imagePath,
                          width: 215,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get favorite => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Favorite',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: Data.shoesByCategories.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Data.shoesByCategories[index].backgroundColor,
                        ),
                        margin: const EdgeInsets.only(right: 16),
                        width: 130,
                        child: Image.asset(
                            Data.shoesByCategories[index].imagePath),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      Data.shoesByCategories[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
