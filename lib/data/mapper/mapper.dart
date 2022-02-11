
// to convert the response into a non nullable object (model)

import 'package:complete_flutter_app/app/extensions.dart';
import 'package:complete_flutter_app/data/responses/responses.dart';
import 'package:complete_flutter_app/domain/model/model.dart';

const EMPTY ="";
const ZERO =0;

extension UserResponseMapper on UserResponse?{
  User toDomain(){  // response to domain(model)
    return User(this?.id?.orEmpty() ?? EMPTY,this?.name.orEmpty() ?? EMPTY,this?.numOfNotifications?.orZero() ?? ZERO);
  }
}

extension ContactResponseMapper on ContactResponse?{
  Contacts toDomain(){  // response to domain(model)
    return Contacts(this?.phone?.orEmpty() ?? EMPTY,this?.link.orEmpty() ?? EMPTY,this?.email?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){  // response to domain(model)
    return Authentication(this?.user?.toDomain(),this?.contacts?.toDomain());
  }
}