import Foundation

extension URL {
    func appendingQueryParameters(_ parametersDictionary: [String: String]) -> URL {
        let URLString: String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}
