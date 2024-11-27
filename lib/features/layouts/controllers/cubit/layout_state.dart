part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}
class DashboardChangeState extends LayoutState {}

class BannersDataSuccess extends LayoutState {}
class FailedToBannersData extends LayoutState {}

class CategoriesDataSuccess extends LayoutState {}
class FailedToCategoriesData extends LayoutState {}

class ProdectsDataSuccess extends LayoutState {}
class FailedToProdectsData extends LayoutState {}

class FilterProdectsDataSuccess extends LayoutState {}

class FavouritesDataSuccess extends LayoutState {}
class FailedToFavouritesData extends LayoutState {}
class LoadingFavouritesDataLoading extends LayoutState {}

class AddAndRemoveFavouritesDataSuccess extends LayoutState {}
class FailedToAddAndRemoveFavouritesData extends LayoutState {}

class CartsDataSuccess extends LayoutState {}
class LoadingCartsDataSuccess extends LayoutState {}
class FailedToCartsData extends LayoutState {}

class AddAndRemoveCartsDataSuccess extends LayoutState {}
class FailedToAddAndRemoveCartsData extends LayoutState {}