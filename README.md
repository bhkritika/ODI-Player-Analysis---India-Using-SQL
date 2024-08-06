# ODI Player Analysis - India Using SQL

## Overview

This project involves comprehensive analysis of One Day International (ODI) cricket players from India. The dataset contains detailed statistics on various performance metrics of ODI players, including matches played, runs scored, wickets taken, and more. The project aims to provide insights into player performances, trends, and comparisons.

## Dataset

The dataset used in this project is named `ListODPlayersIndia`. It includes the following columns:

- `sno`: Serial Number
- `Player_Name`: Name of the player
- `First_Match`: Date of the first match
- `Last_Match`: Date of the last match
- `Matches_Played`: Number of matches played
- `Innings`: Number of innings played
- `NotOuts`: Number of not outs
- `Runs`: Total runs scored
- `Highest_Score`: Highest score
- `Average`: Batting or bowling average
- `Balls_Bowled`: Number of balls bowled
- `Maiden_Overs`: Number of maiden overs
- `Runs_Given`: Runs given
- `Wickets`: Number of wickets taken
- `Catches`: Number of catches
- `Stumped`: Number of stumpings

## Analysis

The project is divided into three levels of analysis:

### Basic Analysis

1. **Total Number of Players**: Number of unique players in the dataset.
2. **Total Matches Played**: Total matches played across all players.
3. **Total Runs Scored**: Total runs scored by all players.
4. **Total Wickets Taken**: Total wickets taken by all players.
5. **Player with Highest Runs**: Player with the highest runs.
6. **Player with Most Wickets**: Player with the most wickets.
7. **Player with Highest Highest Score**: Player with the highest score.
8. **Player with Most Matches**: Player with the most matches played.
9. **Average Runs per Player**: Average runs scored per player.
10. **Average Wickets per Player**: Average wickets taken per player.
11. **Average Highest Score per Player**: Average highest score per player.
12. **Players with No Runs Recorded**: Players who have not scored any runs.

### Intermediate Analysis

1. **Players with Highest Runs and Wickets**: Players ranked by runs and wickets.
2. **Average Runs and Wickets by Matches Played**: Performance metrics averaged by matches played.
3. **Top Performers by Career Length**: Players ranked by career length and performance.
4. **Correlation Between Runs and Wickets**: Statistical correlation between runs and wickets.
5. **Players with Highest Score and Runs**: Players ranked by highest score and runs.
6. **Players with Most Matches in the Last 5 Years**: Top players by matches played in the last 5 years.
7. **Performance Comparison: Early Career vs. Late Career**: Comparison of performance in early vs. late career.
8. **Top 5 Players by Average Runs per Match**: Players ranked by average runs scored per match.
9. **Top 5 Players by Wickets per Balls Bowled**: Players ranked by wickets per balls bowled.
10. **Players with Most Improvement in Runs Over Time**: Players showing significant improvement in runs.
11. **Players with No Balls Bowled vs. Runs Scored**: Players with no balls bowled and their runs.
12. **Top 10 Players by Average Highest Score per Match**: Players ranked by average highest score per match.

### High-Level Analysis

1. **Correlation Between Runs and Highest Score**: Correlation analysis between runs and highest score.
2. **Impact of Number of Not Outs on Runs**: Analysis of how not outs affect runs scored.
3. **Change in Runs Over Time Based on Career Length**: Change in runs over career length.
4. **Top 10 Players by Improvement in Wickets per Balls Bowled**: Players with the greatest improvement in wickets per balls bowled.
5. **Efficiency Analysis: Runs per Match vs. Balls Bowled per Wicket**: Comparative efficiency analysis.
6. **Top 5 Players by Consistency in Runs Scored**: Players with the most consistent performance.
7. **Performance Metrics Comparison: Top Batsmen vs. Top Bowlers**: Comparative analysis of top batsmen and bowlers.
8. **Impact of Number of Matches on Player Performance**: Analysis of performance based on the number of matches.
9. **Comparison of Average Highest Score Before and After a Certain Date**: Comparative analysis of highest scores before and after a set date.
10. **Top 5 Players with Most Significant Increase in Highest Score Over Time**: Players with the most significant increase in highest score.
11. **Analysis of Players with Consistent Performance Over Time**: Players showing consistent performance over time.

## Setup and Usage

1. **Clone the Repository:**
   ```sh
   git clone https://github.com/yourusername/ODIPlayerAnalysisIndia.git

2. **Install Required Software:**
Ensure you have a SQL database management system (e.g., MySQL, PostgreSQL) installed.

3. **Import the Dataset:**
Import the `ListODPlayersIndia` dataset into your SQL database.

4. **Run SQL Queries:**
Use the provided SQL queries to perform various levels of analysis.