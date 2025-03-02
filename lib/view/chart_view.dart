import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      radius: 10,
      child: Container(
        width: 150,
        height: 150,
        child: TextField(
          onChanged: (value) {},
          maxLines: 6,
          style: const TextStyle(fontSize: 16, color: Colors.white),
          controller: TextEditingController(),
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
              border: InputBorder.none,
              filled: false,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: 'Text Here',
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey)),
        ),
      ),
    );
  }
}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    super.key,
    this.radius,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(
            color: color ?? const Color(0XFF1E1E1E),
          ),
          const BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black,
            inset: true,
          ),
        ],
      ),
      child: child,
    );
  }
}
