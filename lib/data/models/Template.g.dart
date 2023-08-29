// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Template.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Template _$TemplateFromJson(Map<String, dynamic> json) => Template(
      id: json['id'] as int?,
      ad: json['ad'] as String?,
      sponsorid: json['sponsorid'] as int?,
      jsonstr: json['jsonstr'] as String?,
      hierarchy: json['hierarchy'] == null
          ? null
          : TemplateHierarchy.fromJson(
              json['hierarchy'] as Map<String, dynamic>),
      text: json['text'] == null
          ? null
          : TemplateText.fromJson(json['text'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateToJson(Template instance) => <String, dynamic>{
      'id': instance.id,
      'ad': instance.ad,
      'sponsorid': instance.sponsorid,
      'jsonstr': instance.jsonstr,
      'hierarchy': instance.hierarchy?.toJson(),
      'text': instance.text?.toJson(),
    };

TemplateCard _$TemplateCardFromJson(Map<String, dynamic> json) => TemplateCard(
      W: json['W'] as int?,
      H: json['H'] as int?,
    );

Map<String, dynamic> _$TemplateCardToJson(TemplateCard instance) =>
    <String, dynamic>{
      'W': instance.W,
      'H': instance.H,
    };

TemplateText _$TemplateTextFromJson(Map<String, dynamic> json) => TemplateText(
      align: json['align'] as String?,
      X: json['X'] as int?,
      Y: json['Y'] as int?,
      Bold: json['Bold'] as bool?,
      Italic: json['Italic'] as bool?,
      Fsize: json['Fsize'] as int?,
      Visible: json['Visible'] as bool?,
    );

Map<String, dynamic> _$TemplateTextToJson(TemplateText instance) =>
    <String, dynamic>{
      'align': instance.align,
      'X': instance.X,
      'Y': instance.Y,
      'Bold': instance.Bold,
      'Italic': instance.Italic,
      'Fsize': instance.Fsize,
      'Visible': instance.Visible,
    };

TemplateHierarchy _$TemplateHierarchyFromJson(Map<String, dynamic> json) =>
    TemplateHierarchy(
      card: json['card'] == null
          ? null
          : TemplateCard.fromJson(json['card'] as Map<String, dynamic>),
      fullname: json['fullname'] == null
          ? null
          : TemplateText.fromJson(json['fullname'] as Map<String, dynamic>),
      title1: json['title1'] == null
          ? null
          : TemplateText.fromJson(json['title1'] as Map<String, dynamic>),
      title2: json['title2'] == null
          ? null
          : TemplateText.fromJson(json['title2'] as Map<String, dynamic>),
      department: json['department'] == null
          ? null
          : TemplateText.fromJson(json['department'] as Map<String, dynamic>),
      companyName: json['companyName'] == null
          ? null
          : TemplateText.fromJson(json['companyName'] as Map<String, dynamic>),
      address1: json['address1'] == null
          ? null
          : TemplateText.fromJson(json['address1'] as Map<String, dynamic>),
      address2: json['address2'] == null
          ? null
          : TemplateText.fromJson(json['address2'] as Map<String, dynamic>),
      address3: json['address3'] == null
          ? null
          : TemplateText.fromJson(json['address3'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : TemplateText.fromJson(json['district'] as Map<String, dynamic>),
      zipcode: json['zipcode'] == null
          ? null
          : TemplateText.fromJson(json['zipcode'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : TemplateText.fromJson(json['city'] as Map<String, dynamic>),
      country: json['country'] == null
          ? null
          : TemplateText.fromJson(json['country'] as Map<String, dynamic>),
      email: json['email'] == null
          ? null
          : TemplateText.fromJson(json['email'] as Map<String, dynamic>),
      webaddress: json['webaddress'] == null
          ? null
          : TemplateText.fromJson(json['webaddress'] as Map<String, dynamic>),
      t1: json['t1'] == null
          ? null
          : TemplateText.fromJson(json['t1'] as Map<String, dynamic>),
      t2: json['t2'] == null
          ? null
          : TemplateText.fromJson(json['t2'] as Map<String, dynamic>),
      m1: json['m1'] == null
          ? null
          : TemplateText.fromJson(json['m1'] as Map<String, dynamic>),
      m2: json['m2'] == null
          ? null
          : TemplateText.fromJson(json['m2'] as Map<String, dynamic>),
      f: json['f'] == null
          ? null
          : TemplateText.fromJson(json['f'] as Map<String, dynamic>),
      logo1: json['logo1'] == null
          ? null
          : Logo.fromJson(json['logo1'] as Map<String, dynamic>),
      logo2: json['logo2'] == null
          ? null
          : Logo.fromJson(json['logo2'] as Map<String, dynamic>),
      logo3: json['logo3'] == null
          ? null
          : Logo.fromJson(json['logo3'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemplateHierarchyToJson(TemplateHierarchy instance) =>
    <String, dynamic>{
      'card': instance.card?.toJson(),
      'fullname': instance.fullname?.toJson(),
      'title1': instance.title1?.toJson(),
      'title2': instance.title2?.toJson(),
      'department': instance.department?.toJson(),
      'companyName': instance.companyName?.toJson(),
      'address1': instance.address1?.toJson(),
      'address2': instance.address2?.toJson(),
      'address3': instance.address3?.toJson(),
      'district': instance.district?.toJson(),
      'zipcode': instance.zipcode?.toJson(),
      'city': instance.city?.toJson(),
      'country': instance.country?.toJson(),
      'email': instance.email?.toJson(),
      'webaddress': instance.webaddress?.toJson(),
      't1': instance.t1?.toJson(),
      't2': instance.t2?.toJson(),
      'm1': instance.m1?.toJson(),
      'm2': instance.m2?.toJson(),
      'f': instance.f?.toJson(),
      'logo1': instance.logo1?.toJson(),
      'logo2': instance.logo2?.toJson(),
      'logo3': instance.logo3?.toJson(),
    };

Logo _$LogoFromJson(Map<String, dynamic> json) => Logo(
      align: json['align'] as String?,
      X: json['X'] as int?,
      Y: json['Y'] as int?,
      H: json['H'] as int?,
      W: json['W'] as int?,
      Visible: json['Visible'] as bool?,
    );

Map<String, dynamic> _$LogoToJson(Logo instance) => <String, dynamic>{
      'align': instance.align,
      'X': instance.X,
      'Y': instance.Y,
      'H': instance.H,
      'W': instance.W,
      'Visible': instance.Visible,
    };
