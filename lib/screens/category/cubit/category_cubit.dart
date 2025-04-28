import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mtjry/models/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<Category>? categoryData = [];

  Future getCategoryData() async {
    categoryData = [];
    emit(CategoryLoading());
    try {
      var dataList =
      await FirebaseFirestore.instance.collection('categories').orderBy('rank').get();
      dataList.docs.forEach((element) {
        log(element.data().toString());
        categoryData!.add(Category.fromJson(element.data(), element.id));
        });
      emit(CategorySuccess());
    } on Exception catch (e) {
      print("#####################################################");
      emit(ErrorCategoryOccurred(error: e.toString()));
    }
  }
}
