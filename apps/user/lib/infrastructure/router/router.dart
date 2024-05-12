import 'package:go_router/go_router.dart';
import '../../feature/user/presentation/screen/profile_screen.dart';

final userRoute = [
];

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return const ProfileScreen();
      },)
]);
