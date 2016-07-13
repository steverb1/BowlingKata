import Foundation

public class Game
{
    var rolls = [Int](count: 21, repeatedValue: 0)
    var currentRoll = 0
    
    public func roll(pins: Int)
    {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    public func computeScore() -> Int
    {
        var score = 0
        var frameIndex = 0
        for _ in 0...9
        {
            if (isStrike(frameIndex))
            {
                score += 10 + strikeBonus(frameIndex)
                frameIndex += 1
            }
            else if (isSpare(frameIndex))
            {
                score += 10 + spareBonus(frameIndex)
                frameIndex += 2
            }
            else
            {
                score += sumOfBallsInFrame(frameIndex)
                frameIndex += 2
            }
        }
        
        return score
    }
    
    func sumOfBallsInFrame(frameIndex: Int) -> Int
    {
        return rolls[frameIndex] + rolls[frameIndex + 1]
    }
    
    func spareBonus(frameIndex: Int) -> Int
    {
        return rolls[frameIndex + 2]
    }
    
    func strikeBonus(frameIndex: Int) -> Int
    {
        return rolls[frameIndex + 1] + rolls[frameIndex + 2]
    }
    
    func isStrike(frameIndex: Int) -> Bool
    {
        return rolls[frameIndex] == 10
    }
    
    func isSpare(frameIndex: Int) -> Bool
    {
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10
    }
}