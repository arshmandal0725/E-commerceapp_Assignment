import 'package:e_commerce_app_assignment/models/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final ProductElement product;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.product.title!,
          style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage(
                  "assets/Vector.png",
                ),
                size: 20,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Hero(
                  tag: '${widget.product.title}',
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: const Color.fromARGB(255, 217, 228, 241),
                        border: Border.all(width: 1, color: Colors.black)),
                    child:
                        Center(child: Image.network(widget.product.images[0])),
                  ),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.brand!,
                                style: GoogleFonts.lato(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.product.title!,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                ),
                              ),
                              Row(
                                children: [
                                  PannableRatingBar(
                                    rate: widget.product.rating!,
                                    items: List.generate(
                                        5,
                                        (index) => const RatingWidget(
                                              selectedColor: Colors.yellow,
                                              unSelectedColor: Colors.grey,
                                              child: Icon(
                                                Icons.star,
                                                size: 20,
                                              ),
                                            )),
                                  ),
                                  Text(
                                    "(${widget.product.rating})",
                                    style: GoogleFonts.lato(),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Text(
                            "\$${widget.product.price!}",
                            style: GoogleFonts.lato(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        widget.product.description!,
                        style: GoogleFonts.lato(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
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
                height: 120,
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: Text(
                          "ADD TO CART",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
