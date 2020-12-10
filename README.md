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

## User's Guide

## Conclusions 
