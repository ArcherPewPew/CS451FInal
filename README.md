# CS451FInal

This is the repo for my final project for CS451 in Fall 20.

Please find the source code for all of the pages here. 

The database is designed to emulate a group of people who play dungeons in dragons in various groups and storylines. Perhaps at a local game store or something.

# Cover Page

## Name: 
Alex Archer

## Project Title: 
Dungeons and Dragons Database

## Connection Information
#port number: 
3502

## hostname: 
ix.cs.uoregon.edu

guest/guest

## database name: 
dnd
  
## project URL: 
https://ix.cs.uoregon.edu/~aarcher/finalhome.php

# Highlights:

* The follow up query from findNumEle.php to findEleSpells.php has a GET operation that I use after storing the variable name in the POST. It is an ok application of a follow up.
* Things are formatted somehwat ok into tables.

Otherwise things are pretty straight forward. I do not do anything too fancy. 

## Summary

This is suppose to be a model of a group of dungeons and dragons players. 

A human plays a Character in a Campaign run by a GameMaster. 
A Campaign has a source book for material which is like a list of rules and encounters.
A Character has a Class which is like an archetype. 
A class has access to a number of spells that have an elemental type. 

Nothing incredibly fancy. The database captures some m-to-m relationships that allow for a class to have multiple spells or for a campaign to have multiple players.

The serice was intially designed to perhaps be something people could add their information to in order to connect with other nerds but for now is useful only for reference of a snapshot in time. 


## Logical Design Model

![model](https://i.imgur.com/rkqethi.png)

## Physical Design Table Descriptions

# Weekdays 
 Used to name weekdays. Has an ID and a name.
# campaign
A campaign has a source book, they meet on a weekday, and have a single game master. 

# Sourcebooks
A sourcebook is sourt of like a list of rules and events for a dungeons and dragons adventure. Kinda on rails. A sourcebook has a title and a difficulty. 

# Gamemaster
This is the king nerd who acs like a processor for dungeons and dragons rules. They have a name and manage oneor more campaigns. 

# campaign_has_character
THis is the result table from the M-M relationship between campaign and characters. Meaning a there are many characters to many campaigns. 

# Player
This represents a human player. They have a name. 

# Character
This represents a player's character. A character has a name and a power level and a class. 

# Class
A class is an archtype like warrior or mage that a character can be. Classes have a name, and some stats associated with them like
hit value, health value and armor value.

# Spell
A spell is an ability in the game. They can be physical or magical. They have an element associated with them. They have an effect and a value of the effect. 

# class_has_spell
This represents the m-m relationship between classes and spells. Many classes can have many spells. 

## User's Guide
Go to https://ix.cs.uoregon.edu/~aarcher/finalhome.php and click around. Might have to go back to finalhome.php a couple of times to see them al..
Please note that the first link has a follow up that is associated with the first query you made. It's a link at the bottom that says "perhaps you like a list of spells..."

The links are titlted with their desired outcome. The queries are also listed. Outputs are spit out into a table. 

## Contents of Tables
See  https://github.com/ArcherPewPew/CS451FInal/blob/main/dnd.sql   

## Implementation of Code

See this github page.

## Conclusions 
I would have liked to have been able to commit to the original idea which was that people could input their group info and have it work. I got bogged down looking into security issues and eventually had to scrap and redesign my table to try and make it more manageable. 
I would have found a tool to populate my tables for me, it took me more time then I want to admit to make sure I got all the tables lining up right. 
I am a novice at php, I wish I would have known about some tools to make the job a bit easier. It was a bit of a journey just to get simple things to work.
I would have liked to explore security issues more that come with letting someones interact with a database. I started that with one of my queries that uses a POST/GET to try and save a variable in the URL. 
