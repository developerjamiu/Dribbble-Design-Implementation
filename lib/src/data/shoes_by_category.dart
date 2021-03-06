import 'package:flutter/material.dart';

import '../model/shoe.dart';

class Data {
  static List<Shoe> shoesByCategories = <Shoe>[
    Shoe(
      imagePath: 'assets/red-similar.png',
      name: 'Jully Kingston',
      backgroundColor: Color(0x44FF6D65),
    ),
    Shoe(
      imagePath: 'assets/black-similar.png',
      name: 'Jully Kingston',
      backgroundColor: Color(0x44F9D850),
    ),
    Shoe(
      imagePath: 'assets/green-similar.png',
      name: 'Jully Kingston',
      backgroundColor: Color(0x446AD1B5),
    ),
  ];

  static List<Shoe> specialShoes = <Shoe>[
    Shoe(
      imagePath: 'assets/red-similar.png',
      name: 'Jully Kingston',
      backgroundColor: Color(0xFFF9D850),
      title: 'Casual',
      titleColor: Colors.black,
    ),
    Shoe(
      imagePath: 'assets/white-similar.png',
      name: 'Jully Kingston',
      backgroundColor: Color(0xFF6D63FF),
      title: 'Sports',
      titleColor: Colors.white,
    ),
  ];
}
