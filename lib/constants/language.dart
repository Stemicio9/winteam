String? getCurrentLanguageValue(String field) {
  // una cosa per capire in che lingua è il telefono
  // cerca la stringa in base a quella lingua
  return LANG_IT[field];
}

const String APP_TITLE = "W1N";

const String DASHBOARD_CONST = "DASHBOARD";
const String POLICY_PRIVACY = "Privacy Policy";
const String COME_FUNZIONA = "Come funziona";
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
const String INSERT_EMAIL = "Inserisci la tua email";
const String BACK = "Torna indietro";
const String I_ALREADY_HAVE_ACCOUNT = "Ho già un account";
const String REMOVE_ACCOUNT = "Rimuovi account";
const String PROFILE_NAME_PLACEHOLDER = "Inserisci il nome";
const String PROFILE_SURNAME_PLACEHOLDER = "Inserisci il cognome";

const String PROFILE_DESCRIPTION_PLACEHOLDER =
    "Inserisci una breve descrizione";
const String PHONE_PLACEHOLDER = "Inserisci un numero di telefono";
const String POSITION_PLACEHOLDER = "Inserisci la tua posizione";
const String ADD_SKILLS = "Aggiungi mansione";
const String GALLERY = "Seleziona foto dalla galleria";
const String ADS_AUTOCOMPLETE = "Mansione o Azienda";
const String ADS_AUTOCOMPLETE_USERS = "Inserisci una mansione...";
const String CAMERA = "Scatta una foto";
const String FILTER = "Filtra";
const String OFFERS = "offerte";
const String ANNUNCIO = "Dettaglio annuncio";
const String APPLY = "Candidati";
const String ADS_DESCRIPTION = "Descrizione";
const String CANDIDATES = "Si sono già candidate";
const String CANDIDATE = "Si è già candidata";
const String NO_CANDIDATE = "Nessuno si è ancora candidato per questo lavoro";
const String FILTERS = "Filtri";
const String CANCEL_APPLICATION = "Annulla candidatura";
const String VIEW_APPLIES = "Visualizza candidati";
const String NOTICE = "Avviso";
const String EMPTY_NAME = "Nome Cognome";
const String EMPTY_COMPANY_NAME = "Nome Azienda";
const String EMPTY_BRIEF = "Inserisci breve descrizione";
const String EMPTY_DESCRIPTION = "Inserisci descrizione";
const String EMPTY_PHONE = "Inserisci telefono";
const String EMPTY_EMAIL = "Inserisci email";
const String EMPTY_POSITION = "Inserisci indirizzo";
const String EMPTY_SKILLS = "Nessuna mansione inserita";

const String EMPTY_NAME_ONLYVIEW = "Nome non disponibile";
const String EMPTY_BRIEF_ONLYVIEW = "Breve descrizione non disponibile";
const String EMPTY_DESCRIPTION_ONLYVIEW = "Descrizione non disponibile";
const String EMPTY_PHONE_ONLYVIEW = "Telefono non disponibile ";
const String EMPTY_EMAIL_ONLYVIEW = "Email non disponibile ";
const String EMPTY_POSITION_ONLYVIEW = "Indirizzo non disponibile";



const String USERS = "Utenti";
const String DETAILS = "Dettagli";
const String SAVE = "Salva";
const String CANCEL = "Annulla";
const String DESCRIPTION = "Inserisci una descrizione";
const String SEARCH_SKILL = "Cerca una mansione";
const String PEOPLE = "Persone";
const String PERSON = "Persona";
const String REMOVE_ALL = "Rimuovi tutto";
const String LOWEST_PRICE = "Prezzo minimo";
const String DATE = "Data";
const String RANGE_TIME = "Fascia oraria";
const String FILTER_APPLY = "Applica";
const String CREATE_ADS = "Crea annuncio";
const String SEARCH_WORKER = "Cerca lavoratore";
const String MANSIONE = "Mansione";
const String POSTED_ADS = "Annunci pubblicati";
const String COMPENSO = "Compenso";
const String PLACE = "Luogo";
const String POST = "Pubblica";
const String MANAGE_SUBSCRIPTION = "Gestisci abbonamento";
const String SELECT_DATE = "Seleziona una data";
const String INSERT_POSITION = "Inserisci la tua posizione";
const String INSERT_SKILL = "Inserisci una mansione";
const String OUR_CONTACTS = "I nostri contatti";
const String ABOUT_US = "Chi siamo";
const String VIEW_PROFILE = "Visualizza profilo";
const String CANDIDATES_LIST = "Lista candidati";
const String VIEW = "Visualizza";
const String CHOOSE = "Scegli!";
const String VIEW_AD = "Visualizza annuncio";
const String VIEW_ADS = "Visualizza annunci";
const String FILTER_ACTIVE = "Filtri attivi";
const String EMPTY_MESSAGE= "Non sono presenti annunci che rispettano i criteri selezionati";
const String SEARCH_EMPTY_MESSAGE = "Non sono presenti profili che rispettano i criteri selezionati";


//Pagine bottombar
const String HOME = "Home";
const String SEARCH = "Cerca";
const String PROFILE = "Profilo";
const String NOTIFICATIONS = "Notifiche";
const String ADS = "Annunci";
const String WORKER_PERSONAL_ADS = "I miei annunci";
const String CREATE = "Crea";

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

const String OTHER_CANDIDATES = "OTHER_CANDIDATES";

final Map<String, String> LANG_IT = {
  DASHBOARD_CONST: "Dashboard",
  POLICY_PRIVACY: "Privacy Policy",
  COME_FUNZIONA: "Come funziona",
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
  BACK: "Torna indietro",
  I_ALREADY_HAVE_ACCOUNT: "Ho già un account",
  RICORDAMI: "Ricordami",
  CONTATTACI: "Contattaci",
  ACTIVE: "ATTIVO",
  HOME: "Home",
  PROFILE: "Profilo",
  SEARCH: "Cerca",
  ANNUNCIO: " Dettaglio annuncio",
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
  PROFILE_NAME_PLACEHOLDER: "Inserisci il nome",
  PROFILE_SURNAME_PLACEHOLDER: "Inserisci il cognome",
  PROFILE_DESCRIPTION_PLACEHOLDER: "Inserisci una breve descrizione",
  PHONE_PLACEHOLDER: "Inserisci un numero di telefono",
  POSITION_PLACEHOLDER: "Inserisci la tua posizione",
  ADD_SKILLS: "Aggiungi mansione",
  SEARCH_SKILL: "Cerca una mansione",
  SAVE: "Salva",
  DESCRIPTION: "Inserisci una descrizione",
  CAMERA: "Scatta una foto",
  GALLERY: "Seleziona una foto dalla galleria",
  CANCEL: "Annulla",
  ADS_AUTOCOMPLETE: "Mansione o Azienda",
  FILTER: "Filtra",
  REMOVE_ACCOUNT: "Romuovi account",
  OFFERS: "offerte",
  ADS: "Annunci",
  APPLY: "Candidati",
  ADS_DESCRIPTION: 'Descrizione',
  CANDIDATES: 'Si sono già candidate',
  CANDIDATE: 'Si è già candidata',
  NO_CANDIDATE: 'Nessuno si è ancora candidato per questo lavoro',
  USERS: 'Utenti',
  DETAILS: 'Dettagli',
  PERSON: 'Persona',
  PEOPLE: 'Persone',
  FILTERS: 'Filtri',
  REMOVE_ALL: "Rimuovi tutto",
  REMOVE_ALL: "Rimuovi tutto",
  LOWEST_PRICE: "Prezzo minimo",
  DATE: "Data",
  RANGE_TIME: "Fascia oraria",
  FILTER_APPLY: "Applica",
  CREATE: "Crea",
  CREATE_ADS: "Crea annuncio",
  SEARCH: "Ricerca lavoratore",
  MANSIONE:"Mansione",
  POSTED_ADS:"Annunci pubblicati",
  COMPENSO:"Compenso",
  PLACE:"Luogo",
  POST:"Pubblica",
  MANAGE_SUBSCRIPTION:"Gestisci abbonamento",
  SELECT_DATE:"Seleziona una data",
  INSERT_POSITION:"Inserisci la tua posizionr",
  INSERT_SKILL:"Inserisci una mansione",
  OUR_CONTACTS:"I nostri contatti",
  ABOUT_US:"Chi siamo",
  VIEW_PROFILE:"Visualizza profilo",
  CANDIDATES_LIST:"Lista candidati",
  VIEW:"Visualizza",
  CHOOSE:"Scegli!",
  CANCEL_APPLICATION:"Annulla candidatura",
  VIEW_APPLIES:"Visualizza candidati",
  NOTICE:"Avviso",
  VIEW_AD:"Visualizza annuncio",
  VIEW_ADS:"Visualizza annunci",
  OTHER_CANDIDATES:"Altri candidati",
  FILTER_ACTIVE:"Filtri attivi",
  EMPTY_MESSAGE:"Non sono presenti annunci che rispettano i criteri selezionati",
  EMPTY_NAME:"Nome Cognome",
  EMPTY_COMPANY_NAME:"Nnome Azienda",
  EMPTY_DESCRIPTION:"Inserisci descrizone",
  EMPTY_BRIEF:"Inserisci breve descrizione",
  EMPTY_PHONE:"Inserisci telefono",
  EMPTY_EMAIL:"Inserisci email",
  EMPTY_POSITION:"Inserisci indirizzo",
  EMPTY_SKILLS:"Nessuna mansione inserita",
  EMPTY_NAME_ONLYVIEW:"Nome non disponibile",
  EMPTY_DESCRIPTION_ONLYVIEW:"Descrizone non disponibile",
  EMPTY_BRIEF_ONLYVIEW:"Breve descrizone non disponibile",
  EMPTY_PHONE_ONLYVIEW:"Telefono non disponibile",
  EMPTY_EMAIL_ONLYVIEW:"Email non disponibile",
  EMPTY_POSITION_ONLYVIEW:"Indirizzo non disponibile",


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
const String LOGO_GIF_PATH = "assets/images/animated_logo_white.gif";
const String LOGO_BLUE_GIF_PATH = "assets/images/animated_logo_blue.gif";

const String IMAGE_DEFAULT_NAME = "profileImage";