import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webshop/screens/localeModel.dart';
import 'package:provider/provider.dart';

class LangButton extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 30,
      child: FlatButton(
        onPressed: () {
          Provider.of<LocaleModel>(context, listen: false).changelocale(Locale("hu"));
        },
        onLongPress: (){
          Provider.of<LocaleModel>(context, listen: false).changelocale(Locale("en"));
        },
        child: Icon(Icons.language, color: Colors.white, size: 30,),
      ),
    );
  }

}
