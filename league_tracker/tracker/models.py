from django.db import models

class Player(models.Model):
    player_name = models.CharField(max_length=200)

class Team(models.Model):
    team_name = models.CharField(max_length=200)
    players = models.ManyToManyField(Player)

class League(models.Model):
    league_name = models.CharField(max_length=200)
    create_date = models.DateTimeField('date created')
    teams = models.ManyToManyField(Team)

class Match(models.Model):
    teams = models.ManyToManyField(Team) 
