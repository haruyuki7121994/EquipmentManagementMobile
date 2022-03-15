import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void getMain() => emit(0);
  void getCalendar() =>emit(1);
  void getQrcode() => emit(2);
  void getNotification() => emit(3);
  void getMore() => emit(4);

}