import Foundation
import SwiftyXMLParser

protocol ImageLoaderServiceProtocol {
    var fetchLimit: Int { get }
    func sendRequest(tag: String, handler: @escaping (Result<[ImageMetaData], Error>) -> Void)
    func generateImageURL(size: ImageSize, metaData: ImageMetaData) -> URL?
}

struct FlickrService: ImageLoaderServiceProtocol {

    let fetchLimit = 20
    private let apiKey = InfoPlistParser.getValue(for: "API_KEY") ?? ""

    func sendRequest(tag: String, handler: @escaping (Result<[ImageMetaData], Error>) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        guard var url = URL(string: "https://www.flickr.com/services/rest/") else {return}
        let urlParams = [
            "method": "flickr.photos.search",
            "api_key": apiKey,
            "tags": tag,
            "content_type": "1",
            "media": "photos",
            "per_page": String(fetchLimit)
        ]

        url = url.appendingQueryParameters(urlParams)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if let httpResponse = response as? HTTPURLResponse,
               !(200..<300 ~= httpResponse.statusCode) {
                let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)
                handler(.failure(error))
            }

            if let error = error {
                handler(.failure(error))
                return
            }

            guard let data = data else { return }
            let parsedData = parseXMLData(from: data)
            handler(.success(parsedData))
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }

    private func parseXMLData (from data: Data) -> [ImageMetaData] {
        let xml = XML.parse(data)
        let path = ["rsp", "photos", "photo"]
        let metaDataList = xml[path].compactMap { ImageMetaData(attributes: $0.attributes) }
        return metaDataList
    }

    func generateImageURL(size: ImageSize, metaData: ImageMetaData) -> URL? {
        let url = URL(string: "https://live.staticflickr.com/")?
            .appendingPathComponent("\(metaData.server)/")
            .appendingPathComponent("\(metaData.id)_" + "\(metaData.secret)_" + "\(size.rawValue)")
            .appendingPathExtension("jpg")
        return url
    }
}
