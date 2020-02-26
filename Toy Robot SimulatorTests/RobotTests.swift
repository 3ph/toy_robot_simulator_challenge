//
//  RobotTests.swift
//  Toy Robot SimulatorTests
//
//  Created by Tomas Friml on 25/02/20.
//

import XCTest

class RobotTests: XCTestCase {
    
    var robot: Robot!
    var positioner: Positionable!

    override func setUp() {
        positioner = RectanglePositioner(height: 5, width: 5)
        robot = Robot(positioner: positioner)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlaceable() {
        // Initially not placed
        XCTAssertFalse(robot.isPlaced)
        
        // Invalid placement
        robot.place(position: Position(facingDirection: .south, coordinate: Coordinate(x: -1, y: -1)))
        XCTAssertFalse(robot.isPlaced)

        // Valid placement
        let validPosition = Position(facingDirection: .south, coordinate: Coordinate(x: 2, y: 2))
        robot.place(position: validPosition)
        XCTAssertTrue(robot.isPlaced)
        XCTAssertEqual(robot.position, validPosition)

        // New invalid placement, robot still placed but on the old position
        robot.place(position: Position(facingDirection: .east, coordinate: Coordinate(x: 5, y: 0)))
        XCTAssertTrue(robot.isPlaced)
        XCTAssertEqual(robot.position, validPosition)
        
        // New valid position
        robot.place(position: Position(facingDirection: .west, coordinate: Coordinate(x: 0, y: 0)))
        XCTAssertEqual(robot.position?.facingDirection, .west)
        XCTAssertEqual(robot.position?.coordinate, Coordinate(x: 0, y: 0))
    }
    
    func testMovable() {
        // Initially not placed, robot needs to be placed to be able to move
        XCTAssertFalse(robot.isPlaced)
        
        // place to south west corner, facing south
        let initialPosition1 = Position(facingDirection: .south, coordinate: Coordinate(x: 0, y: 0))
        robot.place(position: initialPosition1)
        robot.move()
        XCTAssertEqual(robot.position, initialPosition1)
        
        // place to south west corner, facing north
        let initialPosition2 = Position(facingDirection: .north, coordinate: Coordinate(x: 0, y: 0))
        robot.place(position: initialPosition2)
        robot.move()
        // x hasn't changed
        XCTAssertEqual(robot.position?.coordinate.x, initialPosition2.coordinate.x)
        // y has moved north
        XCTAssertEqual(robot.position?.coordinate.y, 1)
        robot.move()
        robot.move()
        XCTAssertEqual(robot.position?.coordinate.y, 3)
        robot.move()
        XCTAssertEqual(robot.position?.coordinate.y, 4)
        // can't move outside the tabletop
        robot.move()
        XCTAssertEqual(robot.position?.coordinate.y, 4)

        // place to the same coordinates just facing east
        let initialPosition3 = Position(facingDirection: .east, coordinate: robot.position!.coordinate)
        robot.place(position: initialPosition3)
        XCTAssertEqual(robot.position?.facingDirection, .east)
        // moving east
        robot.move()
        XCTAssertEqual(robot.position?.coordinate.y, initialPosition3.coordinate.y)
        XCTAssertEqual(robot.position?.coordinate.x, 1)
        robot.move()
        robot.move()
        robot.move()
        XCTAssertEqual(robot.position?.coordinate.x, 4)
        robot.move()
        // can't move outside the tabletop
        XCTAssertEqual(robot.position?.coordinate.x, 4)
    }
    
    func testTurnable() {
        // Initially not placed, robot needs to be placed to be able to move
        XCTAssertFalse(robot.isPlaced)
        robot.left()
        XCTAssertFalse(robot.isPlaced)
        
        // place to south west corner, facing south
        let initialPosition1 = Position(facingDirection: .south, coordinate: Coordinate(x: 0, y: 0))
        robot.place(position: initialPosition1)
        robot.left()
        XCTAssertEqual(robot.position?.facingDirection, .east)
        robot.left()
        robot.left()
        XCTAssertEqual(robot.position?.facingDirection, .west)
        robot.right()
        robot.left()
        XCTAssertEqual(robot.position?.facingDirection, .west)
        robot.right()
        XCTAssertEqual(robot.position?.facingDirection, .north)
        robot.right()
        robot.right()
        robot.right()
        XCTAssertEqual(robot.position?.facingDirection, .west)
    }
    
    func testExampleInput() {
        // a) PLACE 0,0,NORTH MOVE REPORT Output: 0,1,NORTH
        robot.place(position: Position(facingDirection: .north, coordinate: Coordinate(x: 0, y: 0)))
        robot.move()
        XCTAssertEqual(robot.position, Position(facingDirection: .north, coordinate: Coordinate(x: 0, y: 1)))
        
        // b) PLACE 0,0,NORTH LEFT REPORT Output: 0,0,WEST
        robot.place(position: Position(facingDirection: .north, coordinate: Coordinate(x: 0, y: 0)))
        robot.left()
        XCTAssertEqual(robot.position, Position(facingDirection: .west, coordinate: Coordinate(x: 0, y: 0)))
        
        // c) PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT Output: 3,3,NORTH
        robot.place(position: Position(facingDirection: .east, coordinate: Coordinate(x: 1, y: 2)))
        robot.move()
        robot.move()
        robot.left()
        robot.move()
        XCTAssertEqual(robot.position, Position(facingDirection: .north, coordinate: Coordinate(x: 3, y: 3)))
    }
    
    func testReportable() {
        // Not place
        XCTAssertEqual(robot.report(), "")
        
        robot.place(position: Position(facingDirection: .east, coordinate: Coordinate(x: 1, y: 2)))
        XCTAssertEqual(robot.report(), "1,2,EAST")
        robot.move()
        XCTAssertEqual(robot.report(), "2,2,EAST")
        robot.left()
        XCTAssertEqual(robot.report(), "2,2,NORTH")
    }
}
