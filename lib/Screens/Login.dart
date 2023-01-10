
import 'package:flutter/material.dart';
import 'package:loginapp/Screens/Homepage.dart';
import 'package:loginapp/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen_Login extends StatelessWidget {
  Screen_Login({super.key});

  final _usernameController =TextEditingController();
  final _passwordController =TextEditingController();

  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Login Page',),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formkey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LOGIN',style:TextStyle(fontSize: 25,fontWeight:FontWeight.w800,),),
          
              SizedBox(height: 50,),
          
              TextFormField(style: TextStyle(fontFamily:'thinfont',fontWeight: FontWeight.bold),controller: _usernameController,decoration: InputDecoration(border: OutlineInputBorder(),hintText:'Username',labelText: 'Username',filled: true,fillColor:Color.fromARGB(255, 239, 238, 238),),
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'Please enter the username';
                }else{
                  return null;
                }
              },),
          
              SizedBox(height: 25,),
          
              TextFormField(style: TextStyle(fontFamily:'thinfont',fontWeight: FontWeight.bold),controller: _passwordController,obscureText: true,decoration: InputDecoration(border: OutlineInputBorder(),hintText:'Password',labelText:'Password',filled: true,fillColor:Color.fromARGB(255, 239, 238, 238),),
              validator: (value) {
                if(value==null || value.isEmpty){
                  return 'Please enter the password';
                }else{
                  return null;
                }
              },),
          
              SizedBox(height: 25,),
          
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  checkLogin(context); 
                }
              }, 
              child:Text('LOGIN',style: TextStyle(fontWeight: FontWeight.w800),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo),padding: MaterialStateProperty.all(EdgeInsets.only(left:145,top:15,bottom:15,right:145)),),)
            ],
                ),
          ),
        )),

    );
  }


  void checkLogin(BuildContext ctx) async{
    final _username = _usernameController.text;
    final _password = _passwordController.text;

    if(_username=='amal' && _password=='123'){
      
      final _sharedPrefs=await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY, true);
      
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar
      (
        margin: EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        content: Text('Login Successfully')));

      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: ((ctx) => Homepage())));

    }else{
      
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar
      (
        margin: EdgeInsets.all(15),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        content: Text('Username or Password invalid')));

    
    }


  }
}
