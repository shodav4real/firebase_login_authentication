import 'package:flutter/material.dart';

class TextFieldInputs extends StatelessWidget {
  final String _label;
  final IconData _icon;
  final TextEditingController _controller;

  // ignore: use_key_in_widget_constructors
  const TextFieldInputs(this._label, this._icon, this._controller);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  _icon,
                  size: 14,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                _label,
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
