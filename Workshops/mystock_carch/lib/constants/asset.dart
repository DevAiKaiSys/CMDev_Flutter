// class Asset {
//   static const String BASE_IMAGE = 'assets/images';
//   static const String LOGO_IMAGE = '$BASE_IMAGE/logo.png';
// }
class Asset {
  // Define base image directory
  static const String _baseImage = 'assets/images';

  // Concatenate base directory with specific image name
  static const String logoImage = '$_baseImage/logo.png';
}
