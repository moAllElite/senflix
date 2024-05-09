import 'package:flutter/material.dart';
import 'package:senflix/components/custom_text.dart';
import 'package:senflix/utils/constant.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom_color.dart';
import '../components/my_snack_bar.dart';
import '../components/flat_button.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => LoginScreenState ();

}

class LoginScreenState  extends State<LoginScreen>{
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email='';
  String motDePasse='';
   bool showSpinning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinning,
        progressIndicator: const CircularProgressIndicator(
          color: isRed,
        ),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.network(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              'https://image.tmdb.org/t/p/original/bWFnii1Ge5Yw82ApSBmKfE5QJIJ.jpg',
              fit: BoxFit.cover,
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Flexible(
                    child: netflixLogo,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Form(
                    key: _formKey,
                    child:Padding(
                      padding:const EdgeInsets.symmetric(horizontal: 21.0),
                      child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'L\'email est requis';
                              }
                              return null;
                            },
                            style: kTextStyle,
                            decoration: kTextFieldFormDecoration,
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            style: kTextStyle,
                            decoration: kTextFieldFormDecoration,
                            onChanged: (value) {
                              motDePasse = value;
                            },
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return 'Le mot de passe est requis';
                              }
                              return null;
                            },
                            // style: ,
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          FlatButton(
                            null,
                            text: 'Télécharger',
                            fontSize: 20.0,
                            textColor: Colors.white,
                            fontWeight: FontWeight.normal,
                              onPressed: () async {
                                if(_formKey.currentState!.validate()){
                                  setState(() {
                                    showSpinning = true;
                                  });

                                }else{
                                  mySnackBar(
                                      backgroundColor: Colors.red,
                                      message: 'Tous les champs sont obligatoires'
                                  );
                                }
                              },
                            buttonColor: isRed,
                          ),
                        ],
                      ),
                    )

                ),
                Container(
                  margin: const EdgeInsets.only(right: 21.0,
                  ),
                  child: customText(
                    'Forget password?',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding:  const EdgeInsets.symmetric(vertical: 25.0,horizontal:38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customText('Don\'t have an account?'),
                      customText(
                          'Create one',
                          color: isRed
                      )
                    ],
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}