import 'package:Coinector/translator.dart';
import 'package:flutter/material.dart';

import 'SuggestionList.dart';
import 'Tag.dart';
import 'Toaster.dart';
import 'UrlLauncher.dart';

class AddPlaceTagSearchDelegate extends SearchDelegate<String> {
  Set<int> alreadySelected = Set.from([]);

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  _getSuggestions(String pattern, ctx) {
    Set<String> matches = Set.from([]);

    switch (UrlLauncher.getLocale(ctx)) {
      case "de":
        addMatches(pattern, matches, Tag.tagTextDE);
        break;
      case "es":
        addMatches(pattern, matches, Tag.tagTextES);
        break;
      case "ja":
        addMatches(pattern, matches, Tag.tagTextJP1);
        addMatches(pattern, matches, Tag.tagTextJP2);
        break;
      case "fr":
        addMatches(pattern, matches, Tag.tagTextFR);
        break;
      case "id":
        addMatches(pattern, matches, Tag.tagTextINDONESIA);
        break;
      case "it":
        addMatches(pattern, matches, Tag.tagTextIT);
        break;
    }
    addMatches(pattern, matches, Tag.tagText);

    if (matches.length == 0) {
      matches.add(Translator.translate(ctx, "try_another_word"));
      //matches.add(SearchDemoSearchDelegate.TRY_ANOTHER_WORD);
    }

    return matches;
  }

  void addMatches(String pattern, Set<String> matches, sourceSet) {
    for (int x = 0; x < sourceSet.length; x++) {
      if (alreadySelected.contains(x)) continue;
      addMatch(x, pattern, matches, sourceSet.elementAt(x));
    }
  }

  void addMatch(
      int x, String pattern, Set<String> matches, String currentItem) {
    if (startsWith(currentItem, pattern)) {
      matches.add(currentItem);
    }
  }

  bool startsWith(String currentItem, String pattern) =>
      currentItem.toLowerCase().startsWith(pattern.toLowerCase());

  //static const COINECTOR_SUPPORTS_MANY_LANGUAGES =
  // "🇪🇸 🇩🇪 🇫🇷 🇮🇹 🇬🇧 🇯🇵 🇮🇩";

  Set<String> unfilteredSuggestions;

  @override
  Widget buildSuggestions(BuildContext ctx) {
    Set<String> suggestions = Set.from([
      //  COINECTOR_SUPPORTS_MANY_LANGUAGES,
      Translator.translate(ctx, "you_can_scroll")
    ]);

    if (unfilteredSuggestions != null && query.isEmpty)
      suggestions = unfilteredSuggestions;
    else if (query.isEmpty) {
      suggestions = addAllTagsInAllLanguages(suggestions, ctx);
      unfilteredSuggestions = suggestions;
    } else {
      suggestions = _getSuggestions(query, ctx);
    }

    return SuggestionList(
      query: query,
      suggestions: suggestions.map<String>((String i) => i).toList(),
      onSelected: (String match) {
        unfilteredSuggestions = null;
        close(ctx, match);
      },
    );
  }

  Set<String> addAllTagsInAllLanguages(Set<String> suggestions, ctx) {
    switch (UrlLauncher.getLocale(ctx)) {
      case "de":
        suggestions.addAll(cleanSuggestions(Tag.tagTextDE));
        break;
      case "es":
        suggestions.addAll(cleanSuggestions(Tag.tagTextES));
        break;
      case "ja":
        suggestions.addAll(cleanSuggestions(Tag.tagTextJP1));
        suggestions.addAll(cleanSuggestions(Tag.tagTextJP2));
        break;
      case "fr":
        suggestions.addAll(cleanSuggestions(Tag.tagTextFR));
        break;
      case "id":
        suggestions.addAll(cleanSuggestions(Tag.tagTextINDONESIA));
        break;
      case "it":
        suggestions.addAll(cleanSuggestions(Tag.tagTextIT));
        break;
    }
    suggestions.addAll(cleanSuggestions(Tag.tagText));
    return suggestions;
  }

  @override
  void showResults(BuildContext context) {
    //DONT SHOW ANY RESULTS HERE, SIMPLY REMOVE THE WIDGET
    //THIS METHOD IS CALLED WHEN USER HITS THE SEARCH ICON OF THE KEYBOARD LAYOUT
    Toaster.showToastSelectSuggestion();
    //close(context, null);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.delete_forever),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  Set<String> cleanSuggestions(Set<String> suggestions) {
    Set<String> cleanSuggestions = Set.from([]);
    int index = 0;

    suggestions.forEach((String suggestion) {
      if (!suggestion.contains("🍔🍔🍔")) {
        cleanSuggestions = checkIfAlreadySelectedAndAddIfNot(
            index, suggestion, cleanSuggestions);
      }
      index++;
    });
    return cleanSuggestions;
  }

  Set<String> checkIfAlreadySelectedAndAddIfNot(
      int currenItemIndex, String suggestion, Set<String> cleanSuggestions) {
    if (alreadySelected.length == 0 ||
        !alreadySelected.contains(currenItemIndex)) {
      cleanSuggestions.add(suggestion);
    }
    return cleanSuggestions;
  }
}
