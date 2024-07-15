import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mystrath_strathplus/views/screens/authentication_screen/nav_screens/entities_implementation/strathplus_entity_implementation.dart';


void main() {
  test(
    'Should perform a reactive action in StrathPLus Entities Implementation',
    () async {

      StrathPLusImplementation entity = const StrathPLusImplementation();


      
      bool result = (entity.reactive()) as bool;


      
      expect(result, true); 
    },
  );
}
