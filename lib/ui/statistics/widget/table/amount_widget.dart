import 'package:dinner_app/common/common.dart';
import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  final double defaultValue;
  final void Function(double) didChanged;

  const AmountWidget({Key key, this.didChanged, this.defaultValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$defaultValue");
    return TextField(
      key: ValueKey(defaultValue),
      controller: TextEditingController(text: defaultValue?.toString() ?? ""),
      decoration: InputDecoration(
        labelText: "饭量",
        border: const OutlineInputBorder(),
      ),
      keyboardType:
      TextInputType.numberWithOptions(signed: false, decimal: true),
      inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
      onSubmitted: (it) => didChanged(double.tryParse(it)),
    );
  }
}
