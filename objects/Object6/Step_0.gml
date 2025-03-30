// Check if the player is colliding with Object6
var player = instance_place(x, y, PlayerTest);

if (player != noone) {
    // Add food item to player's inventory
    ds_list_add(player.inventory, object_index); // Store object type

    // Destroy the item after adding it to inventory
    instance_destroy();
}
