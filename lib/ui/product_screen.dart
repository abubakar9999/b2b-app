 
import 'package:b2b/bloc/brand/brand_page_bloc.dart';
import 'package:b2b/repository/data.dart';
import 'package:b2b/ui/order_page.dart';
import 'package:flutter/material.dart';

class CartonData {
  int? quantity;
  int? carton;

  CartonData({this.quantity, this.carton});
}

class ProductListPage extends StatefulWidget {
  final List products;
  

  ProductListPage({required this.products,});

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<CartonData> cartonList = [];
  List filteredProducts = [];
   BrandPageBloc brandbloc = BrandPageBloc();

  TextEditingController searchController = TextEditingController();
  List<TextEditingController> quantityControllers = [];
  List<TextEditingController> cartonControllers = [];
 

  @override
  void initState() {
    super.initState();
    cartonList = List.generate(widget.products.length, (_) => CartonData());
    filteredProducts = widget.products;
    quantityControllers = List.generate(widget.products.length, (_) => TextEditingController());
    cartonControllers = List.generate(widget.products.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in quantityControllers) {
      controller.dispose();
    }
    for (var controller in cartonControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void filterProducts(String query) {
    // setState(() {
    //   if (query.isEmpty) {
    //     filteredProducts = widget.products;
    //   } else {
    //     filteredProducts = widget.products.where((product) {
    //       String name='';
    //       String sku='';
    //       product.forEach((e){
    //         name=  e['name'];
    //         sku= e['sku'];
    //       });
    //       return name
    //               .toLowerCase()
    //               .contains(query.toLowerCase()) ||
    //          sku.toLowerCase().contains(query.toLowerCase());
    //     }).toList();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: filterProducts,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: 'Search',
                labelStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                final quantityController = quantityControllers[index];
                final cartonController = cartonControllers[index];

                return SizedBox(
                  height: 85,
                  child: Card(
                    color: Color.fromARGB(255, 242, 247, 243),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                         
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${product['name']} | ${product['sku']}',
                                    style:const TextStyle(fontSize: 16),
                                  ),
                                 
                           
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                        const Text("Promotion:"),
                                          Text("${product['promotion']}"),
                                        ],
                                      ),
                                      SizedBox(width: 20,),
                                      Row(
                                        children: [
                                          const Text("Price :"),
                                          Text('৳${product["price"].toStringAsFixed(2)}',
                                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 70,
                                      height: 80,
                                      child: TextFormField(
                                        controller: cartonController,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: 'Carton', border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                        onChanged: (val) {
                                          cartonList[index].carton = int.tryParse(val);
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: 70,
                                      height: 80,
                                      child: TextField(
                                        onChanged: (val) {
                                          cartonList[index].quantity = int.tryParse(val);
                                        },
                                        controller: quantityController,
                                        keyboardType: TextInputType.number,
                                        decoration:
                                            InputDecoration(labelText: 'Qty', border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                for (int i = 0; i < cartonList.length; i++) {
                  print('Item $i - Quantity: ${cartonList[i].quantity}, Carton: ${cartonList[i].carton}');
                  if (cartonList[i].quantity != null || cartonList[i].carton != null) {
             brandbloc.add(ProductAddEvent(isclic: true, selecterProducts: {
                      "id":filteredProducts[i]['id'],
                      "pName": filteredProducts[i]['name'],
                      "sku": filteredProducts[i]['sku'],
                      "promotion": filteredProducts[i]['promotion'],
                      "price": filteredProducts[i]["price"],
                      "qty": cartonList[i].quantity,
                      "carton": cartonList[i].carton
                    }));
                    // cartonList[i].quantity=null;
                    // cartonList[i].carton=null;
                 
                  }
                
                }
               

                // for (var controller in quantityControllers) {
                //   controller.clear();
                // }
                // for (var controller in cartonControllers) {
                //   controller.clear();
                // }

                 Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrderPage(
                         
                        )));
              },
              child: const Text('Add'),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
