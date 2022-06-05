extends Node
#Player variables


var health = 100
var max_health = 200
var armor = 0
var max_armor = 100
var guns_carried = []
var ammo_pistol = 50
var ammo_rocket = 0
var ammo_shells = 0
var ammo_plasma = 0
var ammo_max_pistol = 200
var ammo_max_rocket = 50
var ammo_max_shells = 100
var ammo_max_plasma = 200

var red_key = false
var blue_key = false
var yellow_key = false

func reset():
	var health = 100
	var max_health = 200
	var armor = 0
	var max_armor = 100
	var guns_carried = []
	var ammo_pistol = 50
	var ammo_rocket = 0
	var ammo_shells = 0
	var ammo_plasma = 0
	var ammo_max_pistol = 200
	var ammo_max_rocket = 50
	var ammo_max_shells = 100
	var ammo_max_plasma = 200

func _ready():
	pass
	
func change_health(amount):
	pass
	
func change_armor(amount):
	pass
	
func change_ammo(ammo_type,ammo_amount):
	pass
	
func add_gun(gun):
	pass

	
