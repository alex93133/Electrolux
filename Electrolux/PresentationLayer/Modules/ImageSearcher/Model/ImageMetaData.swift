import Foundation

struct ImageMetaData {
    let id: String
    let secret: String
    let server: String
}

extension ImageMetaData {
    init?(attributes: [String : String]) {
        guard let id = attributes["id"],
              let secret = attributes["secret"],
              let server = attributes["server"] else { return nil }
        self.id = id
        self.secret = secret
        self.server = server
    }
}
