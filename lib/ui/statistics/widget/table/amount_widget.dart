import 'package:dinner_app/common/common.dart';
import 'package:flutter/material.dart';

class AmountWidget extends StatelessWidget {
  final void Function(double) didChanged;

  const AmountWidget({Key key, this.didChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "饭量",
        border: const OutlineInputBorder(),
      ),
      keyboardType:
          TextInputType.numberWithOptions(signed: false, decimal: true),
      inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
      onChanged: (it) => didChanged(double.tryParse(it)),
    );
  }
}
