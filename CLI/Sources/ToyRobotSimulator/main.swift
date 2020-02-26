import SwiftCLI

class Play: Command {
    let name = "ln"
    func execute() throws {
        print("**********************************")
        print("Welcome to the Toy Robot Simulator")
        print("**********************************")
        print()
        print("The goal is to navigate a Robot on a rectangular tabletop")
        print()

        let height = Input.readInt(
            prompt: "Please state height of the table (1-100): ",
            validation: [.within(1...100)],
            errorResponse: { input, reason in
                Term.stderr <<< "'\(input)' is invalid; must be a number between 1 and 100"
            }
        )
        let width = Input.readInt(
            prompt: "Please state width of the table (1-100): ",
            validation: [.within(1...100)],
            errorResponse: { input, reason in
                Term.stderr <<< "'\(input)' is invalid; must be a number between 1 and 100"
            }
        )

        // Initialize the Robot with tabletop dimensions
        let positioner = RectanglePositioner(height: height, width: width)
        robot = Robot(positioner: positioner)
        
        // Show initial help
        showHelp()
        
        // Run the simulation
        runSimulation()
    }
}

// Print commands and simulator rules
func showHelp() {
    print("Robot is navigated using several commands. These can be added in batch seperated by space. If there is an issue with one of the commands the rest of the sequence will be ignored.")
    print()
    print("  PLACE X,Y,F - will put the robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST.")
    print("     The origin (0,0) can be considered to be the SOUTH WEST most corner. The first valid command to the robot is a PLACE command,")
    print("     after that, any sequence of commands may be issued, in any order, including another PLACE command.")
    print("     All commands in the sequence until a valid PLACE command has been executed will be discarded.")
    print()
    print("  MOVE: will move the toy robot one unit forward in the direction it is currently facing.")
    print()
    print("  LEFT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.")
    print()
    print("  RIGHT: will rotate the robot 90 degrees in the specified direction without changing the position of the robot.")
    print()
    print("  REPORT: will announce the X,Y and F of the robot.")
    print()
    print("  HELP: will show this help.")
    print()
    print("  QUIT: will end the simulation.")
    print()
    print()
    print("Did you know that the word Robot comes from a Czech word \"robota\" meaning forced labour?")
    print()
}

// Show error - either unknown command or invalid parameters
func showError(_ error: String) {
    print("Invalid command or command parameter: \"\(error)\".")
    print("Please use HELP to print valid commands.")
}

// Main simulation loop
func runSimulation() {
    var shouldContinue = true
    
    repeat {
        guard let robot = robot else {
            print("Tabletop dimensions not known! Quitting")
            return
        }
        print()
        print("Command: ")
        
        let commands = Input.readLine().lowercased().components(separatedBy: " ")
        
        var index = 0
        while index < commands.count {
            let command = commands[index]
            switch command {
            case "place":
                index += 1
                if index < commands.count {
                    let parameters = commands[index].components(separatedBy: ",")
                    placeWith(parameters: parameters)
                } else {
                    showError(command)
                }
            case "move":
                robot.move()
            case "left":
                robot.left()
            case "right":
                robot.right()
            case "report":
                print("\(robot.report())")
            case "help":
                showHelp()
            case "quit":
                shouldContinue = false
                index = commands.count

            default:
                showError(command)
            }
            
            index += 1
        }
    } while shouldContinue
}

// Place robot with given parameters X,Y,F
func placeWith(parameters: [String]) {
    if parameters.count == 3 {
        if let x = Int(parameters[0]),
            let y = Int(parameters[1]),
            let direction = FacingDirection.fromString(parameters[2]) {
            
            robot?.place(position: Position(facingDirection: direction, coordinate: Coordinate(x: x, y: y)))
        } else {
            showError("PLACE parameters invalid")
        }
    } else {
        showError("PLACE parameters missing")
    }
}

var robot: Robot?

let simulator = CLI(singleCommand: Play())
_ = simulator.go()
