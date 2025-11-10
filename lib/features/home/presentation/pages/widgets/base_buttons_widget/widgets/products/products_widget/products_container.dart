import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/features/home/presentation/pages/widgets/base_buttons_widget/widgets/products/products_widget/products_card.dart';

class ProductsContainer extends StatefulWidget {
  const ProductsContainer({super.key});

  @override
  State<ProductsContainer> createState() => _ProductsContainerState();
}

class _ProductsContainerState extends State<ProductsContainer> {
  List<String> products = ["Помыть посуду", "Сделать уборку"];

  void addProduct() {
    setState(() {
      products.add('Напишите задачу (нажмите)');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.h,

      decoration: BoxDecoration(color: Color(0xFFFFEDD5), borderRadius: BorderRadius.circular(15)),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 390.h,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductsCard(
                  productsText: products[index],
                  onAdd: addProduct,
                  onDelete: () {
                    setState(() {
                      products.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: ElevatedButton(
              onPressed: addProduct,
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFEF8249), shape: const CircleBorder()),
              child: Icon(Icons.add, size: 25.sp),
            ),
          ),
        ],
      ),
    );
  }
}
