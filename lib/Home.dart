import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  var Languages=['Germany','English','Arabic'];
  var OriginalLanguage="From";
  var DestinationLanguage="To";
  var Output="";
  TextEditingController LanguageController=TextEditingController();
  void Translate(String src,String dest,String input)async
  {
      GoogleTranslator Translator=new GoogleTranslator();
      var translation=await Translator.translate(input,from: src,to: dest);
      setState(() {
        Output=translation.text.toString();
      });
      if(src=='.'|| dest=='.')
        {
          setState(() {
            Output='Fail to Translate';
          });
        }
  }
  String getLanguageCode(String language)
  {
    if(language=='Germany')
      return 'Ge';
    else if(language=='English')
      return 'En';
    else
      return 'Ar';
    return '.';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 40,
        backgroundColor: Color(0xff10223d),
        centerTitle: true,
        title: Text(
          'Language translate ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Color(0xff10223d),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 DropdownButton(
                   iconEnabledColor: Colors.white,
                   hint: Text(
                     OriginalLanguage,
                     style: TextStyle(
                       color: Colors.white,
                     ),
                   ),
                   dropdownColor: Colors.white,
                   icon: Icon(
                     Icons.keyboard_arrow_down_outlined,
                   ),
                   items: Languages.map((String dropDownStringItem){
                       return DropdownMenuItem(child: Text(dropDownStringItem),
                       value: dropDownStringItem,);
                   }).toList(),
                   onChanged: (String?value){
                     setState(() {
                       OriginalLanguage=value!;
                     });
                   },
                 ),
                  SizedBox(width: 50,),
                  Icon(Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 50,),
                  DropdownButton(
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      DestinationLanguage,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(
                      Icons.keyboard_arrow_down_outlined,
                    ),
                    items: Languages.map((String dropDownStringItem){
                      return DropdownMenuItem(child: Text(dropDownStringItem),
                        value: dropDownStringItem,);
                    }).toList(),
                    onChanged: (String?value){
                      setState(() {
                        DestinationLanguage=value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Padding(padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    autofocus: false,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Please Enter Your Text ',
                      labelStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.white,
                           width: 3,
                         ),
                      ),
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                    controller: LanguageController,
                    validator: (value){
                      if(value==null||value.isEmpty)
                        return 'Please enter your text to translate!';
                      return null;
                    },
                  ),
              ),
              Padding(padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(foregroundColor: Color(0xff2b3c5a),
                    backgroundColor: Color(0xff2b3c5a),
                  ),
                    child: Text('Translate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                    ),
                  onPressed: (){
                     String srcCode=getLanguageCode(OriginalLanguage);
                     String destCode=getLanguageCode(DestinationLanguage);
                     String inputText=LanguageController.text.toString();
                     Translate(srcCode, destCode, inputText);
                  },
                ),
              ),
                  SizedBox(height: 20,),
              Padding(padding: EdgeInsets.all(8),
               child: Text(
                   Output,
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 40,
                 ),
               ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
