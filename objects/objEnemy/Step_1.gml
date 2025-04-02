if (hp <= 0) {
    // Drop the health/food item at the enemy's position
    instance_create_layer(x, y, "Actors", Food);
    
    // Destroy the enemy instance
    instance_destroy();
}
