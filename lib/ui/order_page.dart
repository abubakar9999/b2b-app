// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:b2b/bloc/brand/brand_page_bloc.dart';
import 'package:b2b/bloc/increment/increment_bloc.dart';
import 'package:b2b/repository/data.dart';
import 'package:b2b/ui/brand_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';

class OrderPage extends StatefulWidget {
  OrderPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  BrandPageBloc brandbloc = BrandPageBloc();
  IncrementBloc increment = IncrementBloc();
  bool isEdit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brandbloc.add(SelectedProductLoaded(false));
    // widget.bloc.add(ProductAddEvent(isclic: true, selecterProducts: [] ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
          actions: [
            IconButton(
                onPressed: () {
                  brandbloc.add(ClearBoxEvent());
                },
                icon: Icon(Icons.delete)),
            IconButton(
                onPressed: () {
                  isEdit = !isEdit;

                  brandbloc.add(SelectedProductLoaded(isEdit));
                },
                icon: Icon(Icons.edit))
          ],
        ),
        body: BlocBuilder<BrandPageBloc, BrandPageState>(
            bloc: brandbloc,
            builder: (context, state) {
              if (state is BrandPageInitial) {
                return const Center(
                  child: Text("Empty Data"),
                );
              } else if (state is SelectedProductsState) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: ListView.builder(
                          itemCount: state.selectedProduct.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(

                                        children: <Widget>[
                                          Text(state.selectedProduct[index]['pName']),
                                          Text(state.selectedProduct[index]['sku']),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("${state.selectedProduct[index]['price']} ৳"),
                                          IconButton(
                                              color: Colors.red,
                                              onPressed: () {
                                                brandbloc.add(DeleteEvent(index));
                                              },
                                              icon: const Icon(Icons.close)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  state.isEdit == true
                                      ? Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("carton:"),
                                                    IconButton(
                                                        onPressed: () {
                                                          print('click');
                                                          increment.add(DecrementEvent(value: state.selectedProduct[index]['carton']));
                                                        },
                                                        icon: Icon(Icons.remove)),
                                                    BlocBuilder<IncrementBloc, IncrementState>(
                                                        bloc: increment,
                                                        builder: (_, states) {
                                                          if (states is IncremintDecrementState) {
                                                            return Text(states.val.toString());
                                                          } else {
                                                            return Text("${state.selectedProduct[index]['carton']}");
                                                          }
                                                        }),
                                                    IconButton(
                                                        onPressed: () {
                                                          print("click");
                                                          increment.add(IncsrementEvent(value: state.selectedProduct[index]['carton']));
                                                        },
                                                        icon: Icon(Icons.add)),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text("qty:"),
                                                    IconButton(
                                                        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                                        onPressed: () {
                                                          increment.add(DecrementEvent(value: state.selectedProduct[index]['qty']));
                                                        },
                                                        icon: Icon(Icons.remove)),
                                                    BlocBuilder<IncrementBloc, IncrementState>(
                                                        bloc: increment,
                                                        builder: (context, states) {
                                                          if (states is IncremintDecrementState) {
                                                            return Text(states.val.toString());
                                                          }
                                                          return Text(state.selectedProduct[index]['qty'].toString());
                                                        }),
                                                    IconButton(
                                                        onPressed: () {
                                                          increment.add(IncsrementEvent(value: state.selectedProduct[index]['qty']));
                                                        },
                                                        icon: Icon(Icons.add)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(state.selectedProduct[index]['promotion']),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(child: Text("Carton: ${state.selectedProduct[index]['carton'] ?? 0}")),
                                            Expanded(child: Text("Qty: ${state.selectedProduct[index]['qty'] ?? 0}")),
                                            Expanded(child: Text(state.selectedProduct[index]['promotion'])),
                                            Expanded(child: SizedBox())
                                          ],
                                        )
                                ],
                              ),
                            ));
                          }),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          brandbloc.add(ClearBoxEvent());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BrandListPage()), (route) => false);
                        },
                        child: Text("Submit"))
                  ],
                );
              } else {
                return const Center(
                  child: Text('Somethisg worng'),
                );
              }
            }));
  }
}
