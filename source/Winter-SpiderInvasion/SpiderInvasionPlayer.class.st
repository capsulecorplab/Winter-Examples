"
I represent the space ship player in the spider invasion scene

Instance variables: 

- loaded

Public API and Key Messages:

- checkCollisions
- fire
- moveLeft
- moveRight
- positionX
- positionY
- reload
- spaceShipSprite
"
Class {
	#name : #SpiderInvasionPlayer,
	#superclass : #GameInteractiveMovableActor,
	#instVars : [
		'loaded'
	],
	#category : #'Winter-SpiderInvasion'
}

{ #category : #'Instance Creation' }
SpiderInvasionPlayer class >> on: aGame [

	^ self new initializeOn: aGame
]

{ #category : #actions }
SpiderInvasionPlayer >> fire [

	loaded
		ifTrue: [ | missilePos |

			loaded := false.
			missilePos := self position - ( 0 @ 1 ).
			game addActor: ( SpiderInvasionMissile atPosition: missilePos of: game tick: 5 )
			]
]

{ #category : #initialization }
SpiderInvasionPlayer >> initializeCollisionShape [

	collisionShape := Square
		ofCenter: (384 "game dimensions x" / 2) @ 672 "game dimensions y" - (48@48)
		extent: 48@48 "game spriteSize"
		color: Color red
]

{ #category : #initialization }
SpiderInvasionPlayer >> initializeOn: aGame [

	game := aGame.
	sprite := self spaceShipSprite.
	loaded := true
]

{ #category : #Moving }
SpiderInvasionPlayer >> moveLeft [

	| newX |

	newX := (self positionX - 24)  max: 0.
	collisionShape position: newX @ self positionY
]

{ #category : #Moving }
SpiderInvasionPlayer >> moveRight [

	| newX |

	newX := self positionX + 24 min: 336.
	collisionShape position: newX @ self positionY
]

{ #category : #Accessing }
SpiderInvasionPlayer >> positionX [

	^ self position x
]

{ #category : #Accessing }
SpiderInvasionPlayer >> positionY [

	^ self position y
]

{ #category : #actions }
SpiderInvasionPlayer >> reload [

	loaded := true.
]

{ #category : #Accessing }
SpiderInvasionPlayer >> spaceShipSprite [

	^game assetsManager  assetNamed: #spaceShip
]
