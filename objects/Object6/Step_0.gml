// Item pickup logic (check collision with items)
var item = instance_place(x, y, Object6);  // Use the correct object name!

if (item != noone) {
    ds_list_add(inventory, item.object_index);

    // Restore health and food
    global.health += 10; 
    global.food += 40;   

    // Ensure they don't exceed max values
    if (global.health > 100) global.health = 100;
    if (global.food > 100) global.food = 100;

    // Destroy the item after picking it up
    with (item) {
        instance_destroy();
    }
}
