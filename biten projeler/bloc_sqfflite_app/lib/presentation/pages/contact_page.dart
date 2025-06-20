import 'package:bloc_sqfflite_app/core/extentions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/rehper.dart';
import '../bloc/contact_bloc.dart';
import '../bloc/contact_event.dart';
import '../bloc/contact_state.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Kişi ekleme/güncelleme formu açma fonksiyonu
  void _openContactForm(BuildContext context, [Rehper? contact]) {
    final nameController = TextEditingController(text: contact?.name ?? '');
    final phoneController = TextEditingController(text: contact?.phone ?? '');

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(contact == null ? 'Yeni Kişi Ekle' : 'Kişiyi Güncelle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Ad',
                  border: context.border,
                ),
              ),
              context.normal,
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Telefon',
                  border: context.border,
                ),
                keyboardType: TextInputType.phone,
              ),
            ],
          ),
          actions: [
            TextButton(
              style: context.btnKirmizi,
              child: Text('İptal', style: TextStyle(color: context.beyaz)),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: context.btnYesil,
              child: Text(
                contact == null ? 'Ekle' : 'Güncelle',
                style: TextStyle(color: context.beyaz),
              ),
              onPressed: () {
                final newContact = Rehper(
                  id: contact?.id,
                  name: nameController.text,
                  phone: phoneController.text,
                );

                if (contact == null) {
                  context.read<ContactBloc>().add(
                    AddNewContact(newContact),
                  ); // Yeni kişi ekle
                } else {
                  context.read<ContactBloc>().add(
                    UpdateExistingContact(newContact),
                  ); // Kişiyi güncelle
                }

                Navigator.of(context).pop(); // Dialog kapat
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kişi Rehberi', style: TextStyle(color: context.yesil)),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            ); // Yükleniyor
          } else if (state is ContactLoaded) {
            return ListView.builder(
              itemCount: state.contacts.length,
              itemBuilder: (context, index) {
                final contact = state.contacts[index];
                return ListTile(
                  title: Text(contact.name ),
                  
                  subtitle: Text(contact.phone),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed:
                            () => _openContactForm(
                              context,
                              contact,
                            ), // Güncelleme
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          context.read<ContactBloc>().add(
                            DeleteExistingContact(contact.id!),
                          ); // Silme
                        },
                      ),
                    ],
                  ),
                ).toCard();
              },
            );
          } else if (state is ContactError) {
            return Center(child: Text('Hata: ${state.message}')); // Hata durumu
          }
          return const SizedBox.shrink(); // İlk başta boş görünüm
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openContactForm(context), // Yeni kişi ekleme butonu
      ),
    );
  }
}
