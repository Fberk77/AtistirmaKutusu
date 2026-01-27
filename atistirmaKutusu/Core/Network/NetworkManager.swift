import Alamofire
import Foundation

// Alamofire: iOS için kullanılan popüler bir networking (ağ) kütüphanesidir.
// HTTP isteklerini daha kolay yazmamızı sağlar.
// https://reqres.in        -> baseUrl (ana adres)
// api/users?              -> path (endpoint)
// page=2                  -> query (parametre)
// API yapılandırmasını tutan struct
// Encodable → Swift’ten JSON’a
// Codable Encodable ve Decodable protokolleri için bir tür takma adıdır
// Decodable, Swift’te bir JSON verisini alıp Swift modeline dönüştürmeyi sağlayan protokoldür.
struct NetworkConfig {
    let baseUrl: String
    // API’nin ana URL adresini tutar
}


// Gerçek API ile unit test yazılmaz
// Bunun yerine mock kullanılır
// API path’lerini tek yerde toplamak için enum

enum NetworkPath: String {
    
    case users = "api/users"
    case login = "api/login"
    
    // Reqres test API base URL
    static let baseUrlReqres: String = "https://reqres.in/"
}



// NetworkManager’ın uyması gereken kuralları belirleyen protocol
protocol NetworkManagerProtocol {
    
    // Generic fetch fonksiyonu
    // T: Codable -> Gelen JSON’un hangi modele dönüştürüleceğini söyler
    // async -> asenkron çalışır
    func fetch<T: Codable>(path: NetworkPath,methot: HTTPMethod,type: T.Type) async -> T?
    
    func post<T: Codable, R: Encodable>(path: NetworkPath,model: R,type: T.Type) async -> T?
    // Network ayarlarını tutan config
    var config: NetworkConfig { get set }
}

// NetworkManager için bir singleton benzeri hazır instance
extension NetworkManager {
    
    // Uygulama genelinde kullanılabilecek tek bir NetworkManager
    static let networkManager: NetworkManagerProtocol =
        NetworkManager(
            config: NetworkConfig(
                baseUrl: NetworkPath.baseUrlReqres
            )
        )
}

// Gerçek network işlemlerini yapan sınıf
class NetworkManager: NetworkManagerProtocol {
    
    // Helper to send raw JSON data with Alamofire
    private struct JSONDataEncoding: ParameterEncoding {
        let data: Data
        func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
            var request = try urlRequest.asURLRequest()
            request.httpBody = data
            if request.value(forHTTPHeaderField: "Content-Type") == nil {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            return request
        }
    }
    
    // API ayarlarını tutar
    internal var config: NetworkConfig
    
    // Config dışarıdan verilir (Dependency Injection)
    init(config: NetworkConfig) {
        self.config = config
    }
    
    // Generic fetch fonksiyonu
    func fetch<T: Codable>(path: NetworkPath, methot: HTTPMethod,type: T.Type) async -> T? {
        
        // Alamofire ile HTTP isteği oluşturulur
        let dataRequest = AF.request(
            "\(config.baseUrl)\(path.rawValue)", // URL birleştirilir
            method: methot                       // GET, POST vs.
        )
        .validate()
        // HTTP status code 200–299 arası mı kontrol eder
        
        .serializingDecodable(T.self)
        // Gelen JSON verisini T tipine decode eder
        // Örn: UserResponse, LoginResponse vs.
        
        // Request çalıştırılır ve response beklenir
        let result = await dataRequest.response
        
        // Eğer decode edilmiş değer yoksa hata yazdırılır
        guard let value = result.value else {
            print("ERROR:\(String(describing: result.error))")
            return nil
        }
        
        // Decode edilmiş model geri döndürülür
        return value
    }
    
    func post<T: Codable, R: Encodable>(path: NetworkPath,model: R, type: T.Type) async -> T? {
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(model) else { return nil }
        guard let dataString = String(data: data, encoding: .utf8) else { return nil }
        
        let dataRequest = AF.request("\(config.baseUrl)\(path.rawValue)", method: .post, parameters: convertoDictionary(text: dataString) )
        .validate()
        .serializingDecodable(T.self)
        
        let result = await dataRequest.response
        guard let value = result.value else {
            print("ERROR:\(String(describing: result.error))")
            return nil
        }
        
        // Decode edilmiş model geri döndürülür
        return value
       
    }
    
    private func convertoDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            }catch {
                print(error.localizedDescription)
            }
         
        }
        return nil
    }
}






