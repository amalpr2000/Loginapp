

import 'package:flutter/material.dart';
import 'package:loginapp/Screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: [
          IconButton(onPressed:(){confirmSignout(context);}, icon:Icon(Icons.exit_to_app))
        ],
      ),
      body:ListView.separated(itemBuilder: ((ctx, index) {
        return ListTile(
          title: Text('${names[index]}'),
          subtitle: Text('${msgs[index]}'),
          leading: alternate(index),
          trailing: Text('${index+10}:${index+(index+13)}'),
        );
      }), separatorBuilder:(ctx,index){return Divider();}, itemCount: 14),
    );
  }


  var names=[
    'Rahul',
    'Anjana',
    'Bilal',
    'Vishnu',
    'Amritha',
    'Jithin',
    'Amal',
    'Pranav',
    'Sam',
    'Meghna',
    'Aswin',
    'Sibin',
    'Arun',
    'Aswathy',
  ];

  var msgs=[
    'Hi',
    '??',
    'Mail me',
    'What?',
    'How are you?',
    'Where are you?',
    'Hey',
    'Call me when you are free',
    'Reply immediately',
    'When did you reach home?',
    'Are you busy?',
    '??',
    'Hey, bro',
    'Hi, what\'s up',
  ];

  Widget alternate(index){
  if(index%2==0){
    return CircleAvatar(radius: 30,backgroundImage: AssetImage('assets/images/avatar${index+1}.jpg'),);
  }else{
    return ConstrainedBox(constraints:BoxConstraints(maxHeight: 60,maxWidth: 60,minHeight: 60,minWidth: 60,),child: Image.asset('assets/images/avatar${index+1}.jpg'),);
  }
  }

  signout(BuildContext ctx) async{
    final _sharedPrefs=await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar
      (
        margin: EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        content: Text('Logout Successfully')));
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> Screen_Login()), (route) => false);
  }

  confirmSignout(BuildContext ctx){
    showDialog(context: ctx, builder: ((ctx1){
      return AlertDialog(title: Text('Signout'),
      content: Text('Are you sure?'),
      actions: [
        
        TextButton(onPressed: (){signout(ctx);Navigator.of(ctx1).pop();}, child:Text('Yes')),
        TextButton(onPressed: (){Navigator.of(ctx1).pop();}, child:Text('No')),
        
      ]
      ,);
    }));
  }


}