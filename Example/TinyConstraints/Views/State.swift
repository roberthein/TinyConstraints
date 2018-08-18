import Foundation
import TinyConstraints

typealias StateConstraints = [String: Constraints]
typealias StateColor = [String: UIColor]

enum State: String, EnumCollection {
    case first
    case second
    case third
    case fourth
    
    func next() -> State? {
        guard let index = State.allCases.index(of: self) else {
            return nil
        }
        
        var next = index + 1
        
        if next >= State.allCases.count {
            next = 0
        }
        
        return State.allCases[safe: next]
    }
    
    func previous() -> State? {
        guard let index = State.allCases.index(of: self) else {
            return nil
        }
        
        var previous = index - 1
        
        if previous < 0 {
            previous = State.allCases.count - 1
        }
        
        return State.allCases[safe: previous]
    }
}
