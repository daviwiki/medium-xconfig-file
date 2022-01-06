
import Foundation

class Configuration {
    
    static let `default`: Configuration = Configuration()
    
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

extension Configuration {
    struct Keys {
        static let apiKey: String = "API_URL"
    }
}

extension Configuration {
    struct API {
        static var baseUrl: String {
            return "https://" + (try! Configuration.default.value(for: Configuration.Keys.apiKey))
        }
    }
}
