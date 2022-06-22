//
//  ViewController.swift
//  Contact
//
//  Created by Riley Lai on 2022/6/21.
//

import UIKit

class AddContactViewController: UIViewController {
  
  var contact = Contact()
  
  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    makeView()
  }
  
  func makeView() {
    thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.height / 2
    
    // textField
    nameTextField.attributedPlaceholder = NSAttributedString(
      string: "姓名", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
    )
    nameTextField.setBottomBorder()
    nameTextField.textColor = .white
    phoneTextField.attributedPlaceholder = NSAttributedString(
      string: "電話", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
    )
    phoneTextField.setBottomBorder()
    phoneTextField.textColor = .white
    emailTextField.attributedPlaceholder = NSAttributedString(
      string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
    )
    emailTextField.setBottomBorder()
    emailTextField.textColor = .white
  }
  
  func collectContact() {
    contact.name = nameTextField.text!
    contact.phone = phoneTextField.text!
    //TODO: - 有需要設optional binding嗎？
    contact.email = emailTextField.text ?? ""
  }

  //TODO: - 改成至少應輸入一項聯絡資訊，並且僅會依照有輸入的資訊依序顯示在Contact（可能需使用array來儲存）
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    collectContact()
    if contact.isValid {
      if segue.identifier == "ContactView" {
        guard let contactViewController = segue.destination as? ContactViewController else {
          return
        }
        contactViewController.contact = contact
        contactViewController.isNewContact = true
      }
    } else {
      let alert = UIAlertController(title: "請完整填寫必要資訊", message: "至少應輸入姓名和電話", preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK", style: .default)
      let noAction = UIAlertAction(title: "NO", style: .default)
      
      alert.addAction(okAction)
      alert.addAction(noAction)
      
      present(alert, animated: true)
    }
  }

}

//MARK: - TextFieldDelegate
extension AddContactViewController: UITextViewDelegate {
  
}

//MARK: - UITextField Extension
//FIXME: - 底線沒有出現
extension UITextField {
  func setBottomBorder() {
    self.borderStyle = .none
    
//    self.layer.masksToBounds = false
//    self.layer.shadowColor = UIColor.systemGray.cgColor
//    self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//    self.layer.shadowOpacity = 1.0
//    self.layer.shadowRadius = 0.0
  }
}

