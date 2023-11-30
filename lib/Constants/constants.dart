import 'dart:ui';

class AppColors {
  static const Color scaffoldcolor = Color(0xFF3E3535);
  static const Color primarycolor = Color(0xFFF26D15);
  static const Color whitecolor = Color(0xFFFFFFFF);
  static const Color greycolor = Color(0xFFB1A7A7);
  static const Color blackcolor = Color(0xFF000000);
}

// *******************************************************************//

class FontRes {
  static const String poppins = 'Poppins';
  static const String poppinsmedium = 'PoppinsMedium';
  static const String poppinssemibold = 'PoppinsSemiBold';
  static const String poppinsextrabold = 'PoppinsExtraBold';
  static const String poppinsbold = 'PoppinsBold';
  static const String gilroyBold = 'GilroyBold';
  static const String poppinslight = 'PoppinsLight';
  static const String poppinsextralight = 'PoppinsExtraLight';
  static const String poppinsthin = 'PoppinsThin';
}

//*******************************************************************//
class AppResources {
//===========splash screen/Logo============
  static const String appLogo = 'assets/png/foodlogo.png';
  static const String appLogopng = 'assets/png/foodlogowhite.png';

//===========Home Screen============
  static const String burger = 'assets/png/burger.png';
  static const String pizza = 'assets/png/pizza.png';
  static const String pasta = 'assets/png/salad.png';
  static const String roast = 'assets/png/broast.png';
  static const String rice = 'assets/png/rice.png';
  static const String wrap = 'assets/png/wrap.png';
  static const String donut = 'assets/png/donut.png';
  static const String salad = 'assets/png/fruit.png';
  static const String filter = 'assets/icon/filter.png';

//===========Items Screen============
  static const String beefburger = 'assets/png/beefburger.jpg';
  static const String grillburger = 'assets/png/grillburger.jpg';
  static const String zingerburger = 'assets/png/zingerburger.jpg';
  static const String pattyburger = 'assets/png/pattyburger.png';
  static const String cheeseburger = 'assets/png/cheeseburger.jpg';
}

//*******************************************************************//
class AppStrings {
//===========Welcome Screen===========
  static const String welcome = "WELCOME";
  static const String food = "FOOD RECIPIES";
  static const String descrip =
      "Whether you're a seasoned chef or a beginner in the kitchen, This food recipe app is designed to elevate your cooking experience and satisfy your taste buds.";
  static const String getstart = "Get Started For Free";
  static const String edit = "Edit Profile";
  static const String profilescreen = "Profile";
  static const String continuebutton = "Continue";
  static const String updatebutton = "Update";
  static const String itemdetails = "item details";

//===========Login Screen===========
  static const String forget = "Forget Password?";
  static const String login = "LOGIN";
  static const String dont = "Don't have an account?";
  static const String signup = "SIGNUP";
  static const String email = "Email";
  static const String password = "Password";

//===========Sign up Screen===========
  static const String signupsignup = "SIGN UP";
  static const String name = "Name";
  static const String create = "CREATE ACCOUNT";
  static const String already = "Already have an account?";

//===========Home Screen===========
  static const String categories = "CATEGORIES";
  static const String burgername = "Burger";
  static const String pizzaname = "Pizza";
  static const String pastaname = "Pasta";
  static const String roastname = "Roast";
  static const String ricename = "Rice";
  static const String wrapname = "Wrap";
  static const String sandwichname = "Sandwich";
  static const String saladname = "Salad";

//===========Choose item Screen===========
  static const String choose = "CHOOSE ITEM";
  static const String beefburgertext = 'Beef Burger';
  static const String grillburgertext = 'Grill Burger';
  static const String zingerburgertext = 'Zinger Burger';
  static const String pattyburgertext = 'Patty Burger';
  static const String cheeseburgertext = 'Cheese Burger';
  static const String fav = 'Favourite';

//===========Common Dialogue widget============

  static const String loading = 'Loading...';
  static const String nouser = 'No user found for that email.';
  static const String wrongpass = 'Wrong password provided for that user.';
  static const String somewent = 'Something went wrong.';
  static const String oops = 'Oops Error';
  static const String wentwrong = 'Something went wrong';
  static const String ok = 'Ok';

  //===========Error Text============

  static const String answerrequired = 'Answer Required';
  static const String emailerror1 = 'Email is required';
  static const String emailerror2 = 'Email is invalid';
  static const String passworderror1 = 'Password is required';
  static const String passworderror2 =
      'Password must be at least 6 characters long';
  static const String passworderror3 = 'Password is wrong';
  static const String passworderror4 =
      'Must contain at least one special character.';
  static const String passworderror5 =
      'Must contain at least one uppercase letter.';
  static const String namereq = 'Name is required';
  static const String lastnamereq = 'Last name is required';
  static const String methodreq = 'Method is required(Text,Call,Email)';
  static const String phonereq = 'Number is required';
  static const String mobilereq = 'Number is required';
  static const String emailreq = 'Email required';
  static const String chooseopt = 'Choose one option';
  static const String memberreq = 'Name required';
  static const String relationreq = 'Relation required';
  static const String sampleeroor = 'Fields cannot be empty';
  static const String passmatch = 'Password Does not match';
  static const String emailalready = 'email-already-in-use';
  static const String usernotfound = 'user-not-found';
  static const String passnot = 'wrong-password';
  static const String error = 'Error: ';
  static const String invalid = 'INVALID_LOGIN_CREDENTIALS';

  //===========FireStore texts==========

  static const String usernamefirebase = 'user_name';
  static const String firebaseusername = 'user_name';
  static const String userslist = 'userslist';
  static const String userid = 'user_Id';
  static const String userpass = 'password';
  static const String useremail = 'email';
  static const String userphone = 'user_contact';
  static const String useraddress = 'user_address';
  static const String profilepic = 'user_pic';
}
