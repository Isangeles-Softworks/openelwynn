## Introduction
OpenElwynn is an RPG game placed in well known Elwynn Forest area from WoW.

By default, the game after starting is begin hosted on the local game server, allowing any number of players to join the game.

The game uses [Flame](https://github.com/Isangeles/flame) engine and [Mural](https://github.com/Isangeles/mural) 2D GUI as the user interface.
## Usage
This repository contains two scripts `update` and `start`.

`update` script builds all executable files for the game from the latest sources and pulls current game content from the repository.

`start` script starts the game by starting local games server, game AI, and user 2D GUI.

To start the game first start the `update` script:
```
./update
```
Next, start the game with the `start` script:
```
./start
```
## Game content
After starting the `update` script, game content will be placed in the `data/modules/elwynn` directory.

Game content alone is hosted in a separate repository [here](https://github.com/Isangeles/elwynn).

The whole game content is a [Flame](https://github.com/Isangeles/flame) module.

Read [Flame](https://github.com/Isangeles/mural) repository description and documentation for more details about using and configuring game modules.
## Interface
The game uses [Mural](https://github.com/Isangeles/mural) as the 2D user interface.

`gui` executable start the 2D user interface.

Configuration values for the user interface are stored in the `.mural` file.

Read [Mural](https://github.com/Isangeles/mural) repository description and documentation for more details about using and configuring the game interface.
## Multiplayer
The game uses [Fire](https://github.com/Isangeles/fire) as the game server.

`server` executable starts games server on the address specified in the `.fire` configuration file.

Other players can join the game by configuring their GUI with the address and port of the game server in the `.mural` configuration file.

After connecting to the server players need to authenticate with a user ID and password.

Users can be created by adding a new directory in the `data/users` with the `.user` file containing the password. The user directory name is used as a user ID.

Read [Fire](https://github.com/Isangeles/fire) repository description and documentation for more details about using and configuring the game server.
## AI
The game uses [Ignite](https://github.com/Isangeles/ignie) as game AI.

`ai` executable start the game AI.

Configuration values for AI are stored in the `.ignite` file.

Read [Ignite](https://github.com/Isangeles/mural) repository description and documentation for more details about using and configuring the game AI.
## Contact
* Isangeles <<dev@isangeles.pl>>

## License
Copyright 2021 Dariusz Sikora <<dev@isangeles.pl>>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
MA 02110-1301, USA.

