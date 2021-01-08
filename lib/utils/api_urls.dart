class ApiUrls {
  static const String USER = "user";
  static const String USER_ID = "user_id";
  static const String USER_TYPE = "usertype";
  static const String USER_SIGN_UP = "signup";
  static const String SIGN_UP_VERIFICATION_MAIL = "verificationmail";
  static const String USER_LOGIN = "login";
  static const String CHANGE_PASSWORD = "changepassword";
  static const String VERIFY_OTP = "verifyotp";
  static const String FORGOT_PASSWORD = "forgotpassword";
  static const String VERIFY_MOBILE = "verifymobile";
  static const String VERIFY_EMAIL = "verifyemail";
  static const String SEND_VERIFICATION_OTP = "otp";
  static const String QUERY = "query";
  static const String TERMS_OF_SERVICE = "termsservices";
  static const String PRIVACY_POLICY = "privacypolicy";
  static const String DISCLAIMER = "disclaimer";
  static const String FEED = "feed";
  static const String FEED_ID = "feed_id";
  static const String FEED_TYPE = "feed_type";
  static const String DETAIL = "detail";
  static const String TIMELINE = "timeline";
  static const String ADD = "add";
  static const String UPDATE = "update";
  static const String DELETE = "delete";
  static const String TOKEN = "token";
  static const String PAGE = "page";
  static const String BOOKMARK = "bookmark";
  static const String BOOKMARKS = "bookmarks";
  static const String ENGAGEMENT = "engagement";
  static const String ENGAGEMENT_COMMENT = "engagementcomment";
  static const String SHARE_VOICE = "sharevoice";
  static const String COMMENT = "comment";
  static const String ALL = "all";
  static const String SEARCH = "search";
  static const String SEARCH_HEALTH_QUERY = "searchhealthquery";
  static const String ADD_ANSWER = "addanswer";
  static const String USER_CONSULTATION = "userconsultation";
  static const String FOLLOWUP = "followup";
  static const String SEARCH_ISSUES = "searchissues";
  static const String CATEGORY_ID = "category_id";
  static const String SPECIALITY = "speciality";
  static const String PROFILE = "profile";
  static const String FAVOURITE_EXPERT = "favouriteexpert";
  static const String DOCTOR_PROFILE = "doctorprofile";
  static const String EXPERTS_ID = "experts_id";
  static const String EXPERTS = "experts";
  static const String GENDER = "gender";
  static const String NOTIFICATION = "notification";
  static const String SPECIALIZED_EXPERTS = "specializedexperts";
  static const String EXPERTISE_ID = "expertise_id";
  static const String THANKS = "thanks";
  static const String POLL = "poll";
  static const String PROFILE_PICTURE = "profilepic";
  static const String JOIN_EXPERT = "joinexpert";
  static const String CONSULTATION = "consultation";
  static const String PAYMENT = "payment";
  static const String MEDICAL_PACKAGE = "medicalpackage";
  static const String MEDICAL_TEST = "medicaltest";
  static const String BOOKING = "booking";
  static const String CONTACT = "contact";
  static const String PRICE = "price";
  static const String CATEGORY = "category";
  static const String TERM = "term";
  static const String IRREGULAR = "Irregular";
  static const String ONE = "1";
  static const String QUESTION_MARK = "?";
  static const String EQUALS = "=";
  static const String AND = "&";
  static const String SLASH = "/";
  static const String razorKey = "rzp_test_7C6vWyX6b57U9i";
  static const String DEVICE_TOKEN =
      "eeHQ5ZJQXL4:APA91bE73aEs1_wz9wkyVrJf64K5mcHMZ6NGpvtFvM61pU_oGLk6XVzTfvwm0YDf4ZuVx08t5DdNc9f34blbtB8CCCgX0JVXrIVmXLS0t3k5ai8MHKyj7jqMoeADdHl7w0-R-HDLaUey";

  static const String NEW_TOKEN =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjc1MjIsImlzcyI6Imh0dHA6Ly9kZXYtYXBpLm9vd29tYW5peWEuY29tL2FwaS9hZG1pbi9sb2dpbiIsImlhdCI6MTU4OTU1MjQ2NiwiZXhwIjoxNjIxMDg4NDY2LCJuYmYiOjE1ODk1NTI0NjYsImp0aSI6ImxDVEdDVjFuaWNYYVNtNUIifQ.uVw6uOkch4TcrLTu4mkdAJCEpUTiwZg3O4tXIigtXMM";

  static const String localURL = "https://dev-api.oowomaniya.com/api/";

  // static const String localURL = "https://ow.stimulusco.com/api/";

  //Query urls
  static const String GET_SEARCH_QUERY_URL = localURL +
      QUERY +
      SLASH +
      SEARCH +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "token" +
      AND +
      SEARCH +
      EQUALS +
      "Nita"; //change value
  static const String GET_HEALTH_QUERY_URL = localURL +
      QUERY +
      SLASH +
      SEARCH_HEALTH_QUERY +
      QUESTION_MARK +
      PAGE +
      EQUALS +
      "2" +
      AND +
      FEED_TYPE +
      EQUALS +
      QUERY;
  static const String POST_QUERY_COMMENT =
      localURL + QUERY + SLASH + ADD_ANSWER + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String GET_QUERY_CONSULTATION_OF_USER_URL =
      localURL + QUERY + SLASH + USER_CONSULTATION + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String ASK_QUERY_TO_DOCTOR_URL =
      localURL + QUERY + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String RELATE_QUERY_URL =
      localURL + FEED + SLASH + ENGAGEMENT + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add  steffina token
  static const String ASK_FOLLOWUP_URL =
      localURL + QUERY + SLASH + FOLLOWUP + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add local token

  static const String GET_QUERY_BY_ISSUES_URL = localURL +
      QUERY +
      SLASH +
      SEARCH_ISSUES +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "token" +
      AND +
      CATEGORY_ID +
      EQUALS +
      ONE; // change value

  static const String ASK_QUERY_URL =
      localURL + QUERY + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add steffina token

  //  feed urls
  static const String GET_FEEDS_WITHOUT_TOKEN_URL =
      localURL + FEED + SLASH + TIMELINE + QUESTION_MARK + PAGE + EQUALS; //Add page number
  static const String GET_FEED_DETAILS_URL = localURL +
      FEED +
      SLASH +
      DETAIL +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "token" +
      AND +
      FEED_ID +
      EQUALS +
      "8090"; //change value
  static const String GET_FEEDS_WITH_TOKEN_URL = localURL + FEED + QUESTION_MARK + TOKEN + EQUALS + "token";

  static const String PAGE_NO = AND + PAGE + EQUALS; //Add page number

  static const String ADD_BOOKMARK_URL =
      localURL + FEED + SLASH + BOOKMARK + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add steffina token

  static const String GET_FEED_COMMENT_URL = localURL + FEED + SLASH + COMMENT + QUESTION_MARK + TOKEN + EQUALS;

  static const String FEED_NO = AND + FEED_ID + EQUALS;

  static const String GET_BOOKMARK_URL = localURL + FEED + SLASH + BOOKMARKS + QUESTION_MARK + TOKEN + EQUALS;

  static const String TYPE = AND + FEED_TYPE + EQUALS + ALL;

  static const String LIKE_ARTICLE_URL =
      localURL + FEED + SLASH + ENGAGEMENT + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String REMOVE_BOOKMARK_URL =
      localURL + FEED + SLASH + BOOKMARK + SLASH + DELETE + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String ATTEND_EVENT_URL =
      localURL + FEED + SLASH + ENGAGEMENT + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String POST_FEED_COMMENT_URL =
      localURL + FEED + SLASH + COMMENT + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String POST_ENGAGEMENT_COMMENT_URL =
      localURL + FEED + SLASH + ENGAGEMENT_COMMENT + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token

  //Users Urls
  static const String GET_SPECIALITIES_URL =
      localURL + USER + SLASH + SPECIALITY + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String GET_USER_PROFILE_URL =
      localURL + USER + SLASH + PROFILE + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String GET_FAVOURITE_EXPERTS_URL =
      localURL + USER + SLASH + FAVOURITE_EXPERT + QUESTION_MARK + TOKEN + EQUALS; //Add token

  static const String GET_DOCTOR_PROFILE_URL = localURL +
      USER +
      SLASH +
      DOCTOR_PROFILE +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "token" + //Add token
      AND +
      EXPERTS_ID +
      EQUALS +
      "9"; //change value

  static const String GET_DOCTORS_URL = localURL +
      USER +
      SLASH +
      EXPERTS +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "token" + //Add token
      AND +
      GENDER +
      EQUALS +
      "male"; //change value

  static const String GET_USER_NOTIFICATION_URL = localURL +
      NOTIFICATION +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "token" + //Add token
      AND +
      USER_ID +
      EQUALS +
      "10" +
      AND +
      USER_TYPE +
      EQUALS +
      "customer"; //change value
  static const String GET_EXPERTS_SPECIALITY = localURL +
      USER +
      SLASH +
      SPECIALIZED_EXPERTS +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "token" + //Add token
      AND +
      EXPERTISE_ID +
      EQUALS +
      "9"; //change value
  static const String ADD_THANKS_URL =
      localURL + USER + SLASH + THANKS + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String ADD_USER_POLL_URL =
      localURL + USER + SLASH + POLL + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String GET_EXPERT_HISTORY_NOTIFICATION_URL = localURL +
      NOTIFICATION +
      QUESTION_MARK +
      TOKEN +
      EQUALS +
      "" + //Add token
      AND +
      USER_ID +
      EQUALS +
      "10" +
      AND +
      USER_TYPE +
      EQUALS +
      "expert"; //change value
  static const String UPDATE_LAST_SEEN_URL =
      localURL + NOTIFICATION + SLASH + UPDATE + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String REMOVE_FAVOURITE_EXPERTS_URL =
      localURL + USER + SLASH + FAVOURITE_EXPERT + SLASH + DELETE + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String ADD_FAVOURITE_EXPERTS_URL =
      localURL + USER + SLASH + FAVOURITE_EXPERT + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String UPDATE_PROFILE_PICTURE_URL =
      localURL + USER + SLASH + PROFILE_PICTURE + SLASH + UPDATE + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String GET_USER_FAVOURITE_DOCTORS_URL =
      localURL + USER + SLASH + FAVOURITE_EXPERT + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String JOIN_EXPERT_URL =
      localURL + USER + SLASH + JOIN_EXPERT + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String UPDATE_USER_PROFILE_URL =
      localURL + USER + SLASH + UPDATE + QUESTION_MARK + TOKEN + EQUALS; //Add token

  //Book consultation url
  static const String BOOKING_CONSULTATION_URL =
      localURL + CONSULTATION + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token

  //Medical url
  static const String GET_MEDICAL_PACKAGE_URL = localURL + MEDICAL_PACKAGE + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String MEDICAL_TEST_BOOKING_URL =
      localURL + MEDICAL_TEST + SLASH + BOOKING + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token

  // Payment urls
  static const String CONSULTATION_PAYMENT_URL =
      localURL + PAYMENT + SLASH + CONSULTATION + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token

  static const String QUERY_PAYMENT_URL = localURL + PAYMENT + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token

  //User login and sign up urls
  static const String VERIFY_EMAIL_URL = localURL + VERIFY_EMAIL;
  static const String VERIFY_OTP_URL = localURL + VERIFY_OTP;
  static const String SEND_VERIFICATION_OTP_URL = localURL + SEND_VERIFICATION_OTP;
  static const String CHANGE_PASSWORD_URL = localURL + CHANGE_PASSWORD;
  static const String VERIFY_SIGN_UP_MOBILE_OTP_URL = localURL + VERIFY_MOBILE;
  static const String GET_MAIL_VERIFICATION_LINK_URL = localURL + SIGN_UP_VERIFICATION_MAIL;
  static const String USER_LOGIN_URL = localURL + USER_LOGIN;
  static const String FORGOT_PASSWORD_URL = localURL + FORGOT_PASSWORD;
  static const String USER_SIGN_UP_URL = localURL + USER_SIGN_UP;

  //Share voice url
  static const String SHARE_VOICE_URL =
      localURL + SHARE_VOICE + SLASH + ADD + QUESTION_MARK + TOKEN + EQUALS; //Add token

  //Master urls
  static const String SAVE_CONTACT_URL = localURL + CONTACT + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String GET_PRICE_LISTING_URL = localURL + PRICE + QUESTION_MARK + TOKEN + EQUALS; //Add token
  static const String GET_CATEGORY =
      localURL + CATEGORY + QUESTION_MARK + TOKEN + EQUALS + "token" + AND + TERM + EQUALS + IRREGULAR;

  static const String GET_DISCLAIMER = localURL + DISCLAIMER + QUESTION_MARK + TOKEN + EQUALS; //Add token

  static const String GET_PRIVACY_POLICY_URL =
      localURL + PRIVACY_POLICY + QUESTION_MARK + TOKEN + EQUALS + NEW_TOKEN; //Add token

  static const String GET_TERMS_OF_SERVICE_URL =
      localURL + TERMS_OF_SERVICE + QUESTION_MARK + TOKEN + EQUALS + NEW_TOKEN; //Add token
}
