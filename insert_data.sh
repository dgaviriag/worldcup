#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")#Here I empty the tables before inserting the rows


#teams insertion:

Insertion=$($PSQL "INSERT INTO teams(name) VALUES('England')")#key=1
Insertion2=$($PSQL "INSERT INTO teams(name) VALUES('Colombia')")#key=2
Insertion3=$($PSQL "INSERT INTO teams(name) VALUES('Sweden')")#key=3
Insertion4=$($PSQL "INSERT INTO teams(name) VALUES('Switzerland')")#key=4
Insertion5=$($PSQL "INSERT INTO teams(name) VALUES('Belgium')")#key=5
Insertion6=$($PSQL "INSERT INTO teams(name) VALUES('Japan')")#key=6
Insertion7=$($PSQL "INSERT INTO teams(name) VALUES('Brazil')")#key=7
Insertion8=$($PSQL "INSERT INTO teams(name) VALUES('Mexico')")#key=8
Insertion9=$($PSQL "INSERT INTO teams(name) VALUES('Croatia')")#key=9
Ins8rtion10=$($PSQL "INSERT INTO teams(name) VALUES('Denmark')")#key=10
Insertion11=$($PSQL "INSERT INTO teams(name) VALUES('Russia')")#key=11
Insertion12=$($PSQL "INSERT INTO teams(name) VALUES('Spain')")#key=12
Insertion13=$($PSQL "INSERT INTO teams(name) VALUES('Uruguay')")#key=13
Insertion14=$($PSQL "INSERT INTO teams(name) VALUES('Portugal')")#key=14
Insertion15=$($PSQL "INSERT INTO teams(name) VALUES('France')")#key=15
Insertion16=$($PSQL "INSERT INTO teams(name) VALUES('Argentina')")#key=16
Insertion17=$($PSQL "INSERT INTO teams(name) VALUES('Chile')")#key=17
Insertion18=$($PSQL "INSERT INTO teams(name) VALUES('Nigeria')")#key=18
Insertion19=$($PSQL "INSERT INTO teams(name) VALUES('Germany')")#key=19
Insertion20=$($PSQL "INSERT INTO teams(name) VALUES('Algeria')")#key=20
Insertion21=$($PSQL "INSERT INTO teams(name) VALUES('Netherlands')")#key=21
Insertion22=$($PSQL "INSERT INTO teams(name) VALUES('Costa Rica')")#key=22
Insertion23=$($PSQL "INSERT INTO teams(name) VALUES('Greece')")#key=23
Insertion24=$($PSQL "INSERT INTO teams(name) VALUES('United States')")#key=24
SHOWTEAMS=$($PSQL "SELECT * FROM teams")



#rounds:

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
do

  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  if [[ -n $WINNER_TEAM_ID || -n $OPPONENT_TEAM_ID ]]
  then
    if [[ $YEAR != "year" ]]
    then
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_G, $OPPONENT_G)")
      if [[ INSERT_GAME == "INSERT 0 1" ]]
      then
        echo "Insertion completed! of $YEAR | $ROUND |"
      fi
    fi
  fi
done

#Insertion25=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2018, 'Final', 15, 9, 4, 2)")
#Insertion26=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2018, 'Third Place', 5, 1, 2, 0)")
#Insertion27=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2018, 'Semi-Final', 9, 1, 2, 1)")
#Insertion28=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2018, 'Semi-Final', 15, 5, 1, 0)")
#Insertion29=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Quarter-Final', 9, 11, 3, 2)")
#Insertion30=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Quarter-Final', 1, 3, 2, 0)")
#Insertion31=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Quarter-Final', 5, 7, 2, 1)")
#Insertion32=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Quarter-Final', 15, 13, 2, 0)")
#Insertion33=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 1, 2, 2, 1)")
#Insertion34=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 3, 4, 1, 0)")
#Insertion35=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 5, 6, 3, 2)")
#Insertion36=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 7, 8, 2, 0)")
#Insertion37=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 9, 10, 2, 1)")
#Insertion38=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 11, 12, 2, 1)")
#Insertion39=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 13, 14, 2, 1)")
#Insertion40=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (2018, 'Eighth-Final', 15, 16, 4, 3)")
#Insertion41=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Final', 19, 16, 1, 0)")
#Insertion42=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Third Place', 21, 7, 3, 0)")
#Insertion43=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Semi-Final', 16, 21, 1, 0)")
#Insertion44=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Semi-Final', 19, 7, 7, 1)")
#Insertion45=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Quarter-Final', 21, 22, 1, 0)")
#Insertion46=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Quarter-Final', 16, 5, 1, 0)")
#Insertion47=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Quarter-Final', 7, 2, 2, 1)")
#Insertion48=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Quarter-Final', 19, 15, 1, 0)")
#Insertion49=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 7, 17, 2, 1)")
#Insertion50=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 2, 13, 2, 0)")
#Insertion51=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 15, 18, 2, 0)")
#Insertion52=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 19, 20, 2, 1)")
#Insertion53=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 21, 8, 2, 1)")
#Insertion54=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 22, 23, 2, 1)")
#Insertion55=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 16, 4, 1, 0)")
#Insertion56=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES(2014, 'Eighth-Final', 5, 24, 2, 1)")

SHOWGAMES=$($PSQL "SELECT * FROM games")

echo -e "\nNational Team's name:"
echo -e "\n$SHOWTEAMS"

echo -e "\nRounds:"
echo -e "\n$SHOWGAMES"