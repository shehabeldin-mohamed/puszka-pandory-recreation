:- module(state, [
    i_am_at/2, at/3, holding/1, hole_dug/2, dead/0, missile_exposed/0, won/0,
    reset_state/0
]).

:- dynamic i_am_at/2, at/3, holding/1, hole_dug/2, dead/0, missile_exposed/0, won/0.

% Handles both the initial start and game restarts cleanly
reset_state :-
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
    assertz(at(wire_cutters, 7, 14)).