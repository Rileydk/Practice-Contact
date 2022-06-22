//
//  Contact.swift
//  Contact
//
//  Created by Riley Lai on 2022/6/22.
//

import Foundation
import UIKit

struct Contact {
  var name = ""
  var phone = ""
  var email = ""
  var thumbnail = UIImage(named: "thumbnail-placeholder")
  var isValid: Bool {
    !(name.isEmpty || phone.isEmpty)
  }
}
