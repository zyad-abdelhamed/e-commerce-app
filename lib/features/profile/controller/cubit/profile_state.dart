part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccess extends ProfileState {}

final class ProfileLoading extends ProfileState {}

// ignore: must_be_immutable
final class ProfileFailed extends ProfileState {
  String? error;
  ProfileFailed({required this.error});
}

final class convertArabic extends ProfileState {}
final class convertEnglish extends ProfileState {}