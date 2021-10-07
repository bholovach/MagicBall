import UIKit

class MainViewController: UIViewController {
    
    @IBAction func editDidTap(_ sender: Any) {
        
    }
    @IBOutlet weak var myQuestionLabel: UILabel!
    @IBOutlet weak var myAnswerLabel: UILabel!
       
    
    private let networking = Networking()
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        networking.getMagic(question: "my future") { result in
            switch result {
            case .success(let question):
                self.myAnswerLabel
                print(question)
            case .failure(let error):
                print(error)
            }
        }
    }
}


