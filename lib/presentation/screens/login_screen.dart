import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

   final GlobalKey<FormState> _phoneFormKey = GlobalKey();
  late String phoneNumber ;

  Widget _buildIntroTexts (){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your phone numbeer?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            "What is your phone numbeer to verify your account",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneFormField (){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12 ,vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.lightGrey),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Text(
                _generateCountryFlag() + ' +20',
              style: TextStyle(
                fontSize:18,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(width: 16,),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12 ,vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.blue),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: TextFormField(
              autofocus: true,
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,
              ),
              decoration: InputDecoration( border: InputBorder.none, ),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value){
                if(value!.isEmpty){
                  return 'please enter your phone number !' ;
                }else if (value.length <11){
                  return 'too short for a phone number !';
                }
                return null ;
              },
              onSaved: (value){
                phoneNumber = value! ;
              },

            ),
          ),
        ),

      ],
    );
  }

  String _generateCountryFlag(){
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

   Widget _buildNextButton(){
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
          onPressed: (){},
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white ,fontSize: 16),
          ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _phoneFormKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32,vertical: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntroTexts(),
                SizedBox(height: 100,),
                _buildPhoneFormField(),
                SizedBox(height: 70,),
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
