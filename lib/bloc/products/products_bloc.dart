import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:ralewayapp/models/product.dart';
import 'package:ralewayapp/repositories/product.dart';
import 'package:ralewayapp/repositories/repo_set/exception.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final _client = http.Client();

  ProductsBloc() : super(ProductsInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try {
        List<Product> products = await ProductRepository.fetchProducts(_client);
        emit(ProductsCompliedState(products: products));
      } on Exception catch (e) {
        emit(ProductsFailedState(exception: e));
      }
    });
  }

  @override
  Future<void> close() {
    _client.close();
    return super.close();
  }
}
