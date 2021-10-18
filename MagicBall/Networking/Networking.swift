import Foundation

class Networking {
    func getWelcome(question: String, completion: @escaping (Result<Welcome, Error>) -> ()) {
        guard let escapedAddress = question.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return
        }
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/\(escapedAddress)") else {
            return
        }
        getData(url: url, completion: completion)
    }
    
    private func getData<T: Codable>(url: URL, completion: @escaping (Result<T, Error>) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            do {
                print(String(data: data, encoding: .utf8))
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}


