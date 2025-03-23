import 'package:flutter/material.dart';
import 'package:marketi/core/constants/colors.dart';

class AddToCart extends StatelessWidget {
  final Function() onAdd;
  final Function() onRemove;
  const AddToCart({
    super.key,
    required this.currentNumber,
    required this.onAdd,
    required this.onRemove,
  });

  final int currentNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onRemove,
                    iconSize: 18,
                    icon: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 5),
                  Text(currentNumber.toString()),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: onAdd,
                    iconSize: 18,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add to cart
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
