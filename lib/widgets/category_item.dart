import 'package:flutter/material.dart';
import '../screens/store_screen/category_stores_screens.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem(this.id, this.title, this.imageUrl, {Key? key})
      : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRoute, arguments: {
      'id': id,
      'name': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(23),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(23), //for the image
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1), //edit the text
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(23),
            ), //center the text
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}
