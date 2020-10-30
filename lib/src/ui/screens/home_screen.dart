import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../data/shoes_by_category.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void navigateToDetailScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetailScreen()),
    );
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
        appBar: appBar,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg-two.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              headline,
              SizedBox(height: 16.0),
              favorite,
              SizedBox(height: 16.0),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }

  Widget get appBar => PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.menu, size: 16.0),
              ),
            ],
          ),
        ),
      );

  Widget get headline => GestureDetector(
        onTap: navigateToDetailScreen,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: -40,
              left: 0,
              child: Image.asset(
                'assets/yellow-similar.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.16),
                Image.asset(
                  'assets/nike-logo.png',
                  width: 80,
                  height: 50,
                ),
                Text(
                  'AIRMAX',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  '2020',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                    height: 0.9,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 2.0),
                    Text(
                      '200',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(Icons.arrow_forward),
                  ],
                ),
                SizedBox(height: 130.0),
              ],
            ),
          ],
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

  Widget get bottomNavBar => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            gap: 8,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            duration: Duration(milliseconds: 800),
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.bell,
                text: 'Notifications',
              ),
              GButton(
                icon: LineIcons.star_o,
                text: 'Likes',
              ),
              GButton(
                icon: LineIcons.shopping_cart,
                text: 'Cart',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      );
}
