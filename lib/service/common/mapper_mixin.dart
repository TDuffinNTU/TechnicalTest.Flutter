mixin MapperMixin<T1, T2> {
  T1 fromRepository(T2 repoType);
  T2 toRepository(T1 serviceType);
}
