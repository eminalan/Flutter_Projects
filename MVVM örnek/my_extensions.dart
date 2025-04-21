extension MyListExtensions<T,E> on List<E>{
  bool myRemoveWhere(bool Function(E item) test) {
    bool result=false;
    for (var i = 0; i < length; i++) {
      if (test(this[i])) {
        remove(this[i]);
        result =true;
      }
    }
    return result;
  }
}