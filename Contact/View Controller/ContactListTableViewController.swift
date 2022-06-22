//
//  ContactListTableViewController.swift
//  Contact
//
//  Created by Riley Lai on 2022/6/22.
//

//TODO: - 練習Layout：
  //TODO: - 未輸入應輸入的欄位會跳出警示框並要求繼續輸入
  //TODO: - 輸入框底線
//TODO: - 練習NotificationCenter
//TODO: - 練習tableView、NavigationBar
  //TODO: - 讓編輯完成的contact顯示到列表上，包含照片
  //TODO: - 點擊+可以進到Add新增
  //TODO: - 點擊Done或列表按鈕都可以進到Contact
  //TODO: - 從Add進入Contact會顯示Edit、Discard和Save選項。點擊Edit會退回Add。點擊Discard會退回List
  //TODO: - 從List進入Contact會顯示Edit、Delete選項，點擊Edit會讓欄位變成可編輯，顯示原本隱藏的欄位，並出現Discard和Save選項。點擊Delete會跳出警示，Yes刪除，Cancel回到Contact。
//TODO: - 練習PhotosUI，讓選取的顯示在Contact和列表上（可能需調整照片圖框大小、圓角設定和aspect）

import UIKit

class ContactListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
