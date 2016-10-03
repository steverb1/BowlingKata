import Foundation

open class Game
{
    var rolls = [Int](repeating: 0, count: 21)
    var currentRoll = 0
    
    open func roll(_ pins: Int)
    {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    open func computeScore() -> Int
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
    
    func sumOfBallsInFrame(_ frameIndex: Int) -> Int
    {
        return rolls[frameIndex] + rolls[frameIndex + 1]
    }
    
    func spareBonus(_ frameIndex: Int) -> Int
    {
        return rolls[frameIndex + 2]
    }
    
    func strikeBonus(_ frameIndex: Int) -> Int
    {
        return rolls[frameIndex + 1] + rolls[frameIndex + 2]
    }
    
    func isStrike(_ frameIndex: Int) -> Bool
    {
        return rolls[frameIndex] == 10
    }
    
    func isSpare(_ frameIndex: Int) -> Bool
    {
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10
    }
}
