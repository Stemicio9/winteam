import 'package:flutter/cupertino.dart';
import 'package:winteam/pages_v2/worker_pages/ads/ads_detail.dart';

class EmployerAdsDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AdsDetail(
      isEmployer: true,
    );
  }

}