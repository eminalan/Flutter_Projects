import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/anasayfa_cubti.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/kisi_detay_cubit.dart';
import 'package:kisiler_uygulamasi_bloc/cubit/kisi_kayit_cubit.dart';
import 'package:kisiler_uygulamasi_bloc/sqlite/veritabani_yardimcisi.dart';
import 'package:kisiler_uygulamasi_bloc/views/anasayfa.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await VeritabaniYardimcisi.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisiKayitCubit()),
        BlocProvider(create: (context) => KisiDetayCubit()),
        BlocProvider(create: (context) => AnasayfaCubti()),
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: Anasayfa(),
      ),
    );
  }
}

ThemeData theme() {
  return ThemeData(
    useMaterial3: false,
    colorSchemeSeed: Colors.amber,
    cardTheme: CardTheme(color: Colors.amber[300]),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.amber,
      iconSize: 30,
      elevation: 10,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.amber,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );
}
