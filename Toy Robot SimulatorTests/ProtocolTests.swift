//
//  ProtocolTests.swift
//  Toy Robot SimulatorTests
//
//  Created by Tomas Friml on 25/02/20.
//

import XCTest
@testable import Toy_Robot_Simulator

class ProtocolTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPositionable() {
        let robot = Robot(height: 5, width: 5)
        
        // Position is initially not set
        XCTAssertNil(robot.position)
        
        let newPosition = Position(facingDirection: .North,
                                   coordinate: Coordinate(x: 1, y: 1))
        robot.position = newPosition
        XCTAssertEqual(robot.position, newPosition)
        
    }
}
