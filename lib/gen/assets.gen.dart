/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/copy.png
  AssetGenImage get copy => const AssetGenImage('assets/images/copy.png');

  /// File path: assets/images/ic_bg.webp
  AssetGenImage get icBg => const AssetGenImage('assets/images/ic_bg.webp');

  /// File path: assets/images/ic_bsre.webp
  AssetGenImage get icBsre => const AssetGenImage('assets/images/ic_bsre.webp');

  /// File path: assets/images/ic_certificate.png
  AssetGenImage get icCertificate =>
      const AssetGenImage('assets/images/ic_certificate.png');

  /// File path: assets/images/ic_certification.webp
  AssetGenImage get icCertification =>
      const AssetGenImage('assets/images/ic_certification.webp');

  /// File path: assets/images/ic_chart.webp
  AssetGenImage get icChart =>
      const AssetGenImage('assets/images/ic_chart.webp');

  /// File path: assets/images/ic_document.webp
  AssetGenImage get icDocument =>
      const AssetGenImage('assets/images/ic_document.webp');

  /// File path: assets/images/ic_document_history.webp
  AssetGenImage get icDocumentHistory =>
      const AssetGenImage('assets/images/ic_document_history.webp');

  /// File path: assets/images/ic_logo.webp
  AssetGenImage get icLogo => const AssetGenImage('assets/images/ic_logo.webp');

  /// File path: assets/images/ic_logo_full.webp
  AssetGenImage get icLogoFull =>
      const AssetGenImage('assets/images/ic_logo_full.webp');

  /// File path: assets/images/ic_logo_gto.webp
  AssetGenImage get icLogoGto =>
      const AssetGenImage('assets/images/ic_logo_gto.webp');

  /// File path: assets/images/ic_logo_sso.webp
  AssetGenImage get icLogoSso =>
      const AssetGenImage('assets/images/ic_logo_sso.webp');

  /// File path: assets/images/ic_logo_white.webp
  AssetGenImage get icLogoWhite =>
      const AssetGenImage('assets/images/ic_logo_white.webp');

  /// File path: assets/images/ic_photo_empty.webp
  AssetGenImage get icPhotoEmpty =>
      const AssetGenImage('assets/images/ic_photo_empty.webp');

  /// File path: assets/images/ic_qrcode.webp
  AssetGenImage get icQrcode =>
      const AssetGenImage('assets/images/ic_qrcode.webp');

  /// File path: assets/images/ic_settings.webp
  AssetGenImage get icSettings =>
      const AssetGenImage('assets/images/ic_settings.webp');

  /// File path: assets/images/not-found.png
  AssetGenImage get notFound =>
      const AssetGenImage('assets/images/not-found.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        copy,
        icBg,
        icBsre,
        icCertificate,
        icCertification,
        icChart,
        icDocument,
        icDocumentHistory,
        icLogo,
        icLogoFull,
        icLogoGto,
        icLogoSso,
        icLogoWhite,
        icPhotoEmpty,
        icQrcode,
        icSettings,
        notFound
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
