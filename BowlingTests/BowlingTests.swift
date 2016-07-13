import XCTest
@testable import Bowling

class BowlingTests: XCTestCase
{
    let game = Game()
    
    func testGutterGame()
    {
        rollMany(20, pins: 0)
        
        XCTAssertEqual(0, game.computeScore())
    }
    
    func testAllOnes()
    {
        rollMany(20, pins: 1)
        
        XCTAssertEqual(20, game.computeScore())
    }
    
    func testOneSpare()
    {
        rollSpare()
        game.roll(3)
        rollMany(17, pins:0)
        
        XCTAssertEqual(16, game.computeScore())
    }
    
    func testTwoSpares()
    {
        rollSpare()
        rollSpare()
        game.roll(3)
        rollMany(15, pins: 0)
        
        XCTAssertEqual(31, game.computeScore())
    }
    
    func testOneStrike()
    {
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(16, pins:0)
        
        XCTAssertEqual(24, game.computeScore())
    }
    
    func testPerfectGame()
    {
        for _ in 1...12
        {
            rollStrike()
        }
        
        XCTAssertEqual(300, game.computeScore())
    }
    
    private func rollMany(times: Int, pins: Int)
    {
        for _ in 1...times
        {
            game.roll(pins)
        }
    }
    
    private func rollStrike()
    {
        game.roll(10)
    }
    
    private func rollSpare()
    {
        game.roll(5)
        game.roll(5)
    }
}
