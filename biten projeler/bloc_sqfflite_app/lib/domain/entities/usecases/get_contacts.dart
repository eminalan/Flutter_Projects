import 'package:bloc_sqfflite_app/domain/entities/rehper.dart';
import 'package:bloc_sqfflite_app/domain/repositories/contact_repository.dart';

/// Kişileri listelemek için use case
class GetContacts {
  final ContactRepository repository;

  GetContacts(this.repository);

  /// Repository üzerinden tüm kişileri getirir
  Future<List<Rehper>> call() async {
    return await repository.getContacts();
  }
}