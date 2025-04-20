import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:estrella_test/app/routes/routes_names.dart';
import 'package:estrella_test/feature/character/controller/character_controller.dart';
import 'package:estrella_ui/estrella_ui.dart';

class CharacterDesktop extends StatelessWidget {
  CharacterDesktop({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CharacterController>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 42,
        ),
        child: Obx(() {
          return Column(
            children: [
              SizedBox(
                height: AppSpacing.md,
              ),
              Text(
                'Personajes',
                style: UITextStyle.titles.title2Medium,
              ),
              SizedBox(
                height: AppSpacing.md,
              ),
              AppTextField(
                suffixIcon: Icons.search,
                controller: searchController,
                hintText: 'Buscar...',
                onChanged: (query) {
                  if (query.length > 2) {
                    controller.searchPlanet(query);
                  } else {
                    controller.resetSearch();
                  }
                },
              ),
              controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : controller.error.value != null
                      ? Center(child: Text('Error: ${controller.error}'))
                      : Flexible(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: controller.listCharacter.length,
                            itemBuilder: (context, index) {
                              final data = controller.listCharacter[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: BaseCard(
                                    color: Colors.black,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: AppSpacing.lg,
                                          ),
                                          Image.network(
                                            data.image.toString(),
                                            height: MediaQuery.of(context).size.width / 2,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Personaje: ',
                                                    style: UITextStyle.labels.label,
                                                  ),
                                                  SizedBox(
                                                    width: AppSpacing.sm,
                                                  ),
                                                  Text(
                                                    ' ${data.name.toString()}',
                                                    style: UITextStyle.labels.label,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: AppSpacing.lg,
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 52,
                                            child: AppButton.primary(
                                                onPressed: () {
                                                  context.go(RoutesNames.detail, extra: [
                                                    data.name.toString(),
                                                    data.image,
                                                    data.species.toString(),
                                                    data.episode.toString(),
                                                    data.gender.toString(),
                                                  ]);
                                                },
                                                title: 'Más sobre...'),
                                          ),
                                          SizedBox(
                                            height: AppSpacing.lg,
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          ),
                        ),
            ],
          );
        }),
      ),
    );
  }
}
