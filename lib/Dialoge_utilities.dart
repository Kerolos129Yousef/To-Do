import 'package:flutter/material.dart';

void showMessage(BuildContext context, String message,
    {String? posActionName,VoidCallback? posAction,String?negActionName,VoidCallback ?negAction,bool isCancelable = true}) {
  List<Widget> actions = [];
  if(posActionName!=null){
    actions.add(TextButton(onPressed: (){
        Navigator.pop(context);
        if(posAction != null)
          posAction();
    }, child: Text(posActionName)));
  }
  if(negActionName!=null){
    actions.add(TextButton(onPressed: (){
      Navigator.pop(context);
      if(negAction!=null)
        negAction();
    }, child: Text(negActionName)));
  }
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          actions: actions,
          content: Text(message,),
        );
      },barrierDismissible: isCancelable);
}
void showLoading(BuildContext context , String loadingMessage,{isCancelable = true}){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      content: Row(
        children: [
          SizedBox(width:20,
              height: 20,
              child: CircularProgressIndicator()),
          SizedBox(width: 10,),
          Text(loadingMessage)
        ],
      ),
    );
  },barrierDismissible: isCancelable);
}
void hideLoading(BuildContext context){
  Navigator.pop(context);
}
