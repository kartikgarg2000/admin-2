import 'package:agrishot_admin/Network/Article_Api/Article_cubit/get_article_cubit.dart';
import 'package:agrishot_admin/Network/Repository/get_groups_repository.dart';
import 'package:agrishot_admin/screen/Home_screen.dart';
import 'package:agrishot_admin/screen/groups/group_create/cubit/group_create_cubit.dart';
import 'package:agrishot_admin/screen/groups/group_create/group_create.dart';
import 'package:agrishot_admin/screen/groups/group_veiw/cubit/group_cubit.dart';
import 'package:agrishot_admin/screen_managment_bloc/Home_Screen_Bloc/homescreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'Directory/routes.dart';
import 'Screen/login_screen.dart';
import 'screen_managment_bloc/Login_Bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(create: (context) => ArticleCubit()),
        BlocProvider(create: (context) => GroupCreateCubit()),
        BlocProvider(create: (context) => GroupCubit(GetGroupsRepository())),
        Provider<LoginBloc>(create: (context) => LoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff363740),
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
        ),
        // initialRoute: LoginScreen.id,
        initialRoute: HomeScreen.id,
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
