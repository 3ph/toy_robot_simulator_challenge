//
//  RectanglePositionerTests.swift
//  Toy Robot SimulatorTests
//
//  Created by Tomas Friml on 25/02/20.
//

import XCTest
@testable import Toy_Robot_Simulator

class RectanglePositionerTests: XCTestCase {
    var positioner: RectanglePositioner!

    override func setUp() {
        positioner = RectanglePositioner(height: 5, width: 5)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPositionerZero() {
        let positioner = RectanglePositioner(height: 0, width: 0)
        positioner.position = Position(facingDirection: .north, coordinate: Coordinate(x: 0, y: 0))
        XCTAssertNil(positioner.position)

        positioner.position = Position(facingDirection: .north, coordinate: Coordinate(x: -1, y: -1))
        XCTAssertNil(positioner.position)

        positioner.position = Position(facingDirection: .north, coordinate: Coordinate(x: 0, y: 2))
        XCTAssertNil(positioner.position)
    }

    func testPositionerInit() {
        // Position is initially not set
        XCTAssertNil(positioner.position)
    }
    
    // Positions outside the tabletop
    func testPositionerOutside() {
        let outsidePosition1 = Position(facingDirection: .north,
                                coordinate: Coordinate(x: -1, y: 0))
        positioner.position = outsidePosition1
        XCTAssertNil(positioner.position)

        let outsidePosition2 = Position(facingDirection: .south,
                                        coordinate: Coordinate(x: 5, y: 4))
        positioner.position = outsidePosition2
        XCTAssertNil(positioner.position)

        let outsidePosition3 = Position(facingDirection: .south,
                                        coordinate: Coordinate(x: 0, y: 5))
        positioner.position = outsidePosition3
        XCTAssertNil(positioner.position)

        let outsidePosition4 = Position(facingDirection: .south,
                                        coordinate: Coordinate(x: 5, y: 5))
        positioner.position = outsidePosition4
        XCTAssertNil(positioner.position)
        
    }
    
    // Positions on the tabletop
    func testPositionInside() {
        let insidePosition1 = Position(facingDirection: .south,
                                       coordinate: Coordinate(x: 0, y: 0))
        positioner.position = insidePosition1
        XCTAssertEqual(positioner.position, insidePosition1)

        let insidePosition2 = Position(facingDirection: .east,
                                       coordinate: Coordinate(x: 4, y: 4))
        positioner.position = insidePosition2
        XCTAssertEqual(positioner.position, insidePosition2)

        let insidePosition3 = Position(facingDirection: .east,
                                       coordinate: Coordinate(x: 0, y: 4))
        positioner.position = insidePosition3
        XCTAssertEqual(positioner.position, insidePosition3)

        let insidePosition4 = Position(facingDirection: .east,
                                       coordinate: Coordinate(x: 2, y: 2))
        positioner.position = insidePosition4
        XCTAssertEqual(positioner.position, insidePosition4)
    }
}
