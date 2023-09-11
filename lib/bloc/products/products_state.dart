part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsCompliedState extends ProductsState {
  final List<Product> products;
  ProductsCompliedState({required this.products});
}

class ProductsFailedState extends ProductsState {
  final Exception? exception;
  ProductsFailedState({this.exception});

  bool get isRepositoryException => exception is RepositoryException;

  RepositoryException get repositoryException =>
      exception as RepositoryException;

  bool get hasException => exception != null;

  bool hasError(String key) {
    return isRepositoryException && repositoryException.errors.containsKey(key);
  }

  String getError(String key) {
    return repositoryException.errors[key][0];
  }
}
