import 'package:flutter/material.dart';
import 'package:estrella_test/feature/character/view/character_desktop.dart';
import 'package:estrella_test/feature/character/view/character_mobile.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MediaQuery.of(context).size.width > 900 ? CharacterDesktop() : CharacterMobile();
      },
    );
  }
}
