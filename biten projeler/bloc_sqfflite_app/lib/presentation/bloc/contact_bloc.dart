

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/usecases/add_contact.dart';
import '../../domain/entities/usecases/delete_contact.dart';
import '../../domain/entities/usecases/get_contacts.dart';
import '../../domain/entities/usecases/update_contact.dart';
import 'contact_event.dart';
import 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final GetContacts getContacts;
  final AddContact addContact;
  final UpdateContact updateContact;
  final DeleteContact deleteContact;

  ContactBloc({
    required this.getContacts,
    required this.addContact,
    required this.updateContact,
    required this.deleteContact,
  }) : super(ContactInitial()) {
    // Kişileri yükleme
    on<LoadContacts>((event, emit) async {
      emit(ContactLoading()); // Yükleniyor durumu
      final contacts = await getContacts(); // UseCase ile kişileri getir
      emit(ContactLoaded(contacts));
    });

    // Yeni kişi ekleme
    on<AddNewContact>((event, emit) async {
      await addContact(event.contact); // Veritabanına ekle
      final contacts = await getContacts(); // Güncel listeyi al
      emit(ContactLoaded(contacts));
    });

    // Kişi güncelleme
    on<UpdateExistingContact>((event, emit) async {
      await updateContact(event.contact);
      final contacts = await getContacts();
      emit(ContactLoaded(contacts));
    });

    // Kişi silme
    on<DeleteExistingContact>((event, emit) async {
      await deleteContact(event.id);
      final contacts = await getContacts();
      emit(ContactLoaded(contacts));
    });
  }
}