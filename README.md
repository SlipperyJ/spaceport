# Spaceport

In a brutal and violent galaxy, safety and efficiency is key to the prosperity and survival of a spaceport, that's why
our unrivalled spaceport docking technology should be used by all spaceports that harbor the utmost care for their
inhabitants and associates.

For the sole purpose practicing TDD with Ruby, I came up with the idea of building a spaceport system loosely based 
on the game elite dangerous. Spaceport is a system for organising the docking of spaceships at busy spaceports that 
have a constant traffic of eg. large trade ships, medium sized explorer ships and small fighters, with the occasional
trouble maker that needs to be dealt with by security forces.

### Technologies

* Ruby
* Rspec

### User Stories

#### Implemented :white_check_mark:
```
As a spaceport traffic controller   
So spaceships can dock safely and efficiently at my spaceport   
I would like to instruct a spaceship to dock   
```

```
As a spaceport traffic controller   
So spaceships can take off safely from my spaceport  
I would like to instruct a spaceship to release from a spaceport   
```

```
As a spaceport traffic controller   
So I can prevent spaceship collisions and time wasting   
I would like to prevent spaceships from docking when the spaceport is full
```

```
As a spaceport traffic controller   
So that I can ensure safe release procedures   
I want to prevent spaceships from docking or releasing during security alerts
```
```
As a spaceport traffic controller   
So that I can ensure safe releasing procedures   
I want spaceships to only take off from the spaceport they are at
```
```
As the system designer   
So that the software can be used for many different spaceports   
I would like a default spaceport capacity that can be overridden as appropriate
```
```
As a spaceport traffic controller   
So the system is consistent and correctly reports spaceship status and location   
I want to ensure a released spaceship cannot release and cannot be in a spaceport
```
```
As a spaceport traffic controller   
So the system is consistent and correctly reports spaceship status and location   
I want to ensure a docked spaceship cannot dock and must be in a spaceport
```
```
As a spaceport traffic controller   
So the system is consistent and correctly reports spaceship status and location   
I want to ensure a spaceship that has released from a spaceport is no longer in that spaceport
```

#### Yet to be implemented



As a spaceport traffic controller   
To ensure spaceport safety
I would like to automatically deny docking requests from wanted spaceships

As a spaceport traffic controller   
To ensure a timely docking service and keep traffic constant   
I would like to automatically deny docking requests unless the requesting ship is within 7.5km
