enum KAssetName {
  passwordEyeSvg,
  eyeOpenSvg,
  travelAiWhitePng,
  threeStarPng,
  icYoutubePng,
  icTaskPng,
  icDollerPng,
  icBulbPng,
  instagramWhitePng,
  icMic1Png,
  textLogoPng,
  linkedinWhitePng,
  icCrownPng,
  icMessagePng,
  thunderPng,
  sciFiLadyWebp,
  icMic2Png,
  icCameraPng,
  icHistoryPng,
  icJokePng,
  icGearPng,
  icPhilosophyPng,
  toolsWhitePng,
  wandToolPng,
  icRobotPng,
  icMailPng,
  icNotePng,
  abcPng,
  icStudyPng,
  creativeAiWhitePng,
  icPdfPng,
  icArtPng,
  rocketPng,
  smilyDollerPng,
  icSearchPng,
  icNotFaveouritePng,
  filterPng,
  robotPng,
  icLauncherPng,
  twitterWhitePng,
  icBoyPng,
  icScanPng,
  icDartPng,
  icChatPng,
  icAthletePng,
  appLogoPng,
  youtubeWhitePng,
  editPng,
  tiktokWhitePng,
  icFilmPng,
  sendPng,
  icFavouritePng,
  aiTaskWhitePng,
  getPremiumImagePng,
  weightliftingPng,
  emailPng,
  documentPng,
  thoughtBubblePng,
  december2Png,
  paperPng,
  newspaperPng,
  rulerPng,
  pianoPng,
  notepadPng,
  lunchBoxPng,
  barChartPng,
  notePng,
  paperPinPng,
  DsStore,
  brokenHeartPng,
  gamePng,
  envelopePng,
  heart2Png,
  mailPng,
  spiderWebPng,
  sadPng,
  penPng,
  instagramPng,
  shoppingBagPng,
  brifcasePng,
  heart1Png,
  typographyPng,
  bibimbapPng,
  innerBeautyPng,
  lightbulbOnPng,
  terminalPng,
  childCarePng,
  paintBrushPng,
  multimediaPng,
  commentsPng,
  briefcasePng,
  tagPng,
  takeOffPng,
  mailboxPng,
  musicPng,
  doctorPng,
  faxMachinePng,
  smilingPng,
  translatePng,
  tomatoPng,
  targetPng,
  crescentMoonPng,
  megaphonePng,
  ghostPng,
  notebook2Png,
  searchPng,
  notebookPng,
  heartPng,
  faceSmileUpsideDownPng,
  tikTokPng,
  folderPng,
  hotPotPng,
  folder2Png,
  gamepadPng,
  moneyBagPng,
  lookingUpPng,
  yogaPosePng,
  iphonePng,
  haveFunPng,
  bookmarkPng,
  heartAttackPng,
  bubbleTeaPng,
  twitterPng,
  linkedinPng,
  moneyPng,
  growthPng,
  giftPng,
  statueOfLibertyPng,
  omelettePng,
  clockPng,
  flyingMoneyPng,
  pencilPng,
  computerPng,
  agreementPng,
  mlEngineerPng,
  contactlessPng,
  lookingPng,
  graduationCapPng,
  poleVaultingPng,
  socialMediaPng,
  lovePng,
  facebookPng,
  printerPng,
  phoneWithLeftArrowPng,
  couponPng,
  boyPng,
  tempuraPng,
  headachePng,
  peacePng,
  theaterPng,
  shootingStarPng,
  popularPng,
  dancerPng,
  padlockPng,
}

extension AssetsExtension on KAssetName {
  String get imagePath {
    const String _rootPath = 'assets';
  const String _svgDir = '$_rootPath/svg';
  const String _imagesDir = '$_rootPath/images';
  const String _tasks_for_aiDir = '$_rootPath/tasks_for_ai';
    switch (this) {
      case KAssetName.passwordEyeSvg:
        return '$_svgDir/password_eye.svg';
      case KAssetName.eyeOpenSvg:
        return '$_svgDir/eye_open.svg';
      case KAssetName.travelAiWhitePng:
        return '$_imagesDir/travel_ai_white.png';
      case KAssetName.threeStarPng:
        return '$_imagesDir/three_star.png';
      case KAssetName.icYoutubePng:
        return '$_imagesDir/ic_youtube.png';
      case KAssetName.icTaskPng:
        return '$_imagesDir/ic_task.png';
      case KAssetName.icDollerPng:
        return '$_imagesDir/ic_doller.png';
      case KAssetName.icBulbPng:
        return '$_imagesDir/ic_bulb.png';
      case KAssetName.instagramWhitePng:
        return '$_imagesDir/instagram_white.png';
      case KAssetName.icMic1Png:
        return '$_imagesDir/ic_mic1.png';
      case KAssetName.textLogoPng:
        return '$_imagesDir/text_logo.png';
      case KAssetName.linkedinWhitePng:
        return '$_imagesDir/linkedin_white.png';
      case KAssetName.icCrownPng:
        return '$_imagesDir/ic_crown.png';
      case KAssetName.icMessagePng:
        return '$_imagesDir/ic_message.png';
      case KAssetName.thunderPng:
        return '$_imagesDir/thunder.png';
      case KAssetName.sciFiLadyWebp:
        return '$_imagesDir/sci_fi_lady.webp';
      case KAssetName.icMic2Png:
        return '$_imagesDir/ic_mic2.png';
      case KAssetName.icCameraPng:
        return '$_imagesDir/ic_camera.png';
      case KAssetName.icHistoryPng:
        return '$_imagesDir/ic_history.png';
      case KAssetName.icJokePng:
        return '$_imagesDir/ic_joke.png';
      case KAssetName.icGearPng:
        return '$_imagesDir/ic_gear.png';
      case KAssetName.icPhilosophyPng:
        return '$_imagesDir/ic_philosophy.png';
      case KAssetName.toolsWhitePng:
        return '$_imagesDir/tools_white.png';
      case KAssetName.wandToolPng:
        return '$_imagesDir/wand_tool.png';
      case KAssetName.icRobotPng:
        return '$_imagesDir/ic_robot.png';
      case KAssetName.icMailPng:
        return '$_imagesDir/ic_mail.png';
      case KAssetName.icNotePng:
        return '$_imagesDir/ic_note.png';
      case KAssetName.abcPng:
        return '$_imagesDir/abc.png';
      case KAssetName.icStudyPng:
        return '$_imagesDir/ic_study.png';
      case KAssetName.creativeAiWhitePng:
        return '$_imagesDir/creative_ai_white.png';
      case KAssetName.icPdfPng:
        return '$_imagesDir/ic_pdf.png';
      case KAssetName.icArtPng:
        return '$_imagesDir/ic_art.png';
      case KAssetName.rocketPng:
        return '$_imagesDir/rocket.png';
      case KAssetName.smilyDollerPng:
        return '$_imagesDir/smily_doller.png';
      case KAssetName.icSearchPng:
        return '$_imagesDir/ic_search.png';
      case KAssetName.icNotFaveouritePng:
        return '$_imagesDir/ic_not_faveourite.png';
      case KAssetName.filterPng:
        return '$_imagesDir/filter.png';
      case KAssetName.robotPng:
        return '$_imagesDir/robot.png';
      case KAssetName.icLauncherPng:
        return '$_imagesDir/ic_launcher.png';
      case KAssetName.twitterWhitePng:
        return '$_imagesDir/twitter_white.png';
      case KAssetName.icBoyPng:
        return '$_imagesDir/ic_boy.png';
      case KAssetName.icScanPng:
        return '$_imagesDir/ic_scan.png';
      case KAssetName.icDartPng:
        return '$_imagesDir/ic_dart.png';
      case KAssetName.icChatPng:
        return '$_imagesDir/ic_chat.png';
      case KAssetName.icAthletePng:
        return '$_imagesDir/ic_athlete.png';
      case KAssetName.appLogoPng:
        return '$_imagesDir/app_logo_v2.png';
      case KAssetName.youtubeWhitePng:
        return '$_imagesDir/youtube_white.png';
      case KAssetName.editPng:
        return '$_imagesDir/edit.png';
      case KAssetName.tiktokWhitePng:
        return '$_imagesDir/tiktok_white.png';
      case KAssetName.icFilmPng:
        return '$_imagesDir/ic_film.png';
      case KAssetName.sendPng:
        return '$_imagesDir/send.png';
      case KAssetName.icFavouritePng:
        return '$_imagesDir/ic_favourite.png';
      case KAssetName.aiTaskWhitePng:
        return '$_imagesDir/ai_task_white.png';
      case KAssetName.getPremiumImagePng:
        return '$_imagesDir/get_premium_image.png';
      case KAssetName.weightliftingPng:
        return '$_tasks_for_aiDir/weightlifting.png';
      case KAssetName.emailPng:
        return '$_tasks_for_aiDir/email.png';
      case KAssetName.documentPng:
        return '$_tasks_for_aiDir/document.png';
      case KAssetName.thoughtBubblePng:
        return '$_tasks_for_aiDir/thought-bubble.png';
      case KAssetName.december2Png:
        return '$_tasks_for_aiDir/december2.png';
      case KAssetName.paperPng:
        return '$_tasks_for_aiDir/paper.png';
      case KAssetName.newspaperPng:
        return '$_tasks_for_aiDir/newspaper.png';
      case KAssetName.rulerPng:
        return '$_tasks_for_aiDir/ruler.png';
      case KAssetName.pianoPng:
        return '$_tasks_for_aiDir/piano.png';
      case KAssetName.notepadPng:
        return '$_tasks_for_aiDir/notepad.png';
      case KAssetName.lunchBoxPng:
        return '$_tasks_for_aiDir/lunch-box.png';
      case KAssetName.barChartPng:
        return '$_tasks_for_aiDir/bar_chart.png';
      case KAssetName.notePng:
        return '$_tasks_for_aiDir/note.png';
      case KAssetName.paperPinPng:
        return '$_tasks_for_aiDir/paper-pin.png';
      case KAssetName.DsStore:
        return '$_tasks_for_aiDir/.DS_Store';
      case KAssetName.brokenHeartPng:
        return '$_tasks_for_aiDir/broken-heart.png';
      case KAssetName.gamePng:
        return '$_tasks_for_aiDir/game.png';
      case KAssetName.envelopePng:
        return '$_tasks_for_aiDir/envelope.png';
      case KAssetName.heart2Png:
        return '$_tasks_for_aiDir/heart_2.png';
      case KAssetName.mailPng:
        return '$_tasks_for_aiDir/mail.png';
      case KAssetName.spiderWebPng:
        return '$_tasks_for_aiDir/spider_web.png';
      case KAssetName.sadPng:
        return '$_tasks_for_aiDir/sad.png';
      case KAssetName.penPng:
        return '$_tasks_for_aiDir/pen.png';
      case KAssetName.instagramPng:
        return '$_tasks_for_aiDir/instagram.png';
      case KAssetName.shoppingBagPng:
        return '$_tasks_for_aiDir/shopping-bag.png';
      case KAssetName.brifcasePng:
        return '$_tasks_for_aiDir/brifcase.png';
      case KAssetName.heart1Png:
        return '$_tasks_for_aiDir/heart_1.png';
      case KAssetName.typographyPng:
        return '$_tasks_for_aiDir/typography.png';
      case KAssetName.bibimbapPng:
        return '$_tasks_for_aiDir/bibimbap.png';
      case KAssetName.innerBeautyPng:
        return '$_tasks_for_aiDir/inner-beauty.png';
      case KAssetName.lightbulbOnPng:
        return '$_tasks_for_aiDir/lightbulb-on.png';
      case KAssetName.terminalPng:
        return '$_tasks_for_aiDir/terminal.png';
      case KAssetName.childCarePng:
        return '$_tasks_for_aiDir/child-care.png';
      case KAssetName.paintBrushPng:
        return '$_tasks_for_aiDir/paint-brush.png';
      case KAssetName.multimediaPng:
        return '$_tasks_for_aiDir/multimedia.png';
      case KAssetName.commentsPng:
        return '$_tasks_for_aiDir/comments.png';
      case KAssetName.briefcasePng:
        return '$_tasks_for_aiDir/briefcase.png';
      case KAssetName.tagPng:
        return '$_tasks_for_aiDir/tag.png';
      case KAssetName.takeOffPng:
        return '$_tasks_for_aiDir/take-off.png';
      case KAssetName.mailboxPng:
        return '$_tasks_for_aiDir/mailbox.png';
      case KAssetName.musicPng:
        return '$_tasks_for_aiDir/music.png';
      case KAssetName.doctorPng:
        return '$_tasks_for_aiDir/doctor.png';
      case KAssetName.faxMachinePng:
        return '$_tasks_for_aiDir/fax-machine.png';
      case KAssetName.smilingPng:
        return '$_tasks_for_aiDir/smiling.png';
      case KAssetName.translatePng:
        return '$_tasks_for_aiDir/translate.png';
      case KAssetName.tomatoPng:
        return '$_tasks_for_aiDir/tomato.png';
      case KAssetName.targetPng:
        return '$_tasks_for_aiDir/target.png';
      case KAssetName.crescentMoonPng:
        return '$_tasks_for_aiDir/crescent-moon.png';
      case KAssetName.megaphonePng:
        return '$_tasks_for_aiDir/megaphone.png';
      case KAssetName.ghostPng:
        return '$_tasks_for_aiDir/ghost.png';
      case KAssetName.notebook2Png:
        return '$_tasks_for_aiDir/notebook_2.png';
      case KAssetName.searchPng:
        return '$_tasks_for_aiDir/search.png';
      case KAssetName.notebookPng:
        return '$_tasks_for_aiDir/notebook.png';
      case KAssetName.heartPng:
        return '$_tasks_for_aiDir/heart.png';
      case KAssetName.faceSmileUpsideDownPng:
        return '$_tasks_for_aiDir/face-smile-upside-down.png';
      case KAssetName.tikTokPng:
        return '$_tasks_for_aiDir/tik-tok.png';
      case KAssetName.folderPng:
        return '$_tasks_for_aiDir/folder.png';
      case KAssetName.hotPotPng:
        return '$_tasks_for_aiDir/hot_pot.png';
      case KAssetName.folder2Png:
        return '$_tasks_for_aiDir/folder_2.png';
      case KAssetName.gamepadPng:
        return '$_tasks_for_aiDir/gamepad.png';
      case KAssetName.moneyBagPng:
        return '$_tasks_for_aiDir/money-bag.png';
      case KAssetName.lookingUpPng:
        return '$_tasks_for_aiDir/looking-up.png';
      case KAssetName.yogaPosePng:
        return '$_tasks_for_aiDir/yoga-pose.png';
      case KAssetName.iphonePng:
        return '$_tasks_for_aiDir/iphone.png';
      case KAssetName.haveFunPng:
        return '$_tasks_for_aiDir/have-fun.png';
      case KAssetName.bookmarkPng:
        return '$_tasks_for_aiDir/bookmark.png';
      case KAssetName.heartAttackPng:
        return '$_tasks_for_aiDir/heart-attack.png';
      case KAssetName.bubbleTeaPng:
        return '$_tasks_for_aiDir/bubble-tea.png';
      case KAssetName.twitterPng:
        return '$_tasks_for_aiDir/twitter.png';
      case KAssetName.linkedinPng:
        return '$_tasks_for_aiDir/linkedin.png';
      case KAssetName.moneyPng:
        return '$_tasks_for_aiDir/money.png';
      case KAssetName.growthPng:
        return '$_tasks_for_aiDir/growth.png';
      case KAssetName.giftPng:
        return '$_tasks_for_aiDir/gift.png';
      case KAssetName.statueOfLibertyPng:
        return '$_tasks_for_aiDir/statue_of_liberty.png';
      case KAssetName.omelettePng:
        return '$_tasks_for_aiDir/omelette.png';
      case KAssetName.clockPng:
        return '$_tasks_for_aiDir/clock.png';
      case KAssetName.flyingMoneyPng:
        return '$_tasks_for_aiDir/flying-money.png';
      case KAssetName.pencilPng:
        return '$_tasks_for_aiDir/pencil.png';
      case KAssetName.computerPng:
        return '$_tasks_for_aiDir/computer.png';
      case KAssetName.agreementPng:
        return '$_tasks_for_aiDir/agreement.png';
      case KAssetName.mlEngineerPng:
        return '$_tasks_for_aiDir/ml_engineer.png';
      case KAssetName.contactlessPng:
        return '$_tasks_for_aiDir/contactless.png';
      case KAssetName.lookingPng:
        return '$_tasks_for_aiDir/looking.png';
      case KAssetName.graduationCapPng:
        return '$_tasks_for_aiDir/graduation-cap.png';
      case KAssetName.poleVaultingPng:
        return '$_tasks_for_aiDir/pole_vaulting.png';
      case KAssetName.socialMediaPng:
        return '$_tasks_for_aiDir/social-media.png';
      case KAssetName.lovePng:
        return '$_tasks_for_aiDir/love.png';
      case KAssetName.facebookPng:
        return '$_tasks_for_aiDir/facebook.png';
      case KAssetName.printerPng:
        return '$_tasks_for_aiDir/printer.png';
      case KAssetName.phoneWithLeftArrowPng:
        return '$_tasks_for_aiDir/phone-with-left-arrow.png';
      case KAssetName.couponPng:
        return '$_tasks_for_aiDir/coupon.png';
      case KAssetName.boyPng:
        return '$_tasks_for_aiDir/boy.png';
      case KAssetName.tempuraPng:
        return '$_tasks_for_aiDir/tempura.png';
      case KAssetName.headachePng:
        return '$_tasks_for_aiDir/headache.png';
      case KAssetName.peacePng:
        return '$_tasks_for_aiDir/peace.png';
      case KAssetName.theaterPng:
        return '$_tasks_for_aiDir/theater.png';
      case KAssetName.shootingStarPng:
        return '$_tasks_for_aiDir/shooting-star.png';
      case KAssetName.popularPng:
        return '$_tasks_for_aiDir/popular.png';
      case KAssetName.dancerPng:
        return '$_tasks_for_aiDir/dancer.png';
      case KAssetName.padlockPng:
        return '$_tasks_for_aiDir/padlock.png';
    }
  }
}
