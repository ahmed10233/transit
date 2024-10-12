import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Const.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());

  void mainlanAR() async {
    Constant.Language = 'ar';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Language', 'ar');
    emit(LangAR());
  }

  void mainlanEN() async {
    Constant.Language = 'en';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('Language', 'en');
    emit(LangEN());
  }
}
