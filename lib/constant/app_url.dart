import 'package:chat_on/utils/enum.dart';

enum AppUrl {
  base,
  baseImage,
  signUp,
  signIn,
  allAiPrompts,
  freeAiPrompts,
  paidAiPrompts,
  chatWithAi,
  categoryWiseAiPrompts,
  getFavouritePrompt,
  favouritePromptAddDelete,
  promptTags,
  tagWisePrompts,
  fileUpload,
  allHistory,
}

extension AppUrlExtention on AppUrl {
  static String _baseUrl = "";
  static String _baseImageUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        _baseUrl = "";
        _baseImageUrl = "";

        break;

      case UrlLink.isDev:
        _baseUrl = "http://185.164.111.200:3001/api/";
        _baseImageUrl = "";

        break;
      case UrlLink.isLocalServer:
        // set up your local server ip address.
        _baseUrl = "";
        break;
    }
  }

  String get url {
    switch (this) {
      case AppUrl.base:
        return "$_baseUrl";
      case AppUrl.baseImage:
        return "$_baseImageUrl";
      case AppUrl.signUp:
        return "auth/signup";
      case AppUrl.signIn:
        return "auth/signin";
      case AppUrl.freeAiPrompts:
        return "prompt?packageType=FREE&pageSize=0";
      case AppUrl.allAiPrompts:
        return "prompt?pageSize=0";
      case AppUrl.paidAiPrompts:
        return "prompt?packageType=PAID&pageSize=0";
      case AppUrl.chatWithAi:
        return "ai";
      case AppUrl.categoryWiseAiPrompts:
        return "prompt/grouped-by-category";
      case AppUrl.getFavouritePrompt:
        return "favorite-prompts&pageSize=0";
      case AppUrl.favouritePromptAddDelete:
        return "favorite-prompts";
      case AppUrl.promptTags:
        return "prompt-tag?pageSize=0";
      case AppUrl.tagWisePrompts:
        return "prompt?packageType=FREE&pageSize=0&tagId={TAG_ID}";
      case AppUrl.fileUpload:
        return "file-upload";
      case AppUrl.allHistory:
        return "history";

      default:
    }
    return "";
  }
}
