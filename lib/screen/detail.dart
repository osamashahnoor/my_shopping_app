import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_shopping_app/model/product.dart';
import 'package:my_shopping_app/widget/ratting.dart';
import 'package:my_shopping_app/widget/text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:my_shopping_app/widget/bottun.dart';
import 'package:my_shopping_app/widget/container.dart';
import 'package:my_shopping_app/widget/icons.dart';

class Detail extends StatefulWidget {
  final Product product;
  const Detail({super.key, required this.product});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool _isExpand = false;

  bool get isExpand => _isExpand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isExpand ? 45.h : 70.h,
              width: 100.w,
              child: CachedNetworkImage(
                imageUrl: widget.product.image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 1.h,
              right: 1.w,
              child: CustomContainer(
                width: 12.w,
                height: 6.h,
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Icon(
                  MyAppIcons.morevert,
                  size: 20.sp,
                  color: Colors.black,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: isExpand ? 34.h : 48.h,
              left: 3.w,
              child: CustomText(
                text: '${widget.product.price} AED',
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontFamily: 'font',
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: isExpand ? 40.h : 54.h,
                  ),
                  CustomContainer(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 0.2.w),
                    
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isExpand = !_isExpand;
                                });
                              },
                              child: Icon(
                                isExpand
                                    ? MyAppIcons.keyboard
                                    : MyAppIcons.keyboards,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            children: [
                              CustomContainer(
                                width: 10.w,
                                height: 6.h,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                  )
                                ],
                                child: Icon(
                                  MyAppIcons.upload,
                                  color: Colors.blue,
                                  size: 18.sp,
                                ),
                              ),
                              const Spacer(),
                              Bouton(
                                onpress: () {},
                                color: const Color.fromARGB(255, 42, 179, 198),
                                text: 'Order now',
                                fixedSize: Size(70.w, 7.h),
                                fontFamily: 'font',
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            widget.product.description,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            widget.product.category,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 17.sp),
                          ),
                          SizedBox(height: 1.h),
                          if (isExpand)
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: isExpand ? 1.0 : 0,
                              child: Container(
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RatingStars(rating: widget.product.rating.rate),
                                    SizedBox(height: 1.h),
                                    Text(
                                      'Rating: ${widget.product.rating.count}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 1.h,
              left: 1.w,
              child: CustomContainer(
                width: 12.w,
                height: 6.h,
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const BackButton(),
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 2.w,
              child: const CustomText(
                text: 'Details',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'font',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
