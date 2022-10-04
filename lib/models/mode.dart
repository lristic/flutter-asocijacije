class Mode {
  final int firstRound; // s in 1st round (30 or 60)
  final int secondRound; // s in 2nd round (30 or 60)
  final int thirdRound; // s in 3rd round (60 or 90)
  final String modeName; // name of the mode

  Mode({
    this.firstRound,
    this.secondRound,
    this.thirdRound,
    this.modeName,
  });
}
