:- encoding(utf8).

:- dynamic i_am_at/2, at/3, holding/1, hole_dug/2, dead/0,
           missile_exposed/0, won/0.

% --- REQUIREMENT 5: 50% OF BIOMES ---

i_am_at(8, 1).


biome(0,0,sea).       biome(1,0,sea).       biome(2,0,sea).       biome(3,0,beach).     biome(4,0,beach).
biome(5,0,beach).     biome(6,0,meadow).    biome(7,0,meadow).    biome(8,0,meadow).    biome(9,0,beach).
biome(10,0,beach).    biome(11,0,sea).      biome(12,0,sea).      biome(13,0,sea).      biome(14,0,sea).

biome(0,1,sea).       biome(1,1,sea).       biome(2,1,beach).     biome(3,1,meadow).    biome(4,1,meadow).
biome(5,1,meadow).    biome(6,1,meadow).    biome(7,1,meadow).    biome(8,1,meadow).    biome(9,1,meadow).
biome(10,1,meadow).   biome(11,1,beach).    biome(12,1,beach).    biome(13,1,sea).      biome(14,1,sea).

biome(0,2,sea).       biome(1,2,beach).     biome(2,2,meadow).    biome(3,2,meadow).    biome(4,2,meadow).
biome(5,2,rocks).     biome(6,2,rocks).     biome(7,2,meadow).    biome(8,2,meadow).    biome(9,2,meadow).
biome(10,2,meadow).   biome(11,2,beach).    biome(12,2,sea).      biome(13,2,sea).      biome(14,2,sea).

biome(0,3,sea).       biome(1,3,beach).     biome(2,3,meadow).    biome(3,3,meadow).    biome(4,3,rocks).
biome(5,3,rocks).     biome(6,3,rocks).     biome(7,3,rocks).     biome(8,3,meadow).    biome(9,3,meadow).
biome(10,3,rocks).    biome(11,3,beach).    biome(12,3,beach).    biome(13,3,sea).      biome(14,3,sea).

biome(0,4,sea).       biome(1,4,beach).     biome(2,4,beach).     biome(3,4,meadow).    biome(4,4,meadow).
biome(5,4,rocks).     biome(6,4,rocks).     biome(7,4,rocks).     biome(8,4,rocks).     biome(9,4,rocks).
biome(10,4,rocks).    biome(11,4,rocks).    biome(12,4,beach).    biome(13,4,sea).      biome(14,4,sea).

biome(0,5,sea).       biome(1,5,sea).       biome(2,5,beach).     biome(3,5,meadow).    biome(4,5,meadow).
biome(5,5,meadow).    biome(6,5,rocks).     biome(7,5,forest).    biome(8,5,forest).    biome(9,5,forest).
biome(10,5,rocks).    biome(11,5,rocks).    biome(12,5,beach).    biome(13,5,sea).      biome(14,5,sea).

biome(0,6,sea).       biome(1,6,sea).       biome(2,6,beach).     biome(3,6,meadow).    biome(4,6,meadow).
biome(5,6,rocks).     biome(6,6,rocks).     biome(7,6,forest).    biome(8,6,forest).    biome(9,6,forest).
biome(10,6,forest).   biome(11,6,rocks).    biome(12,6,beach).    biome(13,6,sea).      biome(14,6,sea).

biome(0,7,sea).       biome(1,7,beach).     biome(2,7,beach).     biome(3,7,meadow).    biome(4,7,meadow).
biome(5,7,rocks).     biome(6,7,forest).    biome(7,7,forest).    biome(8,7,forest).    biome(9,7,forest).
biome(10,7,forest).   biome(11,7,forest).   biome(12,7,beach).    biome(13,7,beach).    biome(14,7,sea).

biome(0,8,sea).       biome(1,8,beach).     biome(2,8,meadow).    biome(3,8,meadow).    biome(4,8,rocks).
biome(5,8,rocks).     biome(6,8,forest).    biome(7,8,forest).    biome(8,8,forest).    biome(9,8,forest).
biome(10,8,forest).   biome(11,8,forest).   biome(12,8,forest).   biome(13,8,beach).    biome(14,8,sea).

biome(0,9,sea).       biome(1,9,beach).     biome(2,9,meadow).    biome(3,9,meadow).    biome(4,9,rocks).
biome(5,9,minefield). biome(6,9,minefield). biome(7,9,forest).    biome(8,9,forest).    biome(9,9,forest).
biome(10,9,forest).   biome(11,9,forest).   biome(12,9,forest).   biome(13,9,beach).    biome(14,9,sea).

biome(0,10,sea).      biome(1,10,beach).    biome(2,10,meadow).   biome(3,10,meadow).   biome(4,10,meadow).
biome(5,10,minefield). biome(6,10,minefield). biome(7,10,rocks).    biome(8,10,forest).   biome(9,10,forest).
biome(10,10,forest).  biome(11,10,forest).  biome(12,10,beach).   biome(13,10,beach).   biome(14,10,sea).

biome(0,11,sea).      biome(1,11,beach).    biome(2,11,beach).    biome(3,11,meadow).   biome(4,11,meadow).
biome(5,11,meadow).   biome(6,11,rocks).    biome(7,11,rocks).    biome(8,11,rocks).    biome(9,11,forest).
biome(10,11,forest).  biome(11,11,beach).   biome(12,11,beach).   biome(13,11,sea).     biome(14,11,sea).

biome(0,12,sea).      biome(1,12,sea).      biome(2,12,beach).    biome(3,12,meadow).   biome(4,12,meadow).
biome(5,12,meadow).   biome(6,12,meadow).   biome(7,12,rocks).    biome(8,12,rocks).    biome(9,12,rocks).
biome(10,12,beach).   biome(11,12,beach).   biome(12,12,sea).     biome(13,12,sea).     biome(14,12,sea).

biome(0,13,sea).      biome(1,13,sea).      biome(2,13,sea).      biome(3,13,beach).    biome(4,13,minefield).
biome(5,13,minefield). biome(6,13,minefield). biome(7,13,minefield). biome(8,13,minefield). biome(9,13,minefield).
biome(10,13,beach).   biome(11,13,sea).     biome(12,13,sea).     biome(13,13,sea).     biome(14,13,sea).

biome(0,14,sea).      biome(1,14,sea).      biome(2,14,sea).      biome(3,14,sea).      biome(4,14,beach).
biome(5,14,beach).    biome(6,14,beach).    biome(7,14,beach).    biome(8,14,beach).    biome(9,14,beach).
biome(10,14,sea).     biome(11,14,sea).     biome(12,14,sea).     biome(13,14,sea).     biome(14,14,sea).

% --- ITEM LOCATIONS: at(Item, X, Y) ---

at(compass, 8, 1).
at(map_fragment, 5, 0).
at(mine_detector, 6, 4).
at(shovel, 2, 7).
at(stick, 10, 7).
at(wire_cutters, 7, 14).

% --- DICTIONARY (English with Polish original in parentheses) ---

item_name(compass,       'compass (kompas)').
item_name(map_fragment,  'map fragment (fragment mapy)').
item_name(mine_detector,      'mine detector (wykrywacz min)').
item_name(shovel,        'shovel (lopata)').
item_name(stick,         'stick (patyk)').
item_name(wire_cutters,  'wire cutters (obcegi)').

biome_name(meadow,    'Meadow (Laka)').
biome_name(forest,    'Forest (Las)').
biome_name(beach,     'Beach/Dunes (Wydmy)').
biome_name(rocks,     'Rocks (Skaly)').
biome_name(sea,       'Sea (Morze)').
biome_name(minefield, 'Minefield (Pole Minowe)').

% --- STORYLINE: missile location and intro ---

missile_location(8, 10).

intro :-
    write('================================================================'), nl,
    write('                   PUSZKA PANDORY'), nl,
    write('================================================================'), nl,
    write('You wake up on a remote island. Your memory is hazy, but you'), nl,
    write('recall fragments: the island holds a hidden missile'), nl,
    write('called "Puszka Pandory" (Pandora''s Box). If the timer expires,'), nl,
    write('the missile launches and the world burns.'), nl, nl,
    write('Your mission: find the missile, expose it, and deactivate it'), nl,
    write('before it is too late. Explore the island. Gather every tool'), nl,
    write('you can find. The minefields are deadly without protection.'), nl,
    write('================================================================'), nl, nl.

% --- REQUIREMENT 1: MOVING AROUND THE WORLD ---

n :- go(n).
s :- go(s).
e :- go(e).
w :- go(w).

delta(n,  0, -1).
delta(s,  0,  1).
delta(e,  1,  0).
delta(w, -1,  0).

% EXTRA FEATURE: Win and Death State Logic

go(_) :-
    won, !,
    write('You have already won the game. Type restart. to play again.'), nl.
go(_) :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.

go(Direction) :-
    i_am_at(X, Y),
    delta(Direction, DX, DY),
    NX is X + DX,
    NY is Y + DY,
    biome(NX, NY, sea), !,
    write('That way is the open sea. Use swim(Direction) instead of walking.'), nl.

go(Direction) :-
    i_am_at(X, Y),
    delta(Direction, DX, DY),
    NX is X + DX,
    NY is Y + DY,
    biome(NX, NY, minefield),
    \+ holding(mine_detector), !,
    write('BOOM! You stepped on a hidden mine in the Minefield (Pole Minowe)!'), nl,
    write('*** YOU HAVE DIED ***'), nl,
    die.

go(Direction) :-
    i_am_at(X, Y),
    delta(Direction, DX, DY),
    NX is X + DX,
    NY is Y + DY,
    biome(NX, NY, _),
    retract(i_am_at(_, _)),
    asserta(i_am_at(NX, NY)),
    look, !.

go(_) :-
    write('You cannot walk that way.'), nl.

die :-
    assertz(dead),
    retractall(i_am_at(_, _)),
    write('Game Over. Type restart. to play again.'), nl.

% EXTRA FEATURE: Restart

restart :-
    retractall(i_am_at(_, _)),
    retractall(at(_, _, _)),
    retractall(holding(_)),
    retractall(hole_dug(_, _)),
    retractall(dead),
    retractall(missile_exposed),
    retractall(won),
    assertz(i_am_at(8, 1)),
    assertz(at(compass, 8, 1)),
    assertz(at(map_fragment, 5, 0)),
    assertz(at(mine_detector, 6, 4)),
    assertz(at(shovel, 2, 7)),
    assertz(at(stick, 10, 7)),
    assertz(at(wire_cutters, 7, 14)),
    start.


swim(_) :-
    won, !,
    write('You have already won the game. Type restart. to play again.'), nl.
swim(_) :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.

swim(Direction) :-
    i_am_at(X, Y),
    delta(Direction, DX, DY),
    NX is X + DX,
    NY is Y + DY,
    biome(X, Y, Here),
    biome(NX, NY, There),
    can_swim(Here, There), !,
    retract(i_am_at(_, _)),
    asserta(i_am_at(NX, NY)),
    write('You swim through the water...'), nl,
    look.

swim(_) :-
    write('You cannot swim that way. Swimming connects sea tiles, or a coast (beach/rocks) and the sea.'), nl.

can_swim(sea, sea).
can_swim(sea, beach).
can_swim(sea, rocks).
can_swim(beach, sea).
can_swim(rocks, sea).

% --- REQUIREMENT 2: LOOKING AROUND ---

look :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.
look :-
    i_am_at(X, Y),
    biome(X, Y, B),
    describe(B, X, Y),
    nl,
    notice_objects_at(X, Y),
    notice_missile(X, Y),
    nl.

describe(meadow, _, _) :-
    write('You are in a bright, green Meadow (Laka).').
describe(forest, _, _) :-
    write('You are surrounded by dark trees in the Forest (Las).').
describe(rocks, _, _) :-
    write('You are standing on steep, jagged Rocks (Skaly).').
describe(sea, _, _) :-
    write('You are swimming in the cold Sea (Morze).').
describe(minefield, _, _) :-
    write('You are standing in a highly dangerous Minefield (Pole Minowe).'), nl,
    write('Good thing you have the mine detector (wykrywacz min), or you would be dead!').
describe(beach, X, Y) :-
    write('You are standing on sandy Beach/Dunes (Wydmy).'),
    (hole_dug(X, Y) -> write(' There is a deep hole dug in the sand here.') ; true).

notice_objects_at(X, Y) :-
    at(Item, X, Y),
    item_name(Item, PrintName),
    write('There is a '), write(PrintName), write(' here.'), nl,
    fail.
notice_objects_at(_, _).

notice_missile(X, Y) :-
    missile_location(MX, MY),
    X = MX, Y = MY,
    missile_exposed, !,
    write('The exposed missile - Puszka Pandory - sits in the freshly dug pit,'), nl,
    write('its casing pried open. Wires snake toward a small detonator.'), nl.
notice_missile(X, Y) :-
    missile_location(MX, MY),
    X = MX, Y = MY, !,
    write('The ground here feels strangely metallic underfoot. Something is buried.'), nl.
notice_missile(_, _).

% EXTRA FEATURE: where command (compass-gated)
where :-
    won, !,
    write('You have already won the game. Type restart. to play again.'), nl.
where :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.
where :-
    \+ holding(compass), !,
    write('Without the compass (kompas), you have no way of telling where you are.'), nl.
where :-
    i_am_at(X, Y),
    biome(X, Y, B),
    biome_name(B, BName),
    write('You are at coordinates ('), write(X), write(', '), write(Y),
    write('), in the '), write(BName), write('.'), nl.

% --- REQUIREMENT 3: INVENTORY MANAGEMENT ---

take(_) :-
    won, !,
    write('You have already won the game. Type restart. to play again.'), nl.
take(_) :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.
take(Item) :-
    i_am_at(X, Y),
    at(Item, X, Y),
    retract(at(Item, X, Y)),
    asserta(holding(Item)),
    item_name(Item, PrintName),
    write('You took the '), write(PrintName), write('.'), nl,
    take_hook(Item), !.
take(_) :-
    write('I do not see that here.'), nl.

take_hook(map_fragment) :-
    missile_location(MX, MY),
    write('The fragment is hand-drawn. A red X is marked at coordinates ('),
    write(MX), write(', '), write(MY), write(').'), nl,
    write('Scrawled beside it: "PUSZKA PANDORY - tu zakopana" (Pandora''s Box - buried here).'), nl.
take_hook(_).

drop(_) :-
    won, !,
    write('You have already won the game. Type restart. to play again.'), nl.
drop(_) :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.
drop(Item) :-
    holding(Item),
    i_am_at(X, Y),
    retract(holding(Item)),
    asserta(at(Item, X, Y)),
    item_name(Item, PrintName),
    write('You dropped the '), write(PrintName), write('.'), nl, !.
drop(_) :-
    write('You are not holding that.'), nl.

inventory :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.
inventory :-
    \+ holding(_),
    write('You are not holding anything.'), nl, !.
inventory :-
    write('You are holding:'), nl,
    forall(holding(Item),
           ( item_name(Item, PrintName),
             write('- '), write(PrintName), nl )).

% --- REQUIREMENT 4: PERMANENT WORLD CHANGE ---

use(_) :-
    won, !,
    write('You have already won the game. Type restart. to play again.'), nl.
use(_) :-
    dead, !,
    write('You are dead. Type restart. to play again.'), nl.

use(shovel) :-
    holding(shovel),
    i_am_at(X, Y),
    missile_location(X, Y),
    \+ missile_exposed, !,
    assertz(missile_exposed),
    write('You drive the shovel into the metallic earth and dig furiously.'), nl,
    write('After ten minutes of work, you uncover a steel casing - the missile!'), nl,
    write('Its detonator panel is now exposed. You will need tools to disarm it.'), nl.

use(shovel) :-
    holding(shovel),
    i_am_at(X, Y),
    missile_location(X, Y),
    missile_exposed, !,
    write('The missile is already exposed. You need different tools now.'), nl.

use(shovel) :-
    holding(shovel),
    i_am_at(X, Y),
    biome(X, Y, beach),
    \+ hole_dug(X, Y),
    asserta(hole_dug(X, Y)),
    write('You use the shovel (lopata) to dig a deep hole in the sand.'), nl,
    write('The hole will remain here even if you leave.'), nl, !.
use(shovel) :-
    holding(shovel),
    i_am_at(X, Y),
    biome(X, Y, beach),
    hole_dug(X, Y),
    write('You have already dug a hole here.'), nl, !.
use(shovel) :-
    holding(shovel),
    write('The ground here is not suitable for digging.'), nl, !.

use(stick) :-
    holding(stick),
    holding(wire_cutters),
    i_am_at(X, Y),
    missile_location(X, Y),
    missile_exposed, !,
    write('You wedge the stick (patyk) into the detonator housing to hold the firing pin'), nl,
    write('away from the trigger. With your free hand, you snip the red wire using the'), nl,
    write('wire cutters (obcegi). The countdown freezes. Silence.'), nl, nl,
    write('================================================================'), nl,
    write('*** YOU HAVE DEACTIVATED PUSZKA PANDORY ***'), nl,
    write('You saved the island. You saved everything.'), nl,
    write('Type restart. to play again.'), nl,
    write('================================================================'), nl,
    assertz(won).

use(stick) :-
    holding(stick),
    i_am_at(X, Y),
    missile_location(X, Y),
    missile_exposed,
    \+ holding(wire_cutters), !,
    write('You hold the stick over the detonator, but you have no way to cut the wires.'), nl,
    write('You need wire cutters (obcegi) as well.'), nl.

use(stick) :-
    holding(stick),
    i_am_at(X, Y),
    missile_location(X, Y),
    \+ missile_exposed, !,
    write('You poke the ground with the stick. It strikes something metallic.'), nl,
    write('You should dig here.'), nl.

use(stick) :-
    holding(stick),
    write('You wave the stick around. Nothing happens.'), nl, !.

use(wire_cutters) :-
    holding(wire_cutters),
    i_am_at(X, Y),
    missile_location(X, Y),
    missile_exposed,
    \+ holding(stick), !,
    write('You hold the wire cutters near the detonator, but the firing pin is too close'), nl,
    write('to the trigger. You need something to wedge it back - a stick perhaps.'), nl.

use(wire_cutters) :-
    holding(wire_cutters),
    write('You snip the air. The wire cutters are sharp, but there is nothing useful to cut here.'), nl, !.

use(compass) :-
    holding(compass),
    i_am_at(X, Y),
    biome(X, Y, B),
    biome_name(B, BName),
    write('The compass needle wobbles, then settles. You are in the '), write(BName), write('.'), nl,
    write('Try the where. command for precise coordinates.'), nl, !.

use(map_fragment) :-
    holding(map_fragment),
    missile_location(MX, MY),
    write('You unfold the map fragment. A red X marks coordinates ('),
    write(MX), write(', '), write(MY), write(').'), nl, !.

use(mine_detector) :-
    holding(mine_detector),
    i_am_at(X, Y),
    minefield_nearby(X, Y), !,
    write('The mine detector beeps urgently! There is a minefield within one step of here.'), nl.
use(mine_detector) :-
    holding(mine_detector),
    write('The mine detector is silent. No mines within one step.'), nl, !.

use(_) :-
    write('You cannot use that here, or you do not have it.'), nl.

minefield_nearby(X, Y) :-
    member((DX, DY), [(0,-1), (0,1), (-1,0), (1,0)]),
    NX is X + DX,
    NY is Y + DY,
    biome(NX, NY, minefield).

start :-
    intro,
    write('=== PUSZKA PANDORY ==='), nl,
    write('Commands: n, s, e, w, swim(Direction), take(Item), drop(Item), use(Item),'), nl,
    write('          inventory, look, where, restart.'), nl,
    write('Items: compass, map_fragment, mine_detector, shovel, stick, wire_cutters.'), nl,
    write('Remember to type a period (.) after your commands in Prolog!'), nl, nl,
    look.