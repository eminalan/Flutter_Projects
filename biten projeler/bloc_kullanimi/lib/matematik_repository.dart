class MatematikRepository {
    static int toplama(String sayi1, String sayi2) {
    int toplam = int.parse(sayi1) + int.parse(sayi2);
    return toplam;// emit(toplam)-> setstatenin yerine geçer arayüze aktarır.
  }
  static int carpma(String sayi1, String sayi2) {
    int toplam = int.parse(sayi1) * int.parse(sayi2);
    return toplam ;
  }
}