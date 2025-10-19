extends Node2D

@export var char_stats: stats:
	set(value):
		char_stats = value

#These variables are declared because they can be manipulated during gameplay
var current_health: int = 0
var current_movement: int = 0
var current_initiative: int = 0

#This holds the status conditions currently affecting this character
var conditions = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_health()
	reset_movement()
	reset_initiative()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#This function checks if an attack hits or not
	#If True: The attack hits
	#If False: The attack misses
func evasion_check(attack_bonus) -> bool:
	var rand_roll = randi_range(1,100)
	if (rand_roll + attack_bonus) < char_stats.evasion:
		return false
	else:
		return true

#This function checks if burn is successfully inflicted
	#If True: The status hits
	#If False: The status is resisted
func burn_status_resist_check(status_bonus) -> bool:
	var rand_roll = randi_range(1,100)
	if (rand_roll + status_bonus) < char_stats.burn_status_resist:
		return false
	else:
		return true
#This function checks if poison is successfully inflicted
	#If True: The status hits
	#If False: The status is resisted
func poison_status_resist_check(status_bonus) -> bool:
	var rand_roll = randi_range(1,100)
	if (rand_roll + status_bonus) < char_stats.poison_status_resist:
		return false
	else:
		return true
#This function checks if a status is successfully inflicted
	#If True: The status hits
	#If False: The status is resisted
func debuff_status_resist_check(status_bonus) -> bool:
	var rand_roll = randi_range(1,100)
	if (rand_roll + status_bonus) < char_stats.debuff_status_resist:
		return false
	else:
		return true
#This function will be called when the character is attacked
#Leave room for inflicting status conditions
func receive_attack(attack_bonus, damage) -> void:
	if(evasion_check(attack_bonus)):
		var dealt_damage = (damage - char_stats.armor)
		if dealt_damage <= 0:
			dealt_damage = 1
		current_health -= dealt_damage
func roll_initiative() -> void:
	current_initiative = char_stats.speed + randi_range(1,6)
func reset_health() -> void:
	current_health = char_stats.max_health	
func reset_movement() -> void:
	current_movement = char_stats.movement
func reset_initiative() -> void:
	current_initiative = char_stats.speed

	
