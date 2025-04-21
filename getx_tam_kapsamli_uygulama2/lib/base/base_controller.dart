// ignore_for_file: avoid_print

import 'package:get/get.dart';

/// `BaseController`, GetX kütüphanesinin `GetxController` sınıfını genişleterek,
/// tüm diğer controller'lar için temel işlevsellikleri ve ortak davranışları
/// sağlamak üzere oluşturulmuş soyut bir sınıftır.
class BaseController extends GetxController {
  /// `onInit()` metodu, bu controller'ın ilk kez belleğe yüklendiği ve kullanıma
  /// hazır hale geldiği anda çağrılır. Bu metot, controller başlatılırken çalıştırılacak
  /// işlemleri veya kaynakların (servisler, veri tabanları vb.) yüklenmesi gibi görevleri
  /// içerebilir.
  ///
  /// Burada, `super.onInit()` çağrısı ile `GetxController` sınıfının kendi
  /// başlatma işlemlerinin de yürütülmesi sağlanır.
  ///
  /// Ayrıca, bu örnekte, "hello world" metnini konsola yazdıran bir `print()`
  /// ifadesi bulunmaktadır. Bu, `BaseController` nesnesi oluşturulduğunda, yani
  /// controller belleğe yüklendiğinde, konsolda "hello world" metninin görüneceği
  /// anlamına gelir. Bu genellikle debug amaçlı veya bir controller'ın ne zaman
  /// başlatıldığını takip etmek için kullanılabilir.
  @override
  void onInit() {
    // `super.onInit()` çağrısı, `GetxController` sınıfının `onInit()` metodunun
    // yürütülmesini sağlar. Bu, `GetxController` tarafından sağlanan temel
    // başlatma işlemlerinin yapılmasını garanti eder.
    super.onInit();
    // Controller belleğe yüklendiğinde konsola "hello world" yazdırılır.
    print("hello world");
  }
}
