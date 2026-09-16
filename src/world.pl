:- module(world, [
    biome/3, item_name/2, biome_name/2, can_swim/2, delta/3, missile_location/2
]).

% --- 15x15 WORLD MAP (List of Lists) ---
map_grid([
    [sea, sea, sea, beach, beach, beach, meadow, meadow, meadow, beach, beach, sea, sea, sea, sea],
    [sea, sea, beach, meadow, meadow, meadow, meadow, meadow, meadow, meadow, meadow, beach, beach, sea, sea],
    [sea, beach, meadow, meadow, meadow, rocks, rocks, meadow, meadow, meadow, meadow, beach, sea, sea, sea],
    [sea, beach, meadow, meadow, rocks, rocks, rocks, rocks, meadow, meadow, rocks, beach, beach, sea, sea],
    [sea, beach, beach, meadow, meadow, rocks, rocks, rocks, rocks, rocks, rocks, rocks, beach, sea, sea],
    [sea, sea, beach, meadow, meadow, meadow, rocks, forest, forest, forest, rocks, rocks, beach, sea, sea],
    [sea, sea, beach, meadow, meadow, rocks, rocks, forest, forest, forest, forest, rocks, beach, sea, sea],
    [sea, beach, beach, meadow, meadow, rocks, forest, forest, forest, forest, forest, forest, beach, beach, sea],
    [sea, beach, meadow, meadow, rocks, rocks, forest, forest, forest, forest, forest, forest, forest, beach, sea],
    [sea, beach, meadow, meadow, rocks, minefield, minefield, forest, forest, forest, forest, forest, forest, beach, sea],
    [sea, beach, meadow, meadow, meadow, minefield, minefield, rocks, forest, forest, forest, forest, beach, beach, sea],
    [sea, beach, beach, meadow, meadow, meadow, rocks, rocks, rocks, forest, forest, beach, beach, sea, sea],
    [sea, sea, beach, meadow, meadow, meadow, meadow, rocks, rocks, rocks, beach, beach, sea, sea, sea],
    [sea, sea, sea, beach, minefield, minefield, minefield, minefield, minefield, minefield, beach, sea, sea, sea, sea],
    [sea, sea, sea, sea, beach, beach, beach, beach, beach, beach, sea, sea, sea, sea, sea]
]).

% Dynamically look up the biome from the 2D grid using X and Y coordinates.
% We use nth0/3 which gets the Nth index (starting at 0) from a list.
biome(X, Y, Biome) :-
    map_grid(Grid),
    nth0(Y, Grid, Row),   % Find the correct row (Y)
    nth0(X, Row, Biome).  % Find the correct column (X) within that row

% --- DICTIONARY ---
item_name(compass,       'compass (kompas)').
item_name(map_fragment,  'map fragment (fragment mapy)').
item_name(mine_detector, 'mine detector (wykrywacz min)').
item_name(shovel,        'shovel (lopata)').
item_name(stick,         'stick (patyk)').
item_name(wire_cutters,  'wire cutters (obcegi)').

biome_name(meadow,    'Meadow (Laka)').
biome_name(forest,    'Forest (Las)').
biome_name(beach,     'Beach/Dunes (Wydmy)').
biome_name(rocks,     'Rocks (Skaly)').
biome_name(sea,       'Sea (Morze)').
biome_name(minefield, 'Minefield (Pole Minowe)').

can_swim(sea, sea).
can_swim(sea, beach).
can_swim(sea, rocks).
can_swim(beach, sea).
can_swim(rocks, sea).

delta(n,  0, -1).
delta(s,  0,  1).
delta(e,  1,  0).
delta(w, -1,  0).

missile_location(8, 10).