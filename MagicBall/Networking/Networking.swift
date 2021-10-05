import Foundation

class Networking {
    func getMagicBall(nickname: String, completion: @escaping (Result<Magic, Error>) -> ()) {
        let session = URLSession.shared
        let url = URL(string: "https://8ball.delegator.com/magic/JSON/<MY FUTURE>")!
        let task = session.dataTask(with: url) { (data, responds, error) in
            guard error == nil else {
                print("DataTask: error: \(error!.localizedDescription)")
                return
            }
            do {
                self.= try JSONDecoder().decode(.self, from: data!)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}


