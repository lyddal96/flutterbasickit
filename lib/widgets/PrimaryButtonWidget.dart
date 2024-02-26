import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget(this._title, this._onTap, {super.key});

  final String _title;
  final Function _onTap;

  get borderRadius => BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            _onTap();
          },
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: 60.0, //MediaQuery.of(context).size.width * .08,
            width: 220.0, //MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: borderRadius,
                    ),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  );
                }),
                Expanded(
                  child: Text(
                    _title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
