// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'Template.g.dart';

@JsonSerializable(explicitToJson: true)
class Template {
  int? id;
  String? ad;
  int? sponsorid;
  String? jsonstr;
  TemplateHierarchy? hierarchy;
  TemplateText? text;

  Template(
      {this.id,
      this.ad,
      this.sponsorid,
      this.jsonstr,
      this.hierarchy,
      this.text});

  factory Template.fromJson(Map<String, dynamic> json) =>
      _$TemplateFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateToJson(this);

  @override
  String toString() {
    return 'Template(id: $id, ad: $ad, sponsorid: $sponsorid, jsonstr: $jsonstr)';
  }
}

@JsonSerializable(explicitToJson: true)
class TemplateCard {
  int? W;
  int? H;

  TemplateCard({this.W, this.H});

  factory TemplateCard.fromJson(Map<String, dynamic> json) =>
      _$TemplateCardFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateCardToJson(this);

  @override
  String toString() {
    return 'TemplateCard(W: $W, H: $H)';
  }
}

@JsonSerializable(explicitToJson: true)
class TemplateText {
  String? align;
  int? X;
  int? Y;
  bool? Bold;
  bool? Italic;
  int? Fsize;
  bool? Visible;
  TemplateText({
    this.align,
    this.X,
    this.Y,
    this.Bold,
    this.Italic,
    this.Fsize,
    this.Visible,
  });

  factory TemplateText.fromJson(Map<String, dynamic> json) =>
      _$TemplateTextFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateTextToJson(this);

  @override
  String toString() {
    return 'TemplateText(Align:$align,X: $X, Y: $Y, Bold: $Bold, Italic: $Italic,FSize:$Fsize,Visible:$Visible)';
  }
}

@JsonSerializable(explicitToJson: true)
class TemplateHierarchy {
  TemplateCard? card;
  TemplateText? fullname;
  TemplateText? title1;
  TemplateText? title2;
  TemplateText? department;
  TemplateText? companyName;
  TemplateText? address1;
  TemplateText? address2;
  TemplateText? address3;
  TemplateText? district;
  TemplateText? zipcode;
  TemplateText? city;
  TemplateText? country;
  TemplateText? email;
  TemplateText? webaddress;
  TemplateText? t1;
  TemplateText? t2;
  TemplateText? m1;
  TemplateText? m2;
  TemplateText? f;
  Logo? logo1;
  Logo? logo2;
  Logo? logo3;
  TemplateHierarchy({
    this.card,
    this.fullname,
    this.title1,
    this.title2,
    this.department,
    this.companyName,
    this.address1,
    this.address2,
    this.address3,
    this.district,
    this.zipcode,
    this.city,
    this.country,
    this.email,
    this.webaddress,
    this.t1,
    this.t2,
    this.m1,
    this.m2,
    this.f,
    this.logo1,
    this.logo2,
    this.logo3,
  });

  factory TemplateHierarchy.fromJson(Map<String, dynamic> json) =>
      _$TemplateHierarchyFromJson(json);

  Map<String, dynamic> toJson() => _$TemplateHierarchyToJson(this);

  @override
  String toString() {
    return 'TemplateHierarchy(card: $card,fullname:$fullname)';
  }
}

@JsonSerializable(explicitToJson: true)
class Logo {
  String? align;
  int? X;
  int? Y;
  int? H;
  int? W;
  bool? Visible;

  Logo({
    this.align,
    this.X,
    this.Y,
    this.H,
    this.W,
    this.Visible,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoToJson(this);

  @override
  String toString() {
    return 'Logo(align: $align, X: $X, Y: $Y, H: $H, W: $W, Visible: $Visible)';
  }
}
