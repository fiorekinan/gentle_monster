import 'package:flutter/material.dart';
import 'package:gentle_monster_app/utils/const.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 207),
      child: PageView(
        children: [
          _BannerImage(asset: "assets/images/bannergm_1.png"), //hapus slash di sebelah asset biar muncul
          _BannerImage(asset: "assets/images/bannergm_2.png"),
          _BannerImage(asset: "assets/images/bannergm_3.png"),
          _BannerImage(asset: "assets/images/bannergm_4.png"),
        ],
      ),
      );
  }
}

class _BannerImage extends StatelessWidget {
  final String asset;

  const _BannerImage({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Image.asset(asset, fit: BoxFit.cover,),
      );
  }
}