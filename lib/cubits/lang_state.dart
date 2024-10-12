part of 'lang_cubit.dart';

@immutable
sealed class LangState {}

final class LangInitial extends LangState {}

class LangLoaded extends LangState {}

class LangAR extends LangState {}

class LangEN extends LangState {}
