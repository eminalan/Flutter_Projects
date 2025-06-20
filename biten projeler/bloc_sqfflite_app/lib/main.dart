import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/datasources/contact_local_datasource.dart'; // SQLite işlemleri
import 'data/repositories/contact_repository_impl.dart'; // Repository implementasyonu
import 'domain/entities/usecases/add_contact.dart';
import 'domain/entities/usecases/delete_contact.dart';
import 'domain/entities/usecases/get_contacts.dart';
import 'domain/entities/usecases/update_contact.dart';
import 'presentation/bloc/contact_bloc.dart'; // BLoC sınıfı
import 'presentation/bloc/contact_event.dart'; // BLoC event'leri
import 'presentation/pages/contact_page.dart'; // Ana sayfa

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Uygulama başlamadan önce async işlemlere izin verir

  final localDataSource = ContactLocalDataSource(); // Veritabanı erişim katmanı
  final repository = ContactRepositoryImpl(localDataSource,); // Repository nesnesi oluşturuldu

  runApp(MyApp(repository: repository)); // Uygulamayı başlat
}

class MyApp extends StatelessWidget {
  final ContactRepositoryImpl repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kişi Rehberi',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: BlocProvider(
        // BlocProvider ile ContactBloc'u sağlıyoruz
        create:
            (_) => ContactBloc(
              getContacts: GetContacts(repository),
              addContact: AddContact(repository),
              updateContact: UpdateContact(repository),
              deleteContact: DeleteContact(repository),
            )..add(LoadContacts()), // İlk açıldığında kişileri yükle
        child: const ContactPage(), // Ana sayfa
      ),
    );
  }
}


