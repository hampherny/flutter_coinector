import 'package:Coinector/Merchant.dart';
import 'package:Coinector/translator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'AddPlaceTagSearchDelegate.dart';
import 'Dialogs.dart';
import 'Tag.dart';
import 'Toaster.dart';
import 'UrlLauncher.dart';

const OPACITY_ITEM_VALIDATED = 0.7;
const OPACITY_ITEM_DEACTIVATED = 0.0;
const DEFAULT_DURATION_SCROLL_ANIMATION = Duration(milliseconds: 3000);
const DEFAULT_ANIMATION_CURVE = Curves.decelerate;
const DEFAULT_DURATION_OPACITY_FADE = Duration(milliseconds: 5000);
const DURATION_OPACITY_FADE_SUBMIT_BTN = Duration(milliseconds: 10000);
const INPUT_DASH_POS = 550.0;
const INPUT_BCH_POS = 700.0;
const INPUT_TAGS_POS = 200.0;
const INPUT_ADR_POS = 130.0;
const KEYWORD_CONTROLLER_ACTION = "controller";

const int MIN_INPUT_ADR =
    20; //TODO validate the address it shall contain a zip code and a country or use separate fields
const int MIN_INPUT_NAME = 10;
const int MIN_INPUT_TAGS = 4;
const int MIN_INPUT_BCHyDASH =
    32; //TODO offer an address field for each coin right after checking its box
const int MAX_INPUT_ADR = 250;
const int MAX_INPUT_NAME = 50;
const int MAX_INPUT_DASH = 36; //dash:XintDskT8uV59N9HNvbpJ27nKNtbyHiyUn
const int MAX_INPUT_BCH =
    54; //bitcoincash:qpm2qsznhks23z7629mms6s4cwef74vcwvy22gdx6a
const int MAX_INPUT_TAGS = 4;

class AddNewPlaceWidget extends StatefulWidget {
  final int selectedType;
  final Color accentColor;
  final Color actionBarColor;
  final String typeTitle;

  const AddNewPlaceWidget(
      {Key key,
      this.selectedType,
      this.accentColor,
      this.typeTitle,
      this.actionBarColor})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddNewPlaceWidgetState(
        selectedType, accentColor, typeTitle, actionBarColor);
  }
}

class _AddNewPlaceWidgetState extends State<AddNewPlaceWidget> {
  final int selectedType;
  final Color accentColor;
  final String typeTitle;
  final Color actionBarColor;
  final AddPlaceTagSearchDelegate searchTagsDelegate =
      AddPlaceTagSearchDelegate();
  static const TEXT_COLOR = Colors.white;
  FocusNode focusNodeInputDASH;
  FocusNode focusNodeInputBCH;
  FocusNode focusNodeInputAdr;
  FocusNode focusNodeInputName;
  TextEditingController controllerInputDASH;
  TextEditingController controllerInputBCH;
  TextEditingController controllerInputAdr;
  TextEditingController controllerInputName;

  String inputName = "";
  String lastInputNameWithCommand = "";
  String lastInputName = "";
  String inputAdr = "";
  String lastInputAdrWithCommand = "";
  String lastInputAdr = "";
  String inputBCH = "";
  String lastInputBCH = "";
  String lastInputBCHWithCommand = "";
  String inputDASH = "";
  String lastInputDASH = "";
  String lastInputDASHWithCommand = "";
  bool showSubmitBtn = false;
  bool showInputDASHyBCH = false;
  bool showInputAdr = false;
  bool showInputTags = false;
  bool showSearchButton = false;

  var textStyleButtons = TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);

  Set<String> allSelectedTags = Set.from([]);

  var scrollController = ScrollController();

  Merchant merchant;

  bool hasTriedSearch = false;

  bool showRegisterOnGoogleMapsButton = false;

  _AddNewPlaceWidgetState(
      this.selectedType, this.accentColor, this.typeTitle, this.actionBarColor);

  @override
  void initState() {
    super.initState();
    focusNodeInputDASH = FocusNode();
    focusNodeInputBCH = FocusNode();
    focusNodeInputAdr = FocusNode();
    focusNodeInputName = FocusNode();

    controllerInputDASH = TextEditingController();
    controllerInputDASH.addListener(() {
      updateInputDASH(KEYWORD_CONTROLLER_ACTION);
    });
    controllerInputBCH = TextEditingController();
    controllerInputBCH.addListener(() {
      updateInputBCH(KEYWORD_CONTROLLER_ACTION);
    });
    controllerInputAdr = TextEditingController();
    controllerInputAdr.addListener(() {
      updateInputAdr(KEYWORD_CONTROLLER_ACTION);
    });
    controllerInputName = TextEditingController();
    controllerInputName.addListener(() {
      updateInputName(KEYWORD_CONTROLLER_ACTION);
    });
  }

  //If place is on Gmaps prefill the fields
  // if not found on Google Maps then ask them to register on business.google.com first before being able to appear on our map, offer them a search button
  //Check if there are four tags prefilled, let them remove each tag separately to add a replacement tag, dont let them submit before choosing four tags

  void searchOnGoogleMapsPrefillFields({String debugSearch}) async {
    var search = inputName + " " + inputAdr;
    if (!kReleaseMode) print("inputs: " + search);

    String placeId =
        await findPlaceId(debugSearch != null ? debugSearch : search);

    if (!kReleaseMode) print("placeid: " + placeId.toString());

    if (placeId == null) {
      if (hasTriedSearch) {
        if (!kReleaseMode) print("has tried search true");
        Toaster.showMerchantNotFoundOnGoogleMaps(context);
        showRegisterOnGmaps();
      } else {
        if (!kReleaseMode) print("has tried search false");
        //TODO always use snackbar or toasts but dont mix them
        Toaster.showMerchantNotFoundOnGoogleMapsTryAgain(context);
        setState(() {
          hasTriedSearch = true;
          showInputAdr = true;
        });
      }
    } else {
      loadMerchantsDetailsPrefillAddress(placeId);
    }
  }

  Future<void> loadMerchantsDetailsPrefillAddress(String placeId) async {
    merchant = await findPlaceIdDetails(placeId);
    prefillName(merchant);
    prefillAddress(merchant);
    prefillTags(merchant);
    hideRegisterOnGmaps();
    hideSearchBtn();
  }

  void prefillTags(Merchant merchant) {}

  void prefillAddress(Merchant merchant) {
    controllerInputAdr.clear();
    controllerInputAdr.text = merchant.location;
    showInputAddress();
    updateInputAdr(merchant.location);
  }

  void prefillName(Merchant merchant) {
    controllerInputName.clear();
    controllerInputName.text = merchant.name;
    updateInputName(merchant.name);
  }

  Future<Merchant> findPlaceIdDetails(placeId) async {
    var result = await Dio().get(
        "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyAVDl8Ng3iT4xfX2r6Fj1SvJJvndz73JOI&place_id=" +
            placeId);
    var data = result.data["result"];

    Merchant m = parseGmapsDataToMerchant(placeId, data);

    if (!kReleaseMode) printWrapped(m.getBmapDataJson());
    return m;
  }

  Merchant parseGmapsDataToMerchant(placeId, data) {
    var location = data["geometry"]["location"];
    var reviews = data["reviews"];

    String tags = parseReviewsSearchForMatchingTags(reviews);

    Merchant m = Merchant(
        placeId,
        location["lat"],
        location["lng"],
        data["name"],
        selectedType /*TODO add function to map google types to bmap types*/,
        data["user_ratings_total"].toString(),
        data["rating"].toString(),
        0,
        tags,
        data["formatted_address"],
        4,
        "0");
    return m;
  }

  String parseReviewsSearchForMatchingTags(reviews) {
    StringBuffer resultTags = StringBuffer();

    for (var r in reviews) {
      int index = 0;
      String review = r["text"].toString().toLowerCase();
      //print(review + "\n");
      //TODO replace accented characters with normal ones to match more
      matchTags(resultTags, index, review, Tag.tagText);
      matchTags(resultTags, index, review, Tag.tagTextDE);
      matchTags(resultTags, index, review, Tag.tagTextES);
      matchTags(resultTags, index, review, Tag.tagTextFR);
      matchTags(resultTags, index, review, Tag.tagTextINDONESIA);
      matchTags(resultTags, index, review, Tag.tagTextIT);
      matchTags(resultTags, index, review, Tag.tagTextJP1);
      matchTags(resultTags, index, review, Tag.tagTextJP2);
    }

    String results = resultTags.isNotEmpty
        ? resultTags.toString().substring(1)
        : "104,104,104,104";

    if (results.split(",").length < 4) results = appendPlaceholderTags(results);

    if (!kReleaseMode) print(results);
    return results;
  }

  matchTags(StringBuffer allTags, int index, String review, tags) {
    for (String t in tags) {
      String tag = t.split(" ")[0].trim().toLowerCase();
      //print(tag);
      if (index != 104 && review.contains(tag) && tag.isNotEmpty) {
        print("index:" + index.toString() + "\ntag:" + tag + "\n");
        //The tag 107 is men and very short it appears in many other words
        if (index != 107 ||
            (index == 107 && review.contains(" " + tag + " "))) {
          allTags.write("," + index.toString());
          inputTag(t);
        }
      }
      index++;
    }
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future<String> findPlaceId(String search) async {
    var encoded = Uri.encodeComponent(search);
    var result = await new Dio().get(
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?inputtype=textquery&key=AIzaSyAVDl8Ng3iT4xfX2r6Fj1SvJJvndz73JOI&input=" +
            encoded);
    if (!kReleaseMode) printWrapped(result.toString());
    if (result.data['status'].toString() == "ZERO_RESULTS") return null;
    var placeId = result.data['candidates'][0]["place_id"].toString();
    if (!kReleaseMode) print(placeId);
    return placeId;
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed
    focusNodeInputDASH.dispose();
    focusNodeInputBCH.dispose();
    focusNodeInputAdr.dispose();
    focusNodeInputName.dispose();
    controllerInputDASH.dispose();
    controllerInputBCH.dispose();
    controllerInputAdr.dispose();
    controllerInputName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButton: wrapBuildSubmitBtn(),
      appBar: AppBar(
        backgroundColor: actionBarColor,
        title: Text(i18n(context, "add_title") + i18n(context, typeTitle)),
      ),
      body: Builder(
          builder: (ctx) => Padding(
                padding: EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      wrapBuildColumnNameWithSearch(ctx),
                      wrapBuildColumnAdr(ctx),
                      wrapBuildColumnRegisterOnGmaps(ctx),
                      wrapBuildColumnTag(ctx),
                      wrapBuildSelectedTagsList(),
                      wrapBuildColumnDASHyBCH(ctx),
                    ],
                  ),
                ),
              )),
    );
  }

  Widget wrapBuildColumnRegisterOnGmaps(ctx) => AnimatedOpacity(
      curve: DEFAULT_ANIMATION_CURVE,
      duration: DEFAULT_DURATION_OPACITY_FADE,
      opacity: !showRegisterOnGoogleMapsButton ? 0.0 : 1.0,
      child: buildColumnRegisterOnGmaps(ctx));

  Widget wrapBuildColumnNameWithSearch(ctx) => AnimatedOpacity(
      curve: DEFAULT_ANIMATION_CURVE,
      duration: DEFAULT_DURATION_OPACITY_FADE,
      opacity: showInputAdr ? OPACITY_ITEM_VALIDATED : 1.0,
      child: buildColumnNameWithSearch(ctx));

  Widget wrapBuildColumnTag(ctx) => AnimatedOpacity(
      curve: DEFAULT_ANIMATION_CURVE,
      duration: DEFAULT_DURATION_OPACITY_FADE,
      opacity: !showInputTags
          ? OPACITY_ITEM_DEACTIVATED
          : hasInputAllTags()
              ? OPACITY_ITEM_VALIDATED
              : 1.0,
      child: buildColumnTag(ctx));

  Widget wrapBuildColumnAdr(ctx) => AnimatedOpacity(
      curve: DEFAULT_ANIMATION_CURVE,
      duration: DEFAULT_DURATION_OPACITY_FADE,
      opacity: !showInputAdr
          ? OPACITY_ITEM_DEACTIVATED
          : showInputTags
              ? OPACITY_ITEM_VALIDATED
              : 1.0,
      child: buildColumnAdr(ctx));

  bool hasInputAllTags() => allSelectedTags.length == 4;

  Widget wrapBuildColumnDASHyBCH(ctx) => AnimatedOpacity(
      curve: DEFAULT_ANIMATION_CURVE,
      duration: DEFAULT_DURATION_OPACITY_FADE,
      opacity: !showInputDASHyBCH ? OPACITY_ITEM_DEACTIVATED : 1.0,
      child: buildColumnDASHyBCH(ctx));

  Widget wrapBuildSubmitBtn() => AnimatedOpacity(
        curve: DEFAULT_ANIMATION_CURVE,
        duration: DURATION_OPACITY_FADE_SUBMIT_BTN,
        opacity: showSubmitBtn
            ? allSelectedTags.length == MIN_INPUT_TAGS
                ? 1.0
                : 0.5
            : 0.0,
        child: buildSubmitBtn(context),
      );

  Padding buildEmptyPaddingAsPlaceholder() {
    return Padding(
      padding: EdgeInsets.all(0.0),
    );
  }

  Column buildColumnNameWithSearch(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          i18n(ctx, "add_place_name_title"),
          style: textStyleLabel(),
        ),
        buildSizedBoxSeparator(),
        Text(
          i18n(ctx, "add_place_name_subtitle"),
          style: textStyleHint(),
        ),
        buildTextField(
            controllerInputName,
            false,
            ctx,
            focusNodeInputName,
            focusNodeInputAdr,
            0.1,
            Icons.title,
            MAX_INPUT_NAME,
            i18n(ctx, "name"),
            updateInputName),
        AnimatedOpacity(
            curve: DEFAULT_ANIMATION_CURVE,
            duration: DEFAULT_DURATION_OPACITY_FADE,
            opacity: !showSearchButton ? 0.0 : 1.0,
            child: ElevatedButton(
              child: Text(
                Translator.translate(ctx, "action_search"),
                style: textStyleButtons,
              ),
              onPressed: () {
                searchOnGoogleMapsPrefillFields();
              },
            ))
      ],
    );
  }

  Column buildColumnRegisterOnGmaps(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ElevatedButton(
          child: Text(
            Translator.translate(
                ctx, Translator.translate(ctx, "action_register_on_gmaps")),
            style: textStyleButtons,
          ),
          onPressed: () {
            UrlLauncher.launchRegisterOnGmaps();
          },
        )
      ],
    );
  }

  Column buildColumnTag(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildSizedBoxSeparator(multiplier: 2.0),
        Text(
          i18n(ctx, "choose_four_tags"),
          style: textStyleLabel(),
        ),
        buildSizedBoxSeparator(),
        Text(
          i18n(ctx, "hit_the_button_scroll"),
          style: textStyleHint(),
        ),
        buildSizedBoxSeparator(),
        buildSearchTagButton(ctx),
      ],
    );
  }

  Widget wrapBuildSelectedTagsList() {
    return allSelectedTags.length > 0
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: AnimatedOpacity(
              curve: DEFAULT_ANIMATION_CURVE,
              duration: DEFAULT_DURATION_OPACITY_FADE,
              opacity: hasInputAllTags() ? OPACITY_ITEM_VALIDATED : 1.0,
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildAnimatedOpacityTag(0),
                    buildAnimatedOpacityTag(1),
                    buildAnimatedOpacityTag(2),
                    buildAnimatedOpacityTag(3),
                  ],
                ),
              ),
            ),
          )
        : buildEmptyPaddingAsPlaceholder();
  }

  AnimatedOpacity buildAnimatedOpacityTag(index) {
    return AnimatedOpacity(
        curve: DEFAULT_ANIMATION_CURVE,
        duration: DEFAULT_DURATION_OPACITY_FADE,
        opacity: hasTagWithThatIndexThenShowIt(index),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(allSelectedTags.length <= index
              ? ""
              : allSelectedTags.elementAt(index) + "  "),
        ));
  }

  double hasTagWithThatIndexThenShowIt(index) =>
      allSelectedTags.length > index ? 1.0 : 0.0;

  List<Widget> buildTagsRow() {
    return allSelectedTags.map<Widget>((String tag) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Text(tag + "  "),
      );
    }).toList();
  }

  Widget buildSubmitBtn(ctx) {
    return FloatingActionButton.extended(
        onPressed: () async {
          if (!showSubmitBtn) return;

          if (inputName.length < MIN_INPUT_NAME) {
            Toaster.showAddName(ctx);
            return;
          }
          if (inputAdr.length < MIN_INPUT_ADR) {
            Toaster.showAddFullAdr(ctx);
            return;
          }
          if (allSelectedTags.length < MIN_INPUT_TAGS) {
            Toaster.showAddExactlyFourTags(ctx);
            return;
          }
          if (!hasMinInput(inputBCH) && !hasMinInput(inputDASH)) {
            Toaster.showAddAtleastOneReceivingAddress(ctx);
            return;
          }

          submitData(ctx);
        },
        icon: Icon(Icons.send),
        label: Text(i18n(ctx, "send")));
  }

  void submitData(ctx) async {
    //Dialogs.confirmSendEmail(context, () {

    UrlLauncher.launchEmailClientAddPlace(
        ctx, inputDASH, inputBCH, buildJsonToSubmitViaEmail(),
        (String content) {
      print("Add Place Submit:\n" + Uri.decodeComponent(content));
      Toaster.showToastEmailNotConfigured(ctx);
    });
    //});
    /*Dialogs.confirmDownloadPdf(context, () {
      UrlLauncher.launchQrCodeGeneratorUrl(
          dash: hasMinInput(inputDASH) ? inputDASH : "",
          bch: hasMinInput(inputBCH) ? inputBCH : "");
    });*/
  }

  bool hasMinInput(input) => input.length > MIN_INPUT_BCHyDASH;

  Column buildColumnDASHyBCH(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildSizedBoxSeparator(multiplier: 2.0),
        Text(
          i18n(ctx, "what_is_your_dash"),
          style: textStyleLabel(),
        ),
        buildSizedBoxSeparator(),
        Text(
          i18n(ctx, "open_your_dash_wallet"),
          style: textStyleHint(),
        ),
        buildTextField(
            controllerInputDASH,
            false,
            ctx,
            focusNodeInputDASH,
            focusNodeInputBCH,
            INPUT_DASH_POS,
            Icons.monetization_on,
            MAX_INPUT_DASH,
            i18n(ctx, "dash_adr"),
            updateInputDASH),
        buildSizedBoxSeparator(multiplier: 2.0),
        Text(
          i18n(ctx, "receiving_adr"),
          style: textStyleLabel(),
        ),
        buildSizedBoxSeparator(),
        Text(
          i18n(ctx, "copy_adr_instructions"),
          style: textStyleHint(),
        ),
        buildTextField(
            controllerInputBCH,
            true,
            ctx,
            focusNodeInputBCH,
            null,
            INPUT_BCH_POS,
            Icons.monetization_on,
            MAX_INPUT_BCH,
            i18n(ctx, "bch_adr"),
            updateInputBCH),
        buildSizedBoxSeparator(multiplier: 5.0),
      ],
    );
  }

  Column buildColumnAdr(ctx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        buildSizedBoxSeparator(multiplier: 2.0),
        Text(
          i18n(ctx, "postal_adr"),
          style: textStyleLabel(),
        ),
        buildSizedBoxSeparator(),
        Text(
          i18n(ctx, "street_number"),
          style: textStyleHint(),
        ),
        buildTextField(
            controllerInputAdr,
            false,
            ctx,
            focusNodeInputAdr,
            null,
            INPUT_ADR_POS,
            Icons.local_post_office,
            MAX_INPUT_ADR,
            i18n(ctx, "address"),
            updateInputAdr),
      ],
    );
  }

  SizedBox buildSizedBoxSeparator({multiplier = 1.0}) =>
      SizedBox(height: 10.0 * multiplier);

  void handleAddTagButton(ctx) async {
    if (allSelectedTags.length >= MIN_INPUT_TAGS) {
      if (!kReleaseMode)
        resetTags();
      else
        Dialogs.confirmShowResetTags(ctx, () {
          resetTags();
        });
      return;
    }

    final String selected = await showSearch<String>(
      context: ctx,
      delegate: searchTagsDelegate,
    );

    if (selected == null || selected.isEmpty) return;

    inputTag(selected);
  }

  void inputTag(String selected) {
    addSelectedTag(selected);

    // if (!kReleaseMode) printAllTags(searchTagsDelegate.alreadySelected);

    if (allSelectedTags.length == MAX_INPUT_TAGS) {
      if (!kReleaseMode)
        Clipboard.setData(ClipboardData(text: printAllTags()));
      else {
        showInputBCHyDASH();
        FocusScope.of(context).requestFocus(focusNodeInputDASH);
        scrollController.jumpTo(INPUT_DASH_POS);
      }
    } else {
      scrollController.jumpTo(INPUT_TAGS_POS);
    }

    setState(() {
      showSubmitBtn = kReleaseMode ? true : false;
    });
  }

  void resetTags() {
    setState(() {
      allSelectedTags = Set.from([]);
      searchTagsDelegate.alreadySelected = Set.from([]);
      showInputDASHyBCH = false;
      showSubmitBtn = false;
    });
  }

  void showInputBCHyDASH() {
    setState(() {
      showInputDASHyBCH = true;
    });
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    if (currentFocus != null) currentFocus.unfocus();
    if (nextFocus != null) FocusScope.of(context).requestFocus(nextFocus);
  }

  void scrollToWithAnimation(pos) {
    if (scrollController.hasClients) {
      scrollController.animateTo(pos,
          duration: DEFAULT_DURATION_SCROLL_ANIMATION,
          curve: DEFAULT_ANIMATION_CURVE);
    }
  }

  ElevatedButton buildSearchTagButton(ctx) {
    var iconSeparator = "   ";
    var tagCounter = allSelectedTags.length;
    return ElevatedButton(
      onPressed: () {
        handleAddTagButton(ctx);
      },
      /*textColor: TEXT_COLOR,
      color: actionBarColor,
      shape: StadiumBorder(
          side: BorderSide(
              color: TEXT_COLOR, style: BorderStyle.solid, width: 1.0)),
      splashColor: accentColor,*/
      child: Padding(
        padding: buildEdgeInsetsTextField(),
        child: Row(
          children: <Widget>[
            Icon(Icons.search),
            tagCounter == 0
                ? Text(
                    iconSeparator + Translator.translate(ctx, "choose_tag_1"))
                : tagCounter == 1
                    ? Text(iconSeparator +
                        Translator.translate(ctx, "choose_tag_2"))
                    : tagCounter == 2
                        ? Text(iconSeparator +
                            Translator.translate(ctx, "choose_tag_3"))
                        : tagCounter == 3
                            ? Text(iconSeparator +
                                Translator.translate(ctx, "choose_tag_4"))
                            : Text(iconSeparator +
                                Translator.translate(ctx, "choose_tag_5"))
          ],
        ),
      ),
    );
  }

  TextField buildTextField(
      textEditingController,
      isDone,
      ctx,
      focusNode,
      nextFocusNode,
      onTapScrollToThisPosition,
      icon,
      maxLength,
      String label,
      updateInputCallback) {
    return TextField(
      focusNode: focusNode,
      onTap: () {
        scrollToWithAnimation(onTapScrollToThisPosition);
      },
      decoration: InputDecoration(
          icon: Icon(icon),
          contentPadding: buildEdgeInsetsTextField(),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: accentColor)),
          labelText:
              i18n(ctx, "insert_hint_1") + label + i18n(ctx, "insert_hint_2")),
      cursorColor: accentColor,
      textCapitalization: TextCapitalization.words,
      textInputAction: isDone ? TextInputAction.done : TextInputAction.next,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: maxLength,
      maxLines: 1,
      controller: textEditingController,
      onChanged: updateInputCallback,
      style: textStyleInput(),
    );
  }

  String i18n(ctx, str) => Translator.translate(ctx, str);

  EdgeInsets buildEdgeInsetsTextField() => EdgeInsets.all(10.0);

  TextStyle textStyleInput() =>
      TextStyle(color: TEXT_COLOR, fontWeight: FontWeight.w400);

  TextStyle textStyleLabel() => TextStyle(
      color: TEXT_COLOR,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold);
  TextStyle textStyleHint() => TextStyle(
      color: TEXT_COLOR.withOpacity(0.8),
      fontSize: 14.0,
      fontWeight: FontWeight.w300);

  void showInputAddress() {
    setState(() {
      showInputAdr = true;
    });
  }

  void showRegisterOnGmaps() {
    setState(() {
      showRegisterOnGoogleMapsButton = true;
    });
  }

  void hideRegisterOnGmaps() {
    setState(() {
      showRegisterOnGoogleMapsButton = false;
    });
  }

  void hideSearchBtn() {
    setState(() {
      showSearchButton = false;
    });
  }

  void showSearchBtn() {
    setState(() {
      showSearchButton = true;
    });
  }

  void showInputTag() {
    scrollToWithAnimation(INPUT_TAGS_POS);
    setState(() {
      showInputTags = true;
    });
  }

  void updateInputBCH(String input) {
    var hasMinInput = inputBCH.length >= MIN_INPUT_BCHyDASH;

    if (hasMinInput && lastInputBCH != inputBCH) {
      if (input == KEYWORD_CONTROLLER_ACTION &&
          lastInputBCHWithCommand == KEYWORD_CONTROLLER_ACTION) {
        submitData(context);
        _fieldFocusChange(context, focusNodeInputBCH, null);
        lastInputBCH = inputBCH;
        return;
      }
    }
    lastInputBCHWithCommand = input;
    if (input != KEYWORD_CONTROLLER_ACTION) {
      inputBCH = input;
    }
  }

  var youSaidIt = false;

  void updateInputDASH(String input) {
    var hasMinInput = inputDASH.length >= MIN_INPUT_BCHyDASH;

    if (hasMinInput && lastInputDASH != inputDASH) {
      if (input == KEYWORD_CONTROLLER_ACTION &&
          lastInputDASHWithCommand == KEYWORD_CONTROLLER_ACTION) {
        _fieldFocusChange(context, focusNodeInputDASH, focusNodeInputBCH);
        scrollToWithAnimation(INPUT_BCH_POS);
        lastInputDASH = inputDASH;
        return;
      }
    }

    if (input.length >= MIN_INPUT_BCHyDASH &&
        input != KEYWORD_CONTROLLER_ACTION &&
        !youSaidIt) {
      Toaster.showToastAttractCustomers(context);
      youSaidIt = true;
    }

    lastInputDASHWithCommand = input;
    if (input != KEYWORD_CONTROLLER_ACTION) {
      inputDASH = input;
    }
  }

  void updateInputAdr(String input) {
    var hasMinInput = inputAdr.length >= MIN_INPUT_ADR;

    if (hasMinInput && lastInputAdr != inputAdr) {
      if (input == KEYWORD_CONTROLLER_ACTION &&
          lastInputAdrWithCommand == KEYWORD_CONTROLLER_ACTION) {
        _fieldFocusChange(context, focusNodeInputAdr, null);
        scrollToWithAnimation(INPUT_TAGS_POS);
        lastInputAdr = inputAdr;
        return;
      }
    }

    if (!showInputTags &&
        input.length >= MIN_INPUT_ADR &&
        input != KEYWORD_CONTROLLER_ACTION) {
      showInputTag();
    }

    lastInputAdrWithCommand = input;
    if (input != KEYWORD_CONTROLLER_ACTION) {
      inputAdr = input;
    }
  }

  void updateInputName(String input) {
    var hasMinInput = inputName.length >= MIN_INPUT_NAME;

    if (hasMinInput && lastInputName != inputName) {
      if (input == KEYWORD_CONTROLLER_ACTION &&
          lastInputNameWithCommand == KEYWORD_CONTROLLER_ACTION) {
        // _fieldFocusChange(context, null, focusNodeInputAdr);
        //TODO reactivate scrollToWithAnimation(INPUT_ADR_POS);
        lastInputName = inputName;
        return;
      }
    }

    if (input.length >= MIN_INPUT_NAME && input != KEYWORD_CONTROLLER_ACTION) {
      showSearchBtn();
    }

    if (hasTriedSearch && input != KEYWORD_CONTROLLER_ACTION) {
      showInputAddress();
    }

    lastInputNameWithCommand = input;
    if (input != KEYWORD_CONTROLLER_ACTION) {
      inputName = input;
    }
  }

  void addSelectedTag(String selected) {
    setState(() {
      allSelectedTags.add(selected);
    });
    searchTagsDelegate.alreadySelected.add(Tag.getTagIndex(selected));
  }

  String buildJsonToSubmitViaEmail() {
    return Uri.encodeComponent('{"n":"' +
        inputName.trim() +
        '","type":"' +
        typeTitle.trim() +
        '","bch":"' +
        inputBCH.trim() +
        '","dash":"' +
        inputDASH.trim() +
        '","l":"' +
        inputAdr.trim() +
        '","tags":"[' +
        buildJsonTag(allSelectedTags.elementAt(0)) +
        ',' +
        buildJsonTag(allSelectedTags.elementAt(1)) +
        ',' +
        buildJsonTag(allSelectedTags.elementAt(2)) +
        ',' +
        buildJsonTag(allSelectedTags.elementAt(3)) +
        '],' +
        printAllTags() +
        '}');
  }

  String buildJsonTag(tag) {
    return '{"tag":"' +
        tag +
        '", "id":"' +
        Tag.getTagIndex(tag).toString() +
        '"}';
  }

  String printAllTags() {
    return '"a":"' +
        searchTagsDelegate.alreadySelected.elementAt(0).toString() +
        "," +
        searchTagsDelegate.alreadySelected.elementAt(1).toString() +
        "," +
        searchTagsDelegate.alreadySelected.elementAt(2).toString() +
        "," +
        searchTagsDelegate.alreadySelected.elementAt(3).toString() +
        '"';
  }

  String appendPlaceholderTags(String results) {
    int targetLength = 4;
    for (var i = results.split(",").length; i < targetLength; i++) {
      results += ",104";
    }
    return results;
  }
}
