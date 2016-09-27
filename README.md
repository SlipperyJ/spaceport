# Spaceport

This is a project for the sole purpose practicing TDD with Ruby and is loosely based on the game Elite Dangerous. 
Spaceport is a system for organising the docking of spaceships at busy spaceports that have a constant traffic of 
eg. large trade ships, medium sized explorer ships and small fighters.   
 
In a brutally violent galaxy, safety and efficiency is key to the prosperity and survival of a spaceport, that's why 
our unrivalled spaceport docking technology should be used by all spaceports that harbor the utmost care for their 
inhabitants and associates. 


### Technologies

* Ruby
* Rspec

### User Stories

As a spaceport traffic controller   
So spaceships can land safely at my spaceport   
I would like to instruct a spaceship to dock

As a spaceport traffic controller   
To ensure a timely docking service and keep traffic constant   
I would like to automatically deny docking requests unless the requesting ship is within 7.5km

As a spaceport traffic controller   
To ensure spaceport safety
I would like to automatically deny docking requests from wanted spaceships

As a spaceport traffic controller   
So planes can take off safely from my airport   
I would like to instruct a spaceship to un-dock

As a spaceport traffic controller   
So I can prevent spaceship accidents and time wasting   
I would like to prevent spaceships from docking when the spaceport is full

As a spaceport traffic controller   
So that I can ensure safe un-dock procedures   
I want to prevent spaceships from docking or un-docking during security alerts

As a spaceport traffic controller   
So that I can ensure safe un-docking procedures   
I want spaceships to only take off from the spaceport they are at

As the system designer   
So that the software can be used for many different spaceports   
I would like a default airport capacity that can be overridden as appropriate

As the system designer   
So that the software can account for variations in spaceport docking pad size   
I would like a default docking pad size that can be overridden as appropriate
 
As a spaceport traffic controller   
So the system is consistent and correctly reports spaceship status and location   
I want to ensure an un-docked spaceship cannot un-dock and cannot be in a spaceport

As a spaceport traffic controller   
So the system is consistent and correctly reports spaceship status and location   
I want to ensure a docked spaceship cannot dock and must be in a spaceport

As a spaceport traffic controller   
So the system is consistent and correctly reports spaceship status and location   
I want to ensure a spaceship that has un-docked from a spaceport is no longer in that spaceport