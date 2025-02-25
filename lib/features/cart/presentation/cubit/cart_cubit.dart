import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());


  // double computeTotalPrice(List<CartItem> items) {
  // return items.fold<double>(
  //   0.0,
  //   (sum, item) => sum + (item.price * item.quantity),
  // );
}
// }
