extends Control

@onready var player_inventory = $PlayerInventory

func setPlayerInventoryData(inventoryData: InventoryData)-> void:
	player_inventory.setInventoryData(inventoryData)
