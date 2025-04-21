import 'package:get/get.dart';
import 'package:osman2/routes/routes.dart';
import 'package:osman2/view/ana_sayfa.dart';
import 'package:osman2/view/sayfa_2.dart';
import 'package:osman2/view_model/vm_anasayfa.dart';

abstract class Pages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.ANA_SAYFA,
      page: () => AnaSayfa(),
      transition: Transition.leftToRight,
      bindings: [
        BindingsBuilder.put(() => VmAnasayfa()),
      ],
    ),
    GetPage(
      name: Routes.SAYFA_2,
      page: () => Sayfa2(),
      transition: Transition.cupertinoDialog,
      //bindings: [BindingsBuilder.put(() => VmAnasayfa()),],
    )
  ];
}
