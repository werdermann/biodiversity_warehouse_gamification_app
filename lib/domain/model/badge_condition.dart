/// Badge conditions contain the title, condition, unlocked text and image path
/// of a badge.
enum BadgeCondition {
  oneSightingReported(
    title: 'BADGE_DESCRIPTIONS.ONE_SIGHTING_REPORTED.TITLE',
    condition: 'BADGE_DESCRIPTIONS.ONE_SIGHTING_REPORTED.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.ONE_SIGHTING_REPORTED.UNLOCKED',
    imagePath: 'assets/badges/report_level_1.png',
  ),
  fiveSightingsReported(
    title: 'BADGE_DESCRIPTIONS.FIVE_SIGHTINGS_REPORTED.TITLE',
    condition: 'BADGE_DESCRIPTIONS.FIVE_SIGHTINGS_REPORTED.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.FIVE_SIGHTINGS_REPORTED.UNLOCKED',
    imagePath: 'assets/badges/report_level_2.png',
  ),
  tenSightingsReported(
    title: 'BADGE_DESCRIPTIONS.TEN_SIGHTINGS_REPORTED.TITLE',
    condition: 'BADGE_DESCRIPTIONS.TEN_SIGHTINGS_REPORTED.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.TEN_SIGHTINGS_REPORTED.UNLOCKED',
    imagePath: 'assets/badges/report_level_3.png',
  ),
  twentySightingsReported(
    title: 'BADGE_DESCRIPTIONS.TWENTY_SIGHTINGS_REPORTED.TITLE',
    condition: 'BADGE_DESCRIPTIONS.TWENTY_SIGHTINGS_REPORTED.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.TWENTY_SIGHTINGS_REPORTED.UNLOCKED',
    imagePath: 'assets/badges/report_level_4.png',
  ),
  oneImageUploaded(
    title: 'BADGE_DESCRIPTIONS.ONE_PHOTO_TAKEN.TITLE',
    condition: 'BADGE_DESCRIPTIONS.ONE_PHOTO_TAKEN.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.ONE_PHOTO_TAKEN.UNLOCKED',
    imagePath: 'assets/badges/camera_level_1.png',
  ),
  fiveImagesUploaded(
    title: 'BADGE_DESCRIPTIONS.FIVE_PHOTOS_TAKEN.TITLE',
    condition: 'BADGE_DESCRIPTIONS.FIVE_PHOTOS_TAKEN.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.FIVE_PHOTOS_TAKEN.UNLOCKED',
    imagePath: 'assets/badges/camera_level_2.png',
  ),
  tenImagesUploaded(
    title: 'BADGE_DESCRIPTIONS.TEN_PHOTOS_TAKEN.TITLE',
    condition: 'BADGE_DESCRIPTIONS.TEN_PHOTOS_TAKEN.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.TEN_PHOTOS_TAKEN.UNLOCKED',
    imagePath: 'assets/badges/camera_level_3.png',
  ),
  twentyImagesUploaded(
    title: 'BADGE_DESCRIPTIONS.TWENTY_PHOTOS_TAKEN.TITLE',
    condition: 'BADGE_DESCRIPTIONS.TWENTY_PHOTOS_TAKEN.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.TWENTY_PHOTOS_TAKEN.UNLOCKED',
    imagePath: 'assets/badges/camera_level_4.png',
  ),
  oneCommentWritten(
    title: 'BADGE_DESCRIPTIONS.ONE_COMMENT_WRITTEN.TITLE',
    condition: 'BADGE_DESCRIPTIONS.ONE_COMMENT_WRITTEN.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.ONE_COMMENT_WRITTEN.UNLOCKED',
    imagePath: 'assets/badges/comment_level_1.png',
  ),
  fiveCommentsWritten(
    title: 'BADGE_DESCRIPTIONS.FIVE_COMMENTS_REPORTED.TITLE',
    condition: 'BADGE_DESCRIPTIONS.FIVE_COMMENTS_REPORTED.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.FIVE_COMMENTS_REPORTED.UNLOCKED',
    imagePath: 'assets/badges/comment_level_2.png',
  ),
  tenCommentsWritten(
    title: 'BADGE_DESCRIPTIONS.TEN_COMMENTS_REPORTED.TITLE',
    condition: 'BADGE_DESCRIPTIONS.TEN_COMMENTS_REPORTED.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.TEN_COMMENTS_REPORTED.UNLOCKED',
    imagePath: 'assets/badges/comment_level_3.png',
  ),
  twentyCommentsWritten(
    title: 'BADGE_DESCRIPTIONS.TWENTY_COMMENTS_REPORTED.TITLE',
    condition: 'BADGE_DESCRIPTIONS.TWENTY_COMMENTS_REPORTED.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.TWENTY_COMMENTS_REPORTED.UNLOCKED',
    imagePath: 'assets/badges/comment_level_4.png',
  ),
  allBadgesUnlocked(
    title: 'BADGE_DESCRIPTIONS.ALL_BADGES.TITLE',
    condition: 'BADGE_DESCRIPTIONS.ALL_BADGES.CONDITION',
    unlockedText: 'BADGE_DESCRIPTIONS.ALL_BADGES.UNLOCKED',
    imagePath: 'assets/badges/all_badges.png',
  );

  const BadgeCondition({
    required this.title,
    required this.condition,
    required this.imagePath,
    required this.unlockedText,
  });

  final String title;

  final String condition;

  final String imagePath;

  final String unlockedText;
}
