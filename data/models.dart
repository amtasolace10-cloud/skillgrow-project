class Skill {
  const Skill(this.name, this.level, this.xp, this.progress);
  final String name, level;
  final int xp;
  final double progress;
}

class Challenge {
  const Challenge(this.title, this.xp);
  final String title;
  final int xp;
}

class AchievementBadge {
  const AchievementBadge(this.name, this.unlocked);
  final String name;
  final bool unlocked;
}

class Learner {
  const Learner(this.name, this.level, this.xp);
  final String name, level;
  final int xp;
}
