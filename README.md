# Puszka Pandory: Prolog System Recreation

A reverse-engineered recreation of a classic Polish text adventure, implemented in SWI-Prolog. 

> **Note on Scope:** This project is a simplified, scaled-down conceptual recreation. The original *Puszka Pandory* featured a significantly larger map, graphical elements, and additional complex mechanics. This version focuses strictly on translating the core logic, state management, and essential gameplay loop into a purely text-based Prolog environment.

## Quick Start

*   Ensure **SWI-Prolog (version 10.0.2)** is installed.
*   Load the game engine by consulting the source file in the SWI-Prolog environment (e.g., `?- consult('puszka_pandory.pl').`).
*   Type `start.` into the console to launch the narrative intro and begin playing.
*   If you trigger a death state or complete the mission, type `restart.` to seamlessly reset the entire world state without reloading the source file.

## Reverse Engineering & Localization

*   The original game engine utilized a strict parser that required Polish diacritics (e.g., typing "PŁYNĄĆ" to swim), creating accessibility friction.
*   This recreation bypasses those legacy limitations by architecting the internal logic entirely in English. 
*   All commands (`take`, `use`, `swim`) and item identifiers are processed via an English-based engine, while the presentation layer outputs bilingual text (e.g., "shovel (lopata)") to preserve the original game's atmosphere.

## System Architecture & Core Features

*   **Grid-Based World Generation** 
    The environment is structured as a 15x15 coordinate grid tracking 225 individual tiles.
*   **Biome Mapping** 
    The world features six distinct biomes (Meadow, Forest, Beach/Dunes, Rocks, Sea, and Minefield) spread across the map regions.
*   **Navigation & Environment Parsing** 
    The player navigates using standard compass commands (`n.`, `s.`, `e.`, `w.`) on land. 
*   **Contextual Traversal** 
    Sea tiles are walking-restricted and require the explicit `swim(Direction).` command to traverse between open water and coastal tiles.
*   **Stateful Inventory System** 
    Items can be dynamically collected using `take(Item).` and dropped with `drop(Item).`. 
*   **Database Updates** 
    The system utilizes dynamic Prolog assertions (`assertz` and `retract`) to instantly move item entities between the world grid and the player's inventory.
*   **Persistent World State** 
    Environmental interactions permanently alter the map data. 
*   **Coordinate Tracking** 
    Using a shovel on any Beach tile creates a hole tracked by a `hole_dug(X, Y)` coordinate fact, which remains indefinitely even if the player leaves the area.

## Advanced Mechanics & Puzzle Logic

*   **Item-Gated Puzzle Chains** 
    The primary win condition requires retrieving wire cutters located at coordinate (7, 14), which are blocked by a 6-tile minefield wall at row 13.
*   **Hard Logic Gates** 
    The player must actively locate and equip a mine detector to survive crossing the minefield tile region.
*   **Complex Interactions** 
    Deactivating the buried missile requires a multi-step sequence: uncovering it with a shovel, wedging the firing pin with a stick, and cutting the wires with the wire cutters.
*   **Death States** 
    Entering a minefield without the proper equipment triggers an instant Game Over, flagging the player as `dead` and locking out standard operational commands.
*   **Contextual Feedback Engine** 
    The parser provides intelligent text feedback based on the player's inventory and exact grid location, such as hinting to use a stick if the player attempts to use wire cutters on the missile alone.
