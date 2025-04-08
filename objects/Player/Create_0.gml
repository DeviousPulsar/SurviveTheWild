// Rendering information
depth = -1;

// Movement varibles
xsp = 0;
ysp = 0;
jump_charge = 0;
fallthrough = false;
hitstun = 0;
lastdir = 0;
attack_cooldown = 0;

// Health system
hp = 100;
max_hp = 100;

// Food system
food = 100;
max_food = 100;

// Initialize player singleton
SetPlayer(self);

// Create inventory list (only once)
inventory = ds_list_create();

// Create charge indicator
instance_create_layer(x, y, "Actors", ChargeInfo);
