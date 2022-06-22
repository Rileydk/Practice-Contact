//
//  ContactListTableViewController.swift
//  Contact
//
//  Created by Riley Lai on 2022/6/22.
//

//TODO: - 練習Layout：
  //TODO: - 輸入結束後鍵盤處理
  //TODO: - 輸入框底線
//TODO: - 練習tableView、NavigationBar
  //TODO: - 從List進入Contact會顯示Delete選項，點擊Delete會跳出警示，Yes刪除，Cancel回到Contact。
  //TODO: - 可以在List上左滑顯示刪除鍵，點擊刪除會跳出同上警示。
//TODO: - 練習NotificationCenter
//TODO: - 練習PhotosUI，讓選取的顯示在Contact和列表上（可能需調整照片圖框大小、圓角設定和aspect）

//TODO: - 使用UIContenConfiguration將照片以合理大小顯示在List上
//TODO: - 分為常用聯絡人、緊急聯絡人和一般聯絡人
//TODO: - 從Add進入Contact會顯示Edit、Discard和Save選項。點擊Edit會退回Add。點擊Discard會退回List
//TODO: - 從List進入Contact會顯示Edit、Delete選項，點擊Edit會讓欄位變成可編輯，顯示原本隱藏的欄位，並出現Discard和Save選項。點擊Delete會跳出警示，Yes刪除，Cancel回到Contact。
//TODO: - 電話可以識別是否為iphone，可撥打或傳送imessage
//TODO: - 點擊email可以寄信

import UIKit

class ContactListTableViewController: UITableViewController {
  
  var contacts = [Contact]()
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(updateContact(notification:)), name: .saveContact, object: nil)
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    1
  }

  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    contacts.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
    var content = cell.defaultContentConfiguration()
    let contact = contacts[indexPath.row]
    //FIXME: - 圖片在List會變得好大
//    content.image = contact.thumbnail!
    content.text = contact.name
    cell.contentConfiguration = content
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let contact = contacts[indexPath.row]
    performSegue(withIdentifier: "ReadContact", sender: contact)
  }

  @IBAction func addContact(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: "AddContact", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ReadContact" {
      guard let contactVC = segue.destination as? ContactViewController,
            let contact = sender as? Contact else {
        return
      }
      contactVC.contact = contact
    }
  }
  
  @IBAction func saveNewContact(unwindSegue: UIStoryboardSegue) {
//    tableView.reloadData()
    
//    guard let contactVC = unwindSegue.source as? ContactViewController else {
//      return
//    }
//    let contact = contactVC.contact
//    contacts.append(contact)
//    tableView.reloadData()
  }
  
  @IBAction func canceNewContact(unwindSegue: UIStoryboardSegue) {
  }
  
  @objc func updateContact(notification: Notification) {
    guard let contact = notification.object as? Contact else {
      return
    }
    contacts.append(contact)
    tableView.reloadData()
  }
}
