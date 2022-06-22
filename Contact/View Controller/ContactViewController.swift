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
  
  override func viewDidLoad() {
    super.viewDidLoad()

    makeView()
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
}
