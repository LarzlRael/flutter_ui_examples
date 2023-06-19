import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;

  CustomAppBar({@required this.texto});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: EdgeInsets.only(top: 30),
          width: double.infinity,
          // color: Colors.red,
          child: Row(
            children: [
              Text(
                texto,
                style: textTheme.titleLarge.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Spacer(),
              Icon(Icons.search, size: 30)
            ],
          ),
        ),
      ),
    );
  }
}
