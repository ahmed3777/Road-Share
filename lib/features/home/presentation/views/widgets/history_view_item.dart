import 'package:flutter/material.dart';
import 'package:roadshare/core/app/app_color.dart';
import 'package:roadshare/core/app/app_text_styles.dart';

class HistoryViewItem extends StatelessWidget {
  const HistoryViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return ListTile(
          leading: Icon( Icons.access_time, color: AppColors.mediumGray,),
          title: Text('Rd. Allen town',style: TextStyles.semiBold13.copyWith(color: AppColors.borderDark),),
          subtitle: Text('1901 Thornridge Cir . Shiloh',style: TextStyles.light12.copyWith(color: AppColors.borderDark),),
          trailing: Text("27Km",style: TextStyles.light10.copyWith(color: AppColors.borderDark),),
        );
      },
     
    );
  }
}