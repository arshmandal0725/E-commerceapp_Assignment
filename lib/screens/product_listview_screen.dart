import 'package:e_commerce_app_assignment/api.dart';
import 'package:e_commerce_app_assignment/models/productmodel.dart';
import 'package:e_commerce_app_assignment/widgets/custom_appbar.dart';
import 'package:e_commerce_app_assignment/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListViewscreen extends StatefulWidget {
  const ProductListViewscreen({super.key});

  @override
  State<ProductListViewscreen> createState() => _ProductListViewscreenState();
}

class _ProductListViewscreenState extends State<ProductListViewscreen> {
  Product? product;
  List<ProductElement> allproducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    product = await fetchProducts();
    setState(() {
      allproducts = product?.products ?? [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
            backgroundColor: Colors.white, flexibleSpace: const CustomAppbar()),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: SizedBox(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: allproducts.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                            title: Material(
                          color: Colors.transparent,
                          child: ProductCard(product: allproducts[index]),
                        ));
                      },
                    ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Center(
                  child: Image.asset('assets/Tabs.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
