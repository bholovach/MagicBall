import UIKit

class MainViewController: UIViewController {
    
    @IBAction func editDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        viewcontroller.delegate = self
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @IBOutlet weak var myQuestionLabel: UILabel! {
        didSet {
            myQuestionLabel.text = urlQuestion
        }
    }
    
    @IBOutlet weak var answerLabel: UILabel!
    
    private var urlQuestion = "My future with spaces"
    private let networking = Networking()
    private var errorAnswer = "Try again"
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        networking.getWelcome(question: urlQuestion) { result in
            switch result {
            case .success(let answerMagic):
                self.answerLabel.text = answerMagic.magic.answer
                print(answerMagic)
            case .failure:
                self.answerLabel.text = self.errorAnswer
            }
        }
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func saveButton(error: String) {
        errorAnswer = error
    }
    
}
