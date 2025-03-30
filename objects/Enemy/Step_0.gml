if (enemyHealth <= 0) {
    // Drop the health/food item at the enemy's position
    instance_create_layer(x, y, "Instances", Object6);
    
    // Destroy the enemy instance
    instance_destroy();
}