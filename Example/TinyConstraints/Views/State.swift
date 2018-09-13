import Foundation
import TinyConstraints

typealias StateConstraints = [String: Constraints]
typealias StateColor = [String: UIColor]

enum State: String, CaseIterable {
    case first
    case second
    case third
    case fourth
    
    func next() -> State? {
        switch self {
        case .first: return .second
        case .second: return .third
        case .third: return .fourth
        case .fourth: return .first
        }
    }
    
    func previous() -> State? {
        switch self {
        case .first: return .fourth
        case .second: return .first
        case .third: return .second
        case .fourth: return .third
        }
    }
}
