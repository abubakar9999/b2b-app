// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brand_page_bloc.dart';

@immutable
sealed class BrandPageState {}
final class BrandPageInitial extends BrandPageState {}
final class BrandLodingState extends BrandPageState {}
  class BrandLodedState extends BrandPageState {
  List brand;
  BrandLodedState({required this.brand});
}
  class ProductLodedState extends BrandPageState {
  List product;
 ProductLodedState({required this.product});
}
class SelectedProductsState extends BrandPageState {
  List selectedProduct;
  bool? isEdit;
 
  SelectedProductsState({
    this.isEdit,

    required this.selectedProduct
  });

}

