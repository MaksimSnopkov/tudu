import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tudu/config/styles.dart';

class ProductsButton extends StatelessWidget {
  const ProductsButton({super.key, required this.onTap, this.isActive = false});

  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(108.w, 80.h),
        elevation: 12,
        backgroundColor: Color(0xFFFFEDD5),
        side: BorderSide(width: 2.w, color: Color(0xFFEF8249)),
      ),
      child: Text(
        'Cписок покупок',
        textAlign: TextAlign.center,
        style: AppStyles.taskText.copyWith(color: Color(0xFFEF8249)),
      ),
    );
  }
}
