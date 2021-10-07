import Foundation

class Networking {
    func getMagic(question: String, completion: @escaping (Result<Magic, Error>) -> ()) {
        guard let url = URL(string: "https://8ball.delegator.com/magic/JSON/my future") else {
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


