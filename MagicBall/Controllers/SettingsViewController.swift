import UIKit

protocol SettingsViewControllerDelegate {
    func saveButton(error: String)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var myAnswerLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        guard let errorAnswer = textField.text, !errorAnswer.isEmpty else {
            return
        }
        delegate?.saveButton(error: errorAnswer)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    var delegate: SettingsViewControllerDelegate?
}
