import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_text_styles.dart';
import 'package:roadshare/core/utils/app_images.dart';
import 'package:roadshare/generated/l10n.dart';

class CustomLoginTextField extends StatelessWidget {
  const CustomLoginTextField({super.key, required this.phoneController});
final TextEditingController phoneController ;

  @override
  Widget build(BuildContext context) {
    return 
Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  decoration: BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 2,
        offset: Offset(0, 2),
      ),
    ],
  ),
  child: Row(
    children: [
      // Flag icon
      CircleAvatar(
        radius: 16,
        // Replace with your flag icon from data base 
        backgroundImage: AssetImage(Assets.imagesIconegypt),
      ),
      const SizedBox(width: 8),

      // Dropdown icon
      const Icon(Icons.arrow_drop_down, color: Colors.grey),

      const SizedBox(width: 8),

      // Input placeholder
      Expanded(
        child: SizedBox(
          height: 30,
          child: TextFormField(
            controller: phoneController ,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: S.of(context).Enter_Phone,
            ),
            keyboardType: TextInputType.phone,
            style: TextStyles.regular12.copyWith(color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  ),
);
  }
  }