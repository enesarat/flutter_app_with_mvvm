enum LanguageType {ENLISH,ARABIC}

const String ARABIC ="ar";
const String ENGLISH ="en";

extension LanguageTypeExtension on LanguageType{
  String getValue(){
    switch(this){
      case LanguageType.ENLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}