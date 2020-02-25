//
//  RobotTests.swift
//  Toy Robot SimulatorTests
//
//  Created by Tomas Friml on 25/02/20.
//

import XCTest

class RobotTests: XCTestCase {
    
    var robot: Robot!

    override func setUp() {
        robot = Robot(height: 5, width: 5)
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
}
