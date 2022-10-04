// class used to control the game

class Master {
  int roundToPlay; // which round should be played
  int teamToPlay; // which team's turn it is to play
  int numOfTeams; // number of teams
  int numOfPlayers; // number of players
  int modePlaying;

  Master({
    this.roundToPlay = 1,
    this.teamToPlay = 1,
    this.numOfTeams,
    this.numOfPlayers,
    this.modePlaying,
  });

  Map<String, dynamic> toJson() => {
        "roundToPlay": roundToPlay,
        "teamToPlay": teamToPlay,
        "numOfTeams": numOfTeams,
        "numOfPlayers": numOfPlayers,
        "modePlaying": modePlaying,
      };

  String toString() {
    return this.roundToPlay.toString() +
        ", " +
        this.teamToPlay.toString() +
        ", " +
        this.numOfTeams.toString() +
        ", " +
        this.numOfPlayers.toString();
  }

  Master.fromJson(Map<String, dynamic> json)
      : roundToPlay = json['roundToPlay'],
        teamToPlay = json['teamToPlay'],
        numOfTeams = json['numOfTeams'],
        numOfPlayers = json['numOfPlayers'],
        modePlaying = json['modePlaying'];
}
