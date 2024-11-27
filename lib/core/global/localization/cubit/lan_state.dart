part of 'lan_cubit.dart';

@immutable
sealed class LanState {}

final class LanInitial extends LanState {}
final class convertArabic extends LanState {}
final class convertEnglish extends LanState {}