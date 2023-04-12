import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
   _Mywidgetstate createState()=> _Mywidgetstate();
}
  class _Mywidgetstate extends State<MyWidget>{
 late bool passwordVisible;
    
   @override
    void initState(){
      super.initState();
      passwordVisible=true;
    }    
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Field"),
     
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter text",
                    labelText: "Text field",
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter name",
                    labelText: "Name",
                    alignLabelWithHint: false,
                    filled: true,
                    icon: Icon(Icons.person_outline),
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Enter Email",
                    labelText: "E-mail",
                    prefixIcon: Icon(Icons.alternate_email),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: "Password",
                    labelText: "Password",
                    helperText:"Password must start with capital letter",
                    helperStyle:TextStyle(color:Colors.red),
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),
              ),
               Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                   // hintText: "Phone",
                    labelText: "Phone",
                    errorText:"Phone number is not valid",
                    prefixText:"+91",
                    prefixIcon: Icon(Icons.phone_android),
                    alignLabelWithHint: false,
                    filled: true,
                  ),
                  maxLength:10,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                ),
              ),
              
              Container(
              padding:EdgeInsets.all(10.0),
                child:TextField(
                  textAlign:TextAlign.center,
                 decoration:InputDecoration(
                 hintText:"Enter user name",
                   labelText:"user name",
                   alignLabelWithHint:false,
                   fillColor:Colors.green,
                   filled:true,
                   labelStyle:TextStyle(color:Colors.white),
                 ),
                  keyboardType:TextInputType.text,
                  textInputAction:TextInputAction.done,
                ),
              ),
              Container(
              padding:EdgeInsets.all(10.0),
              child:
                TextField(
                  
                decoration:InputDecoration(
                hintText:"Subject",
                  labelText:"Subject",
                  prefixText:"Message",
                  suffixText:"With regards",
                  border:OutlineInputBorder(
                  borderSide:BorderSide(width:1),
                  ),
                  filled:true,
                  alignLabelWithHint:false,
                ),
                keyboardType:TextInputType.text,
                  textInputAction:TextInputAction.done,
                ),
              ),
                Container(
              padding:EdgeInsets.all(10.0),
              child:
                TextField(
                  
                decoration:InputDecoration(
                hintText:"Message Box",
                  labelText:"Message Box",
                 
                  border:OutlineInputBorder(
                  borderSide:BorderSide(width:1),
                  ),
                  filled:true,
                  alignLabelWithHint:false,
                ),
                keyboardType:TextInputType.text,
                  textInputAction:TextInputAction.done,
                  maxLines:5,
                ),
              ),
         
            ],
          ),
        ),
      ),
    );
  }
}
