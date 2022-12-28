String? getCurrentLanguageValue(String field) {
  // una cosa per capire in che lingua è il telefono
  // cerca la stringa in base a quella lingua
  return LANG_IT[field];
}

const String APP_TITLE = "W1N";

const String DASHBOARD_CONST = "DASHBOARD";
const String POLICY_PRIVACY = "Policy privacy";
const String COME_FUNZIONA = "Come funziona?";
const String CHI_SONO = "Chi sono";
const String I_MIEI_DATI = "I miei dati";
const String MANSIONI = "Mansioni";
const String CONTATTACI = "Contattaci";
const String EVENTI = "Eventi";
const String LOGOUT = "Logout";
const String LOGIN = "Login";
const String CONFIRM = "Conferma";
const String REGISTER = "Registrati";
const String RICORDAMI = "Ricordami";
const String EMAIL = "Email";
const String PASSWORD = "Password";
const String PASSWORD_CONFIRM = "Conferma password";
const String FORGOT_PASSWORD = "Hai dimenticato la password?";
const String DONT_HAVE_AN_ACCOUNT = "Non hai un account?";
const String PASSWORD_RECOVERY = "Recupera password";
const String INSERT_EMAIL= "Inserisci la tua email";
const String BACK= "Torna indietro";
const String I_ALREADY_HAVE_ACCOUNT= "Ho già un account";
const String REMOVE_ACCOUNT = "Elimina il tuo account";
const String PROFILE_NAME_PLACEHOLDER = "Inserisci nome e cognome";
const String PROFILE_DESCRIPTION_PLACEHOLDER = "Inserisci una breve descrizione";
const String PHONE_PLACEHOLDER = "Inserisci una numero di telefono";
const String POSITION_PLACEHOLDER = "Inserisci la tua posizione";
const String ADD_SKILLS = "Aggiungi mansione";
const String GALLERY = "Seleziona foto dalla galleria";
const String ADS_AUTOCOMPLETE = "Mansione o Azienda";
const String CAMERA = "Scatta una foto";
const String FILTER = "Filtra";
const String OFFERS = "offerte";
const String ANNUNCIO = "Annuncio";
const String APPLY = "Candidati";


const String SAVE= "Salva";
const String CANCEL= "Annulla";

const String DESCRIPTION= "Inserisci una descrizione";
const SEARCH_SKILL="Cerca la mansione";







//Pagine bottombar
const String HOME = "Home";
const String SEARCH = "Cerca";
const String PROFILE = "Profilo";
const String NOTIFICATIONS = "Notifiche";
const String DASHBOARD = "Dashboard";




// Stati degli annunci
const String ACTIVE = "active";
const String CURRENT = "current";
const String ACCEPTED = "accepted";
const String HISTORY = "history";

// Parti della giornata
const String MORNING = "morning";
const String AFTERNOON = "afternoon";
const String EVENING = "evening";
const String NIGHT = "night";

const List<String> filterHourSlotToSend = [MORNING, AFTERNOON, EVENING, NIGHT];

// Tipi di utente
const String USER_DATORE = "DATORE";
const String USER_LAVORATORE = "LAVORATORE";
const String USER_AMMINISTRATORE = "AMMINISTRATORE";

// Richieste sulla subscription

const String WHAT_SEARCH = "search";
const String WHAT_CREATE_ADVERTISEMENT = "createAdvertisement";

const String CONFERMA = "CONFERMA";
const String ANNULLA = "ANNULLA";

const String BANNER_CANNOT_SEARCH_USER = "CANNOT_SEARCH_USER";
const String CANNOT_LOAD_SUBSCRIPTION_INFO = "CANNOT_LOAD_SUBSCRIPTION_INFO";

const String GESTISCI_ABBONAMENTO = "GESTISCI_ABBONAMENTO";
const String INFORMAZIONI_DI_CONTATTO = "INFORMAZIONI_DI_CONTATTO";
const String CHI_SIAMO = "CHI_SIAMO";


final Map<String, String> LANG_IT = {
  DASHBOARD_CONST: "Dashboard",
  POLICY_PRIVACY: "Policy privacy",
  COME_FUNZIONA: "Come funziona?",
  EVENTI: "Eventi",
  LOGOUT: "Logout",
  LOGIN: "Login",
  CONFIRM: "Conferma",
  EMAIL: "Email",
  FORGOT_PASSWORD: "Hai dimenticato la password?",
  DONT_HAVE_AN_ACCOUNT: "Non hai un account?",
  PASSWORD_RECOVERY: 'Recupera password',
  REGISTER: "Registrati",
  PASSWORD: "Password",
  PASSWORD_CONFIRM: "Conferma password",
  INSERT_EMAIL: "Inserisci la tua email",
  BACK:"Torna indietro",
  I_ALREADY_HAVE_ACCOUNT: "Ho già un account",
  RICORDAMI:"Ricordami",
  CONTATTACI: "Contattaci",
  ACTIVE: "ATTIVO",
  HOME: "Home",
  PROFILE: "Profilo",
  SEARCH: "Cerca",
  ANNUNCIO: "Annuncio",
  NOTIFICATIONS: "Notifiche",
  ACCEPTED: "ACCETTATO",
  HISTORY: "ARCHIVIATO",
  CURRENT: "IN CORSO",
  USER_AMMINISTRATORE: "AMMINISTRATORE",
  USER_DATORE: "DATORE",
  USER_LAVORATORE: "LAVORATORE",
  CONFERMA: "Conferma",
  BANNER_CANNOT_SEARCH_USER:
      "IL TUO ABBONAMENTO NON TI PERMETTE DI VEDERE TUTTI I DATI DEI RISULTATI DI RICERCA, AGGIORNA IL TUO ABBONAMENTO",
  CANNOT_LOAD_SUBSCRIPTION_INFO:
      "Non riesco a caricare i dati dell'abbonamento",
  GESTISCI_ABBONAMENTO: "Vedi abbonamento",
  INFORMAZIONI_DI_CONTATTO: "Informazioni di contatto",
  CHI_SIAMO: "Chi siamo",
  CHI_SONO: "Chi sono",
  I_MIEI_DATI: "I miei dati",
  MANSIONI: "Mansioni",
  PROFILE_NAME_PLACEHOLDER: "Inserisci nome e cognome",
  PROFILE_DESCRIPTION_PLACEHOLDER: "Inserisci una breve descrizione",
  PHONE_PLACEHOLDER: "Inserisci un numero di telefono",
  POSITION_PLACEHOLDER: "Inserisci la tua posizione",
  ADD_SKILLS:"Aggiungi mansione",
  SEARCH_SKILL:"Cerca la mansione",
  SAVE: "Salva",
  DESCRIPTION: "Inserisci una descrizione",
  CAMERA:"Scatta una foto",
  GALLERY:"Seleziona una foto dalla galleria",
  CANCEL:"Annulla",
  ADS_AUTOCOMPLETE:"Mansione o Azienda",
  FILTER: "Filtra",
  REMOVE_ACCOUNT: "Elimina il tuo account",
  OFFERS: "offerte",
  DASHBOARD: "Dashboard",
  APPLY: "Candidati",


  "": "",
  "": "",
  "": "",
  "": "",
};

final Map<String, String> LANG_EN = {
  DASHBOARD_CONST: "Dashboard",
  "": "",
  ACTIVE: "ACTIVE",
  ACCEPTED: "ACCEPTED",
  HISTORY: "HISTORY",
  CURRENT: "CURRENT",
  USER_AMMINISTRATORE: "AMMINISTRATORE",
  USER_DATORE: "DATORE",
  USER_LAVORATORE: "LAVORATORE",
  "": "",
  "": "",
  "": "",
  "": "",
  "": "",
  "": "",
  "": "",
  "": "",
  "": "",
};

// image constants

const String BACKGROUND_IMAGE_NAME = "background-image.png";
const String LOGO_IMAGE_NAME = "logo-white.png";
