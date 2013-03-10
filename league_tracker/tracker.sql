BEGIN;
CREATE TABLE `tracker_player` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `player_name` varchar(200) NOT NULL
)
;
CREATE TABLE `tracker_team_players` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `team_id` integer NOT NULL,
    `player_id` integer NOT NULL,
    UNIQUE (`team_id`, `player_id`)
)
;
ALTER TABLE `tracker_team_players` ADD CONSTRAINT `player_id_refs_id_7aac4473` FOREIGN KEY (`player_id`) REFERENCES `tracker_player` (`id`);
CREATE TABLE `tracker_team` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `team_name` varchar(200) NOT NULL
)
;
ALTER TABLE `tracker_team_players` ADD CONSTRAINT `team_id_refs_id_90f5e413` FOREIGN KEY (`team_id`) REFERENCES `tracker_team` (`id`);
CREATE TABLE `tracker_league_teams` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `league_id` integer NOT NULL,
    `team_id` integer NOT NULL,
    UNIQUE (`league_id`, `team_id`)
)
;
ALTER TABLE `tracker_league_teams` ADD CONSTRAINT `team_id_refs_id_78b58caf` FOREIGN KEY (`team_id`) REFERENCES `tracker_team` (`id`);
CREATE TABLE `tracker_league` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `league_name` varchar(200) NOT NULL,
    `create_date` datetime NOT NULL
)
;
ALTER TABLE `tracker_league_teams` ADD CONSTRAINT `league_id_refs_id_a4850e58` FOREIGN KEY (`league_id`) REFERENCES `tracker_league` (`id`);
CREATE TABLE `tracker_match_teams` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `match_id` integer NOT NULL,
    `team_id` integer NOT NULL,
    UNIQUE (`match_id`, `team_id`)
)
;
ALTER TABLE `tracker_match_teams` ADD CONSTRAINT `team_id_refs_id_0c6c39c6` FOREIGN KEY (`team_id`) REFERENCES `tracker_team` (`id`);
CREATE TABLE `tracker_match` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY
)
;
ALTER TABLE `tracker_match_teams` ADD CONSTRAINT `match_id_refs_id_3d6dd544` FOREIGN KEY (`match_id`) REFERENCES `tracker_match` (`id`);

COMMIT;
