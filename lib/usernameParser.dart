import 'package:linkable/constants.dart';
import 'package:linkable/link.dart';
import 'package:linkable/parser.dart';

class UsernameParser implements Parser {
  String text;

  UsernameParser(this.text);

  parse() {
    String pattern = r"(?<!\w)@[\w+]{1,15}\b";

    RegExp regExp = RegExp(pattern);

    Iterable<RegExpMatch> _allMatches = regExp.allMatches(text);
    List<Link> _links = List<Link>();
    for (RegExpMatch match in _allMatches) {
      _links.add(Link(regExpMatch: match, type: username));
    }
    return _links;
  }
}
