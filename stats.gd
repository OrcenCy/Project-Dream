extends Resource
class_name stats

#To make stats for a specific enemy:
	#In the inspector, "Create a new resource in memory and edit it" (Left of the folder icon)
	#Search Stats, this is creating a "stats resouce"
	#In the inspector, fill out the stats
	#In the inspector, Save As. It will be saved as a .tres file.
#To use stats for a specific enemy:
	#example_enemy_1.gd
	#There should be a variable called Char Stats
	#Drag the created .tres file into Char Stats

#Character name that can be used for reference
@export var character_name: String = ""
#The maximum health the character has
@export var max_health: int = 0
#The chance an attack will miss this character
@export var evasion: int = 10
#The chance burn will be resisted
@export var burn_status_resist: int = 30
#The chance poison will be resisted
@export var poison_status_resist: int = 30
#The chance a debuff status will be resisted
@export var debuff_status_resist: int = 30
#The attack stat of a character
@export var damage: int = 1
#Armor reduces damage taken
@export var armor: int = 0
#The movement a character has
@export var movement: int = 5
#The stat+d6 determines initiative
@export var speed: int = 5
#The point value for enemies
@export var point: int = 0
#If this is a player character
@export var player: bool = false
#The sprite of the character
@export var char_texture: Texture
