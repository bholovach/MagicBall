import Foundation

struct Welcome: Codable {
    let magic: Magic
}

struct Magic: Codable {
    let question:String
    let answer: String
    let type: String
}

