import 'package:b2b/repository/data.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'brand_page_event.dart';
part 'brand_page_state.dart';

class BrandPageBloc extends Bloc<BrandPageEvent, BrandPageState> {
  BrandPageBloc() : super(BrandPageInitial()) {
    Box mybox = Hive.box('selectdeData');
    on<BrandLoaddedEvent>((event, emit) {
      emit(BrandLodingState());
      Future.delayed(const Duration(seconds: 3));
      emit(BrandLodedState(brand: data['brands']));
    });
    on<ProductLoadedEvent>((event, emit) {
      emit(ProductLodedState(product: event.products));
    });

    on<ProductAddEvent>((event, emit) {
      dynamic keys;
      int id = 0;
      mybox.toMap().forEach((key, value) {
        if (value['id'] == event.selecterProducts!['id']) {
          keys = key;
          id = value['id'];
        }
      });
      if (id == event.selecterProducts!['id']) {
        print('match');
        mybox.put(keys, event.selecterProducts);
      } else {
        print("no match");
        mybox.add(event.selecterProducts);
      }
    });
    on<SelectedProductLoaded>((event, emit) {
      emit(SelectedProductsState(selectedProduct: mybox.values.toList(), isEdit: event.isedit));
    });
    on<DeleteEvent>((event, emit) {
      mybox.deleteAt(event.index);
      print(mybox.keys);

      emit(SelectedProductsState(
        selectedProduct: mybox.values.toList(),
      ));
    });
    on<ClearBoxEvent>((event, emit) async {
      await Hive.box('selectdeData').clear();
      emit(SelectedProductsState(selectedProduct: mybox.values.toList()));
    });
  }
}
