extends Node

var current_state = ""
@export var player_characters = []
@export var enemy_characters = []
var turn_order = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_state = "Pre-Combat"
	player_characters = get_tree().get_nodes_in_group("Player")
	enemy_characters = get_tree().get_nodes_in_group("Enemy")
	print("test")
	print(player_characters)
	print(enemy_characters)
	
	
	#function to place the chosen 4 party members
	#function to place the enemy combatants


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if enemy_characters.is_empty():
		current_state = "Victory"
	
	match current_state:
		"Pre-Combat":
			preCombat()
		"Turn":
			pass
		"Round End":
			pass

func preCombat():
	#These for loops cause the players and enemies to roll initiative
		#Then throws them into the initiative order array
	for n in player_characters:
		if n.has_method("roll_initiative"):
			n.roll_initiative()
		turn_order.append(n)
	for n in enemy_characters:
		if n.has_method("roll_initiative"):
			n.roll_initiative()
		turn_order.append(n)
	print(turn_order)
	
	#This performs a quicksort to organize from highest initiative to lowest
	sort_by_initiative(turn_order, 0, turn_order.size()-1)
	
	print(turn_order)
	for n in turn_order:
		print(n)
		print(n.current_initiative)
	#Determine starting positions? 
	print("Test")
	current_state = "Turn"	
func sort_by_initiative(array, low, high) -> void:
	#quick sort
	if(low >= high): return
	var pivotPosition = partition(array, low, high)
	sort_by_initiative(array, low, pivotPosition-1)
	sort_by_initiative(array,pivotPosition+1,high)
func partition(array, low, high) -> int:
	var pivot = array[high].current_initiative
	var left = low
	var right = high-1
	while left < right:
		while(array[left].current_initiative > pivot):
			left += 1
		while(array[right].current_initiative < pivot and right > low):
			right -= 1
		if left >= right:
			break
		var temp1 = array[left]
		array[left] = array[right]
		array[right] = temp1
	var temp = array[left]
	array[left] = array[high]
	array[high] = temp
	return left
func turn() -> void:
	#Designate it as someone's turn
		#This would be setting the turn to whoever is on turn_order[0]
	if turn_order[0].player:
		#This is a player controlled character
		#player can move and use an action or they can end their turn early
		pass
	else:
		#This is an enemy
		pass

	
	#end of the turn
		#Trigger end of turn effects
	#If the current turn has lower initiative than the next turn
		#This means this character is the last in the round	
	if turn_order[0].current_initiative < turn_order[1].current_initiative:
		current_state = "Round End"
	
	#This takes the current turn and puts them at the back of the array
	turn_order.append(turn_order.pop_front())
	pass
func round_end() -> void:
	
	pass
