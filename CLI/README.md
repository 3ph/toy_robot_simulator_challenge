# CLI for Toy Robot Simulator

## Installation

1. Clone the repo `git clone git@github.com:3ph/toy_robot_simulator_challenge.git`
2. Navigate to `CLI` folder (`cd toy_robot_simulator_challenge/CLI`)
3. Run `swift build`
4. Wait for the build to finish
5. Run `.build/debug/ToyRobotSimulator`
6. Have fun!

## Simulator instructions

Robot is navigated using several commands. These can be added in batch seperated by space. If there is an issue with one of the commands the rest of the sequence will be ignored.

* PLACE X,Y,F - will put the robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST. The origin (0,0) can be considered to be the SOUTH WEST most corner. The first valid command to the robot must be a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. All commands in the sequence until a valid PLACE command has been executed will be discarded.
* MOVE: will move the toy robot one unit forward in the direction it is currently facing.
* LEFT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
* RIGHT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
* REPORT: will announce the X,Y and F of the robot.
* HELP: will show this help.
* QUIT: will end the simulation.

## Author

Tom Friml, tom@tomfriml.com

## License

Toy Robot Simulator CLI is available under the MIT license. See the LICENSE file for more info.
