import 'package:flutter/material.dart';
import 'package:flutter_getx_proje/controller/profile_page_controller.dart';
import 'package:get/get.dart';


class ProfilePage extends GetView<ProfilePageController> {
  // ProfilePage, GetX'in GetView widget'ını kullanarak oluşturulmuştur.
  // Bu, ProfilePageController'a erişimi kolaylaştırır ve otomatik olarak controller'ın yaşam döngüsüne bağlanır.

  @override
  Widget build(BuildContext context) {
    // build metodu, widget'ın arayüzünü oluşturur.

    return Scaffold(
      // Scaffold, uygulama arayüzünün temel yapısını sağlar.

      floatingActionButton: FloatingActionButton(
        // Kayan bir işlem butonu ekler.
        onPressed: () {
          // Butona basıldığında controller'ın veriCek() metodunu çağırır.
          controller.veriCek(); //Bu fonksiyonun ne yaptığını dosyanın daha üstünde açıkladık.
        },
        child: const Icon(Icons.arrow_back), // Butonun ikonunu belirler.
      ),
      appBar: AppBar(title: const Text('Profile Pages')), // Uygulamanın üst kısmındaki AppBar'ı oluşturur. Başlık "Profile Pages" olarak ayarlanır.
      body: Center( // Body'nin içeriğini ortalar.
        child: Column( // Çocuk widget'ları dikey olarak sıralar.
          mainAxisAlignment: MainAxisAlignment.center, // Çocuk widget'larını dikey olarak ortalar.
          children: [ // Çocuk widget'larının listesi.
            Text("Profile Page"), // "Profile Page" yazısını gösterir.
            ElevatedButton( // Bir buton widget'ı.
              onPressed: () => Get.back(), // Butona basıldığında Get.back() metodunu çağırır. Bu, önceki sayfaya geri dönmeyi sağlar.
              /**
              Get.back() metodu, GetX navigation kütüphanesindeki bir fonksiyondur.
               Bu fonksiyon, mevcut sayfayı kapatır ve bir önceki sayfaya geri döner.
               Kullanıcı "önceki sayfaya geri dön" butonuna bastığında,
               uygulama bu fonksiyon sayesinde önceki sayfaya geri dönecektir. */
              child: Text("önceki sayfaya geri dön"), // Butonun üzerindeki metni belirler.
            ),
          ],
        ),
      ),
    );
  }
}
