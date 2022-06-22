//
//  ContactViewController.swift
//  Contact
//
//  Created by Riley Lai on 2022/6/22.
//

import UIKit

class ContactViewController: UIViewController {
  
  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var phoneContainer: UIView!
  @IBOutlet weak var phoneTextField: UITextField!
  @IBOutlet weak var emailContainer: UIView!
  @IBOutlet weak var emailTextField: UITextField!
  
  var contact = Contact()
  var isNewContact = false
  
  override func viewDidLoad() {
    super.viewDidLoad()

    makeView()
    if isNewContact {
      let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewContact))
      let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelNewContact))
      navigationItem.rightBarButtonItem = saveBarButton
      navigationItem.leftBarButtonItem = cancelBarButton
    }
    
    nameLabel.text = contact.name
    phoneTextField.text = "電話：\(contact.phone)"
    phoneTextField.setBottomBorder()
    phoneTextField.isEnabled = false
    if contact.email.isEmpty {
      emailContainer.isHidden = true
      emailTextField.isHidden = true
    }
    emailTextField.text = "Email：\(contact.email)"
    emailTextField.setBottomBorder()
  }
  
  func makeView() {
    thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.size.width / 2
    phoneContainer.layer.cornerRadius = 10
    emailContainer.layer.cornerRadius = 10
  }
  
  @objc func saveNewContact() {
    NotificationCenter.default.post(name: .saveContact, object: contact)
    performSegue(withIdentifier: "saveNewContact", sender: nil)
  }
  
  @objc func cancelNewContact() {
    performSegue(withIdentifier: "cancelNewContact", sender: nil)
  }
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if segue.identifier == "saveNewContact" {
//      guard let contactListTableVC = segue.destination as? ContactListTableViewController else {
//        return
//      }
//      contactListTableVC.contacts.append(contact)
//    }
//  }
}

extension Notification.Name {
  static let saveContact = Notification.Name("saveContact")
}
