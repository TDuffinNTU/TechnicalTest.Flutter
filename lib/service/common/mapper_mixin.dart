mixin MapperMixin<T1, T2> {
  T1 fromRepository(T2 repoType);
  T2 toRepository(T1 serviceType);

  List<T1> fromRepositoryList(List<T2> repoType) {
    return repoType.map(fromRepository).toList();
  }

  List<T2> tpRepositoryList(List<T1> serviceType) {
    return serviceType.map(toRepository).toList();
  }
}
