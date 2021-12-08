import 'package:Coinector/translator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';
import 'package:loading/indicator/ball_grid_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import 'AssetLoader.dart';
import 'CustomBoxShadow.dart';
import 'Dialogs.dart';
import 'ItemInfoStackLayer.dart';
import 'Merchant.dart';
import 'RatingWidgetBuilder.dart';
import 'Toaster.dart';
import 'UrlLauncher.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {Key key,
      @required this.animation,
      @required this.index,
      @required this.merchant,
      @required this.tagFilterCallback,
      this.selected: false})
      : assert(animation != null),
        assert(merchant != null),
        assert(index != null),
        super(key: key);

  final TagFilterCallback tagFilterCallback;
  final int index;
  final Animation<double> animation;
  final Merchant merchant;
  final bool selected;
  final double itemHeightInfoText = 95;

  FlatButton buildSendEmailButton(BuildContext ctx) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Icon(Icons.alternate_email),
          I18nText("send_email")
        ],
      ),
      onPressed: () {
        Navigator.of(ctx).pop();
        UrlLauncher.launchEmailClientUpdatePaymentDetails(ctx, merchant, () {
          Toaster.showToastEmailNotConfigured(ctx);
        });
      },
    );
  }

  void showPlaceNotFoundOnGmaps(ctx) {
    showDialog(
        context: ctx,
        builder: (BuildContext buildCtx) {
          return AlertDialog(
            actions: [
              buildSendEmailButton(buildCtx),
              Dialogs.buildCloseDialogButton(buildCtx)
            ],
            title: I18nText("dialog_missing_gmaps_title",child: Text("",
                style: TextStyle(color: Colors.white))),
            content: I18nText("dialog_help_grow_adoption"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyleBody1 = Theme.of(context).textTheme.bodyText1;
    TextStyle textStyleBody2 = Theme.of(context).textTheme.bodyText2;

    /*final infoBoxBackgroundColor =
        MyColors.getCardInfoBoxBackgroundColor(merchant.type).withOpacity(1.0);
    final actionButtonBackgroundColor = Colors.grey[900].withOpacity(0.0);*/
    return SizedBox(
      child: Card(
          clipBehavior: Clip.none,
          margin:
              EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0, bottom: 20.0),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: <Widget>[
              buildContentStack(
                  context, textStyleBody1, textStyleBody2, tagFilterCallback),
              buildButtonTheme(context),
            ],
          )),
    );
  }

  Widget buildContentStack(BuildContext ctx, TextStyle textStyle,
      TextStyle textStyle2, TagFilterCallback tagFilterCallback) {
    var gifUrl =
        'https://raw.githubusercontent.com/theRealBitcoinClub/BITCOINMAP.CASH---Browser-PWA/master/public/img/app/' +
            merchant.id +
            ".gif";

    var backGroundColor = Colors.grey[900].withOpacity(0.8);
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: kReleaseMode
                ? buildImageContainer(gifUrl)
                : buildBackGroundImageFallback(
                    ctx)), //LIMIT DATA USAGE BY NOT LOADING IMAGES IN DEV MODE
        buildStackInfoTextWithBackgroundAndShadow(
            backGroundColor, textStyle, textStyle2, tagFilterCallback),
        buildPositionedContainerDistance(ctx, backGroundColor, textStyle2),
        RatingWidgetBuilder.hasReviews(merchant)
            ? buildPositionedContainerReviews(backGroundColor, ctx)
            : SizedBox(),
      ],
    );
  }

  Widget buildBackGroundImageFallback(BuildContext ctx) {
    var img = "assets/placeholder640x480.jpg";
    return FadeInImage.assetNetwork(
      fadeInCurve: Curves.decelerate,
      fit: BoxFit.contain,
      fadeInDuration: Duration(milliseconds: 300),
      placeholder: img,
      image: img,
      width: 640,
      height: kIsWeb ? 455 : 390,
      alignment: Alignment.bottomCenter,
    );
  }

  Widget buildImageContainer(String gifUrl) {
    return Stack(children: <Widget>[
      Positioned(
        child: Loading(
            color: Colors.white, indicator: BallGridPulseIndicator(), size: 40),
        left: kIsWeb ? 230 : 190,
        bottom: kIsWeb ? 40 : 45,
      ),
      FadeInImage.memoryNetwork(
        fadeInCurve: Curves.decelerate,
        fit: BoxFit.contain,
        fadeInDuration: Duration(milliseconds: 500),
        placeholder: kTransparentImage,
        image: gifUrl,
        width: 640,
        height: 390,
        alignment: Alignment.bottomCenter,
      )
    ]);
  }

  Stack buildStackInfoTextWithBackgroundAndShadow(
      Color backGroundColor,
      TextStyle textStyle,
      TextStyle textStyle2,
      TagFilterCallback tagFilterCallback) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(0.0),
          height: itemHeightInfoText,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                CustomBoxShadow(
                    color: backGroundColor.withOpacity(1),
                    blurRadius: 3.0,
                    offset: Offset(0.0, 0.0),
                    blurStyle: BlurStyle.outer)
              ],
              color: backGroundColor),
        ),
        ItemInfoStackLayer(
            filterCallback: tagFilterCallback,
            merchant: merchant,
            textStyleMerchantTitle: textStyle,
            textStyleMerchantLocation: textStyle2,
            height: itemHeightInfoText)
      ],
    );
  }

  Positioned buildPositionedContainerDistance(
      BuildContext ctx, Color backGroundColor, TextStyle textStyle2) {
    return Positioned(
      right: 0.0,
      bottom: kIsWeb ? 80 : 73.0,
      child: merchant.distance != null
          ? GestureDetector(
              onTap: () {
                _handleButtonVisit(ctx);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 10.0, 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: buildRadius(), bottomLeft: buildRadius()),
                    color: backGroundColor),
                child: Text(
                  merchant.distance.toString(),
                  style: textStyle2,
                ),
              ))
          : Container(),
    );
  }

  Positioned buildPositionedContainerReviews(
      Color backGroundColor, BuildContext ctx) {
    return Positioned(
        right: 0.0,
        bottom: kIsWeb ? 50 : 45.0,
        child: GestureDetector(
          onTap: () {
            handleReviewClick(ctx);
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: buildRadius(), bottomLeft: buildRadius()),
                color: backGroundColor),
            child: RatingWidgetBuilder.buildRatingWidgetIfReviewsAvailable(
                merchant, Theme.of(ctx).textTheme.bodyText2),
          ),
        ));
  }

  Radius buildRadius() => Radius.circular(10);

  //TODO use REGEX to improve searchalgorithm, search for matched words instead of matched anything "gin" or identify tags and dont searcg

  String getServerId() {
    return (merchant.serverId.contains('-')
        ? merchant.serverId.split('-')[0]
        : merchant.serverId);
  }

  Container buildGradientContainer(Color infoBoxBackgroundColor) {
    return Container(
      height: itemHeightInfoText,
      decoration: BoxDecoration(
        color: infoBoxBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    );
  }

  Container buildButtonTheme(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            CustomBoxShadow(
                color: Colors.black.withOpacity(0.65),
                blurRadius: 1.0,
                offset: Offset(0.0, 0.0),
                blurStyle: BlurStyle.outer)
          ],
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0)),
          color: Colors.grey[900].withOpacity(0.1)),
      child: buildButtons(context),
    );
  }

  ButtonBarTheme buildButtons(BuildContext context) {
    return ButtonBarTheme(
        data: ButtonBarThemeData(),
        child: Padding(
            padding: EdgeInsets.all(5.0),
            child: ButtonBar(
              buttonPadding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              mainAxisSize: MainAxisSize.max,
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                buildFlatButtonShare(context),
                buildFlatButtonReview(context),
                buildFlatButtonVisit(context),
              ],
            )));
  }

  FlatButton buildFlatButtonVisit(BuildContext context) {
    return FlatButton(
      child: Column(
        children: <Widget>[
          Dialogs.buildIcon(Icons.directions_run, Colors.white),
          Dialogs.buildSpacer(),
            I18nText('VISIT', child: Text("",
            style: TextStyle(fontSize: 14, color: Colors.white)),
          )
        ],
      ),
      onPressed: () {
        _handleButtonVisit(context);
      },
    );
  }

  void _handleButtonVisit(BuildContext context) {
    if (merchant.place == null) {
      loadPlace(() {
        if (merchant.place == null) {
          UrlLauncher.launchCoordinatesUrl(context, merchant);
        } else {
          UrlLauncher.launchVisitUrl(context, merchant);
        }
      });
    } else {
      UrlLauncher.launchVisitUrl(context, merchant);
    }
  }

  void loadPlace(afterLoadCallback) async {
    new AssetLoader().loadPlace(merchant.id).then((place) {
      merchant.place = place;
      afterLoadCallback();
    });
  }

  void handleReviewClick(ctx) async {
    if (merchant.place == null) {
      loadPlace(() {
        if (merchant.place == null)
          showPlaceNotFoundOnGmaps(ctx);
        else
          UrlLauncher.launchReviewUrl(ctx, merchant.place);
      });
    } else {
      UrlLauncher.launchReviewUrl(ctx, merchant.place);
    }
  }

  FlatButton buildFlatButtonShare(BuildContext ctx) {
    return FlatButton(
      child: Column(
        children: <Widget>[
          Dialogs.buildIcon(Icons.share, Colors.white),
          Dialogs.buildSpacer(),
          Text(
            Translator.translate(ctx, 'SHARE'),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      onPressed: () {
        if (kIsWeb) {
          UrlLauncher.launchURI("https://coinector.app/share.html?search=" +
              Uri.encodeComponent(merchant.name) +
              "&location=" +
              Uri.encodeComponent(merchant.location));
          return;
        }
        Share.share(
            'https://coinector.app/#/' + Uri.encodeComponent(merchant.name),
            subject: 'Coinector - coinecting to coimunity...');
      },
    );
  }

  FlatButton buildFlatButtonReview(BuildContext ctx) {
    return FlatButton(
      child: Column(
        children: <Widget>[
          Dialogs.buildIcon(Icons.rate_review, Colors.white),
          Dialogs.buildSpacer(),
          Text(
            Translator.translate(ctx, 'REVIEW'),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      onPressed: () {
        handleReviewClick(ctx);
      },
    );
  }
}
