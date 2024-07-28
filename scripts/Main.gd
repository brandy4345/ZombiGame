extends Node3D

@onready var player = $Player
@onready var inventory_interface = $UI/InventoryInterface

func _ready() -> void:
	inventory_interface.setPlayerInventoryData(player.inventory)
