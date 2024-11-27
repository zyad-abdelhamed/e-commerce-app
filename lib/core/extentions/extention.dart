import 'package:ee_commerce/core/global/localization/cubit/lan_cubit.dart';

extension langextention on String{
  String get  lang{
    return  LanCubit.getinstance.localization[this] ?? '';
  }
}