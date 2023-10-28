// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brand_page_bloc.dart';

@immutable
sealed class BrandPageEvent {}

class BrandLoaddedEvent extends BrandPageEvent {}

class ProductLoadedEvent extends BrandPageEvent {

  List products=[];
  ProductLoadedEvent(
 
    this.products,
  );
}
class ProductAddEvent extends BrandPageEvent {
  bool isclic;
  Map? selecterProducts;
  ProductAddEvent({
    required this.isclic,
    this.selecterProducts,
  });
}
class SelectedProductLoaded extends BrandPageEvent{
  bool? isedit;
  SelectedProductLoaded(this.isedit);

}

class DeleteEvent  extends BrandPageEvent{
  int index;
  DeleteEvent(this.index);
 
  
}
class ClearBoxEvent extends BrandPageEvent {
  
}
class EditEvent extends BrandPageEvent {
  
}


