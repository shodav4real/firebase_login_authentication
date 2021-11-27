import 'package:flutter/material.dart';
import '';

Padding textButtons(String path) {
  /* SizedBox(
                    height: 40,
                    width: 100,
                    child: InkWell(
                      onTap: () {},
                      child: Image.asset('assets/googleIcon.png'),
                    ),
                  ), */
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: SizedBox(
      width: 80,
      height: 40,
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(width: 2, color: Colors.grey),
          ))),
          onPressed: () {},
          child: Image(image: AssetImage(path))),
    ),
  );
}
