// ignore_for_file: cast_nullable_to_non_nullable

part of 'router_config.dart';

Widget _homeHandler(BuildContext context, GoRouterState state, Widget child) {
  return HomePage(
    child: child,
  );
}

Page<Widget> _characterPageHandler(
  BuildContext context,
  GoRouterState state,
) {
  return NoTransitionPage(child: CharacterPage());
}

Page<Widget> _detailPageHandler(
  BuildContext context,
  GoRouterState state,
) {
  final data = state.extra as List<String?>;
  return NoTransitionPage(
      child: Detail(
    title: data[0].toString(),
    url: data[1].toString(),
    species: data[2].toString(),
    type: data[3].toString(),
    gender: data[4].toString(),
  ));
}
