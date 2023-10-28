 
import 'package:b2b/bloc/brand/brand_page_bloc.dart';
import 'package:b2b/repository/data.dart';
import 'package:b2b/ui/order_page.dart';
import 'package:b2b/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandListPage extends StatefulWidget {
  const BrandListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BrandListPageState createState() => _BrandListPageState();
}

class _BrandListPageState extends State<BrandListPage> {
  final brandList = data['brands'];
  BrandPageBloc brandbloc = BrandPageBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brandbloc.add(BrandLoaddedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand List'),
        actions: [IconButton(onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
        }, icon: const Icon(Icons.card_travel_rounded))],
      ),
      body: BlocBuilder<BrandPageBloc, BrandPageState>(
        bloc: brandbloc,
        builder: (context, state) {
          if (state is BrandLodingState) {
            return const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Loadding....."),
                ],
              ),
            );
          } else if (state is BrandLodedState) {
            print("dddddddddd$state");

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 4 / 3),
              itemCount: brandList.length,
              itemBuilder: (BuildContext context, int index) {
                final brand = state.brand[index];
                return InkWell(
                  child: Card(
                   surfaceTintColor: Colors.white,
                   shadowColor: Colors.pink[100],
                    elevation: 5,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Image.asset(
                            brand['logo'],
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                        // const SizedBox(height: 10),
                        FittedBox(
                          child: Text(
                            brand['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductListPage(products: brand['products'], )));
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('Somethig wrong'),
            );
          }
        },
      ),
    );
  }
}
