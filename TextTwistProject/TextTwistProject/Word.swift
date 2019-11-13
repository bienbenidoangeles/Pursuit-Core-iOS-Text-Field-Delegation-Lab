import Foundation

enum CheckResult {
    case correct
    case incorrect
}

struct Word {
    let unscrambled: String

    var scrambled: String {
        return String(unscrambled.shuffled())
    }
    
    static func getRandomWord() -> Word {
        return [
            Word(unscrambled: "conned"),
            Word(unscrambled: "hushes"),
            Word(unscrambled: "handed"),
            Word(unscrambled: "basket"),
            Word(unscrambled: "buzzer"),
            Word(unscrambled: "jumped"),
            Word(unscrambled: "fixing")
        ].randomElement()!
    }
    
    func WordCheck(input: String) -> CheckResult {
        if input == unscrambled {
            return .correct
        } else {
            return .incorrect
        }
    }
}
