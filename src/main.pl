:- module(main, [
    start/0, restart/0, n/0, s/0, e/0, w/0, swim/1, take/1, drop/1, use/1, inventory/0, look/0, where/0
]).

:- use_module(state).
:- use_module(world).

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

start :-
    state:reset_state,
    intro,
    write('=== PUSZKA PANDORY ==='), nl,
    write('Commands: n, s, e, w, swim(Direction), take(Item), drop(Item), use(Item),'), nl,
    write('          inventory, look, where, restart.'), nl,
    write('Items: compass, map_fragment, mine_detector, shovel, stick, wire_cutters.'), nl,
    write('Remember to type a period (.) after your commands in Prolog!'), nl, nl,
    look.

restart :- start.

n :- go(n).
s :- go(s).
e :- go(e).
w :- go(w).

go(_) :- won, !, write('You have already won the game. Type restart. to play again.'), nl.
go(_) :- dead, !, write('You are dead. Type restart. to play again.'), nl.

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
    retract(state:i_am_at(_, _)),
    asserta(state:i_am_at(NX, NY)),
    look, !.

go(_) :- write('You cannot walk that way.'), nl.

die :-
    assertz(state:dead),
    retractall(state:i_am_at(_, _)),
    write('Game Over. Type restart. to play again.'), nl.

swim(_) :- won, !, write('You have already won the game. Type restart. to play again.'), nl.
swim(_) :- dead, !, write('You are dead. Type restart. to play again.'), nl.

swim(Direction) :-
    i_am_at(X, Y),
    delta(Direction, DX, DY),
    NX is X + DX,
    NY is Y + DY,
    biome(X, Y, Here),
    biome(NX, NY, There),
    can_swim(Here, There), !,
    retract(state:i_am_at(_, _)),
    asserta(state:i_am_at(NX, NY)),
    write('You swim through the water...'), nl,
    look.

swim(_) :- write('You cannot swim that way. Swimming connects sea tiles, or a coast (beach/rocks) and the sea.'), nl.

look :- dead, !, write('You are dead. Type restart. to play again.'), nl.
look :-
    i_am_at(X, Y),
    biome(X, Y, B),
    describe(B, X, Y), nl,
    notice_objects_at(X, Y),
    notice_missile(X, Y), nl.

describe(meadow, _, _) :- write('You are in a bright, green Meadow (Laka).').
describe(forest, _, _) :- write('You are surrounded by dark trees in the Forest (Las).').
describe(rocks, _, _) :- write('You are standing on steep, jagged Rocks (Skaly).').
describe(sea, _, _) :- write('You are swimming in the cold Sea (Morze).').
describe(minefield, _, _) :-
    write('You are standing in a highly dangerous Minefield (Pole Minowe).'), nl,
    write('Good thing you have the mine detector (wykrywacz min), or you would be dead!').
describe(beach, X, Y) :-
    write('You are standing on sandy Beach/Dunes (Wydmy).'),
    (hole_dug(X, Y) -> write(' There is a deep hole dug in the sand here.') ; true).

notice_objects_at(X, Y) :-
    at(Item, X, Y),
    item_name(Item, PrintName),
    write('There is a '), write(PrintName), write(' here.'), nl, fail.
notice_objects_at(_, _).

notice_missile(X, Y) :-
    missile_location(MX, MY), X = MX, Y = MY, missile_exposed, !,
    write('The exposed missile - Puszka Pandory - sits in the freshly dug pit,'), nl,
    write('its casing pried open. Wires snake toward a small detonator.'), nl.
notice_missile(X, Y) :-
    missile_location(MX, MY), X = MX, Y = MY, !,
    write('The ground here feels strangely metallic underfoot. Something is buried.'), nl.
notice_missile(_, _).

where :- won, !, write('You have already won the game. Type restart. to play again.'), nl.
where :- dead, !, write('You are dead. Type restart. to play again.'), nl.
where :- \+ holding(compass), !, write('Without the compass (kompas), you have no way of telling where you are.'), nl.
where :-
    i_am_at(X, Y), biome(X, Y, B), biome_name(B, BName),
    write('You are at coordinates ('), write(X), write(', '), write(Y),
    write('), in the '), write(BName), write('.'), nl.

take(_) :- won, !, write('You have already won the game. Type restart. to play again.'), nl.
take(_) :- dead, !, write('You are dead. Type restart. to play again.'), nl.
take(Item) :-
    i_am_at(X, Y), at(Item, X, Y),
    retract(state:at(Item, X, Y)),
    asserta(state:holding(Item)),
    item_name(Item, PrintName),
    write('You took the '), write(PrintName), write('.'), nl,
    take_hook(Item), !.
take(_) :- write('I do not see that here.'), nl.

take_hook(map_fragment) :-
    missile_location(MX, MY),
    write('The fragment is hand-drawn. A red X is marked at coordinates ('),
    write(MX), write(', '), write(MY), write(').'), nl,
    write('Scrawled beside it: "PUSZKA PANDORY - tu zakopana" (Pandora''s Box - buried here).'), nl.
take_hook(_).

drop(_) :- won, !, write('You have already won the game. Type restart. to play again.'), nl.
drop(_) :- dead, !, write('You are dead. Type restart. to play again.'), nl.
drop(Item) :-
    holding(Item), i_am_at(X, Y),
    retract(state:holding(Item)),
    asserta(state:at(Item, X, Y)),
    item_name(Item, PrintName),
    write('You dropped the '), write(PrintName), write('.'), nl, !.
drop(_) :- write('You are not holding that.'), nl.

inventory :- dead, !, write('You are dead. Type restart. to play again.'), nl.
inventory :- \+ holding(_), write('You are not holding anything.'), nl, !.
inventory :-
    write('You are holding:'), nl,
    forall(holding(Item), (item_name(Item, PrintName), write('- '), write(PrintName), nl)).

use(_) :- won, !, write('You have already won the game. Type restart. to play again.'), nl.
use(_) :- dead, !, write('You are dead. Type restart. to play again.'), nl.
use(shovel) :-
    holding(shovel), i_am_at(X, Y), missile_location(X, Y), \+ missile_exposed, !,
    assertz(state:missile_exposed),
    write('You drive the shovel into the metallic earth and dig furiously.'), nl,
    write('After ten minutes of work, you uncover a steel casing - the missile!'), nl,
    write('Its detonator panel is now exposed. You will need tools to disarm it.'), nl.
use(shovel) :-
    holding(shovel), i_am_at(X, Y), missile_location(X, Y), missile_exposed, !,
    write('The missile is already exposed. You need different tools now.'), nl.
use(shovel) :-
    holding(shovel), i_am_at(X, Y), biome(X, Y, beach), \+ hole_dug(X, Y),
    asserta(state:hole_dug(X, Y)),
    write('You use the shovel (lopata) to dig a deep hole in the sand.'), nl,
    write('The hole will remain here even if you leave.'), nl, !.
use(shovel) :- holding(shovel), i_am_at(X, Y), biome(X, Y, beach), hole_dug(X, Y), write('You have already dug a hole here.'), nl, !.
use(shovel) :- holding(shovel), write('The ground here is not suitable for digging.'), nl, !.

use(stick) :-
    holding(stick), holding(wire_cutters), i_am_at(X, Y), missile_location(X, Y), missile_exposed, !,
    write('You wedge the stick (patyk) into the detonator housing to hold the firing pin'), nl,
    write('away from the trigger. With your free hand, you snip the red wire using the'), nl,
    write('wire cutters (obcegi). The countdown freezes. Silence.'), nl, nl,
    write('================================================================'), nl,
    write('*** YOU HAVE DEACTIVATED PUSZKA PANDORY ***'), nl,
    write('You saved the island. You saved everything.'), nl,
    write('Type restart. to play again.'), nl,
    write('================================================================'), nl,
    assertz(state:won).
use(stick) :-
    holding(stick), i_am_at(X, Y), missile_location(X, Y), missile_exposed, \+ holding(wire_cutters), !,
    write('You hold the stick over the detonator, but you have no way to cut the wires.'), nl,
    write('You need wire cutters (obcegi) as well.'), nl.
use(stick) :-
    holding(stick), i_am_at(X, Y), missile_location(X, Y), \+ missile_exposed, !,
    write('You poke the ground with the stick. It strikes something metallic.'), nl,
    write('You should dig here.'), nl.
use(stick) :- holding(stick), write('You wave the stick around. Nothing happens.'), nl, !.

use(wire_cutters) :-
    holding(wire_cutters), i_am_at(X, Y), missile_location(X, Y), missile_exposed, \+ holding(stick), !,
    write('You hold the wire cutters near the detonator, but the firing pin is too close'), nl,
    write('to the trigger. You need something to wedge it back - a stick perhaps.'), nl.
use(wire_cutters) :- holding(wire_cutters), write('You snip the air. The wire cutters are sharp, but there is nothing useful to cut here.'), nl, !.

use(compass) :-
    holding(compass), i_am_at(X, Y), biome(X, Y, B), biome_name(B, BName),
    write('The compass needle wobbles, then settles. You are in the '), write(BName), write('.'), nl,
    write('Try the where. command for precise coordinates.'), nl, !.

use(map_fragment) :-
    holding(map_fragment), missile_location(MX, MY),
    write('You unfold the map fragment. A red X marks coordinates ('),
    write(MX), write(', '), write(MY), write(').'), nl, !.

use(mine_detector) :-
    holding(mine_detector), i_am_at(X, Y), minefield_nearby(X, Y), !,
    write('The mine detector beeps urgently! There is a minefield within one step of here.'), nl.
use(mine_detector) :- holding(mine_detector), write('The mine detector is silent. No mines within one step.'), nl, !.

use(_) :- write('You cannot use that here, or you do not have it.'), nl.

minefield_nearby(X, Y) :-
    member((DX, DY), [(0,-1), (0,1), (-1,0), (1,0)]),
    NX is X + DX, NY is Y + DY,
    biome(NX, NY, minefield).