import 'package:flutter/material.dart';
import 'package:my_shopping_app/api/productapi.dart';
import 'package:my_shopping_app/model/product.dart';
import 'package:my_shopping_app/screen/detail.dart';
import 'package:my_shopping_app/screen/login_screen.dart';
import 'package:my_shopping_app/widget/container.dart';
import 'package:my_shopping_app/widget/icons.dart';
import 'package:my_shopping_app/widget/ratting.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List<Product> products = [];
  bool isLoading = true;

  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final productList = await _productService.getAllProducts();
    setState(() {
      products = productList ?? [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "All Products",
          style: TextStyle(
            fontFamily: "font",
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: const Icon(MyAppIcons.login),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(4.h),
            bottomRight: Radius.circular(4.h),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(3.w),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.5.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(product: product),
                          ),
                        );
                      },
                      child: CustomContainer(
                        
                        width: double.infinity,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 0.5.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.sp),
                                  ),
                                  child: Image.network(
                                    product.image,
                                    height: 28.h,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                      vertical: 0.5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                    child: Text(
                                      "${product.price.toStringAsFixed(2)} AED",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  right: 8,
                                  child: RatingStars(rating: product.rating.rate),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: 0.5.h),
                                  Text(
                                    product.description,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(MyAppIcons.menu, size: 18.px), label: ""),
          BottomNavigationBarItem(
              icon: Icon(MyAppIcons.shopping, size: 18.px), label: ""),
          BottomNavigationBarItem(
              icon: Icon(MyAppIcons.favorite, size: 18.px), label: ""),
          BottomNavigationBarItem(
              icon: Icon(MyAppIcons.person, size: 18.px), label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          size: 22.sp,
          color: Colors.blue,
        ),
        unselectedIconTheme: IconThemeData(
          size: 18.sp,
          color: Colors.grey,
        ),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
