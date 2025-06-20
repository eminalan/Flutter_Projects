import 'package:bloc_sqfflite_app/data/model/contact_model.dart';

import '../../domain/entities/rehper.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasources/contact_local_datasource.dart';

// Repository interface'ini uygular
class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalDataSource localDataSource;

  ContactRepositoryImpl(this.localDataSource);

  @override
  Future<void> addContact(Rehper contact) async {
    final model = UserModel(
      name: contact.name,
      phone: contact.phone,
    );
    await localDataSource.insertContact(model);
  }

  @override
  Future<void> updateContact(Rehper contact) async {
    final model = UserModel(
      id: contact.id,
      name: contact.name,
      phone: contact.phone,
    );
    await localDataSource.updateContact(model);
  }

  @override
  Future<void> deleteContact(int id) async {
    await localDataSource.deleteContact(id);
  }

  @override
  Future<List<Rehper>> getContacts() async {
    return await localDataSource.getContacts();
  }
}