import 'dart:developer';

import 'package:env_setup/main.dart' as app;

void main(){
  app.main(env:'dev');
  log("env is dev ");
}