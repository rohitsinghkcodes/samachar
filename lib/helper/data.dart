
import 'package:samachar/Model/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = new List<CategoryModel>();

  CategoryModel categoryModel = new CategoryModel();

//First model data
  // categoryModel.categoryName = 'General';
  // categoryModel.imageURL =
  //     'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80';
  // category.add(categoryModel);

  // categoryModel = new CategoryModel();

  //Second model data
  categoryModel.categoryName = 'Technology';
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //third model data
  categoryModel.categoryName = 'Entertainment';
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //forth model data
  categoryModel.categoryName = 'Health';
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //fifth model data

  categoryModel.categoryName = 'Business';
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1480944657103-7fed22359e1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80';
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //sixth model data
  categoryModel.categoryName = 'Sports';
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  //seventh model data
  categoryModel.categoryName = 'Science';
  categoryModel.imageURL =
      'https://images.unsplash.com/photo-1507413245164-6160d8298b31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';
  category.add(categoryModel);

  categoryModel = new CategoryModel();

  return category;
}
