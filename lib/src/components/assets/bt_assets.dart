import 'package:flutter/material.dart';

import '../../../bimatarung_design_system.dart';

class BTAsset extends StatelessWidget {
  const BTAsset({
    super.key,
    this.type = BTAssetType.logo,
    this.image,
    this.logo,
    this.iconColor,
    this.width,
    this.height,
    required this.fit,
  });

  /// Type of asset you want to display
  /// Default to [BTAssetType.icons]
  final BTAssetType type;

  final BTImages? image;

  final BTLogo? logo;

  final Color? iconColor;

  /// Width of assets
  /// Default to 32
  final double? width;

  /// Height of assets
  /// Default to 32
  final double? height;

  /// How you asset would fit to its parent widget.
  /// Default to [BoxFit.fill]
  final BoxFit fit;

  @override
  Widget build(BuildContext context) => _Child(
        type: type,
        image: image,
        logo: logo,
        fit: fit,
        width: width,
        height: height,
      );
}

class _Child extends StatelessWidget {
  const _Child({
    required this.type,
    this.image,
    this.logo,
    this.width,
    this.height,
    required this.fit,
  });

  final BTAssetType type;
  final BTImages? image;
  final BTLogo? logo;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BTAssetType.logo:
        return Image.asset(
          logo?.path ?? '',
          fit: fit,
          width: width,
          height: height,
          package: 'bimatarung_design_system',
        );
      case BTAssetType.images:
        return Image.asset(
          image?.path ?? '',
          fit: fit,
          height: height,
          width: width,
          package: 'bimatarung_design_system',
        );
    }
  }
}
