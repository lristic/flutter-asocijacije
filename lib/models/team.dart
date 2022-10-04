class Team {
  String player1;
  String player2;
  int score;
  int id;
  int playerExplaining;

  Team(
      {this.player1,
      this.player2,
      this.score,
      this.id,
      this.playerExplaining = 1});

  String get playerNames {
    return this.player1 + ", " + this.player2;
  }

  String toString() {
    return "[" +
        this.player1 +
        ", " +
        this.player2 +
        "]" +
        ": " +
        this.score.toString() +
        " " +
        this.id.toString();
  }

  Map<String, dynamic> toJson() => {
        "player1": player1,
        "player2": player2,
        "score": score,
        "id": id,
        "playerExplaining": playerExplaining,
      };

  Team.fromJson(Map<String, dynamic> json)
      : player1 = json['player1'],
        player2 = json['player2'],
        score = json['score'],
        id = json['id'],
        playerExplaining = json['playerExplaining'];
}
