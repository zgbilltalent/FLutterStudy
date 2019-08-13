import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ' 登录'),
    );
  }
}

/*****
 * login ui view
 */
class  loginView extends StatelessWidget{
  @override
  Widget build(BuildContext context) { 
    return new ListView(
      children: <Widget>[
        new Column(
          children: <Widget>[
            loginTopImg(),
            LoginPhoneInput(),
            LoginPassInput(),
            loginButton(context),
            // loginPassEditInput(),
            // loginButton(context)
          ],
        )
      ],
    );
  } 
}
 
/****
 * login page top img
 */ 
Widget loginTopImg()  {
  return new Padding(
      padding: EdgeInsets.all(40.0),
      child: new Image.asset(
        'images/login_logo.png',
        scale: 1.3,
      ),
  );
} 

TextEditingController phoneController = new TextEditingController(); 
TextEditingController passController   = new TextEditingController(); 


/*****
 * 返回登录用户名
 */

/*****
 * login page school input
 * ***/
Widget LoginPhoneInput(){
  return new Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0 ,20.0, 0.0),
      child: new Stack(
        alignment: Alignment(1.0, 1.0),
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                 padding: EdgeInsets.all(5.0),
                 child: 
                  new Text(
                   "账户", 
                 ) ,
                
              ),
              new Expanded(
                  child: new TextField(
                    controller: phoneController,
                    decoration: new InputDecoration(
                      hintText: "用户名/手机号"
                    ),
                  )
              )
 
            ],
          ),
          new IconButton(
              icon: new Icon(Icons.clear),
              onPressed: (){
                phoneController.clear();
              } ,
          )
        ],
      ),
  );
} 

/*****
 * login page school input
 * ***/
Widget LoginPassInput(){
  return new Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0 ,20.0, 0.0),
      child: new Stack(
        alignment: Alignment(1.0, 1.0),
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Padding(
                 padding: EdgeInsets.all(5.0),
                 child: new Text(
                   "密码"
                 ),  
              ),
              new Expanded(
                  child: new TextField(
                   
                    controller: passController,
                    decoration: new InputDecoration(
                      hintText: "输入6位以上登录密码"
                    ),
                  )
              )
 
            ],
          ),
          new IconButton(
              icon: new Icon(Icons.clear),
              onPressed: (){
                phoneController.clear();
              } ,
          )
        ],
      ),
  );
} 


Widget loginButton(BuildContext context){
  return new Container(width: 200.0,padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
  child: new Card(elevation: 10.0,color: Colors.amber,
  child: new FlatButton(color: Colors.amber,
  child: new Padding(padding: EdgeInsets.all(8.0),
  child: new Text("登录",style:new TextStyle(color: Colors.white,fontSize:16.0),),),onPressed:() {
_checkSub(context);
  },),),);
}


/********
 * 登录提交校验
 */
void _checkSub(BuildContext context){
  String msgStr = "";
  if(!phoneController .text.isNotEmpty ){
    msgStr = "请先选择学校";
  } else  if(!passController.text.isNotEmpty){ 
    msgStr = "用户密码不能为空";
  }
 
  if(msgStr != ''){
    showDialog(
      context: context,
      builder: (context){
        return new AlertDialog(
          title: new Text("提示信息"),
          content: new Text(msgStr),
          actions: <Widget>[
            new FlatButton(child: new Text("确定"),onPressed: (){
              Navigator.of(context).pop();
            }),
          ],
        );
      }
    );
  }else{
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        
      }),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
 

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar( 
        title: Text(widget.title),
      ),
      body:new loginView(), 
               
    );
  }
}
