import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(this.meal, this.goToMealDetails, {Key? key}) : super(key: key);

  final Meal meal;

  final void Function() goToMealDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: goToMealDetails,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(
                meal.imageUrl,
              ),
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          // Image.network(
          //   meal.imageUrl,
          //   width: double.infinity,
          //   height: 300,
          //   fit: BoxFit.cover,
          // ),
          Positioned(
            child: Container(
              alignment: Alignment.center,
              color: Colors.black54,
              width: double.infinity,
              child: Text(
                meal.title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
