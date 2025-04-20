import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:estrella_test/app/routes/routes_names.dart';
import 'package:estrella_ui/estrella_ui.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.title,
    required this.url,
    required this.species,
    required this.type,
    required this.gender,
  });

  final String title;
  final String url;
  final String species;
  final String type;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(RoutesNames.character);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          style: UITextStyle.titles.title2Medium,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: AppSpacing.lg,
              ),
              Image.network(url),
              SizedBox(
                height: AppSpacing.lg,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'especialidad: $species',
                  style: UITextStyle.labels.label,
                ),
              ),
              SizedBox(
                height: AppSpacing.lg,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'location: $type',
                  style: UITextStyle.labels.label,
                ),
              ),
              SizedBox(
                height: AppSpacing.lg,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'genero: $gender',
                  style: UITextStyle.paragraphs.paragraph1Regular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
