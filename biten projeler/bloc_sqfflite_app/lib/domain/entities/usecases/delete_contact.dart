import "package:bloc_sqfflite_app/domain/repositories/contact_repository.dart";


/// Kişi silme işlemini yöneten use case
class DeleteContact {
final ContactRepository repository;

DeleteContact(this.repository);

/// Belirtilen ID’ye sahip kişiyi siler
Future call(int id) async {
await repository.deleteContact(id);
}
}