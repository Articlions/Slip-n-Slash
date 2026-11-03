extends Node

# Signals I MAY or may not need 

signal damaged(amount: int)


# get it sword(slip n) SLASHED!
signal sword_slashed(damage_dealt: int)

# ohh riight we need to also tell when you die 

signal player_died()


signal pause_pressed()


# We:re going to add some vaariables to make this a game manager 

var is_dead: bool
var has_succeded: bool
