import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  String? title;
  String? image;
  Color? backgroundColor;
  Function? onTap;

  Menu({
    Key? key,
    this.title,
    this.image,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor!,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              image!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title!,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
