


String? getCurrentLanguageValue(String field){
  // una cosa per capire in che lingua è il telefono
  // cerca la stringa in base a quella lingua
  return LANG_IT[field];
}


const String DASHBOARD_CONST = "DASHBOARD";
const String POLICY_PRIVACY = "Policy privacy";
const String COME_FUNZIONA = "Come funziona?";
const String CONTATTACI = "Contattaci";
const String EVENTI = "Eventi";
const String LOGOUT = "Logout";




final Map<String,String> LANG_IT = {
  DASHBOARD_CONST:"Dashboard",
  POLICY_PRIVACY:"Policy privacy",
  COME_FUNZIONA:"Come funziona?",
  EVENTI:"Eventi",
  LOGOUT:"Logout",
  CONTATTACI:"Contattaci",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
};

final Map<String,String> LANG_EN = {
  DASHBOARD_CONST:"Dashboard",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
  "":"",
};