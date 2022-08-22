//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by 나리강 on 2022/08/22.
//

import UIKit
import RealmSwift

class ShoppingTableViewController: UITableViewController {

    
    var shoppingList : [String] = ["약과사기","투게더사기"]
    let localrealm = try! Realm()
    var tasks : Results<shoppingApp>!
    
   
    @IBOutlet weak var shoppingTextField: UITextField!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        print("realm is located at", localrealm.configuration.fileURL!)
        tasks = localrealm.objects(shoppingApp.self).sorted(byKeyPath: "list", ascending : true)
        configureUI()
      
    }

  
  
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
       
        
        
        let task = shoppingApp(list: shoppingTextField.text!)
        try! localrealm.write{
            localrealm.add(task)
            print("realm succeed")
            
            tableView.reloadData()
            shoppingTextField.text = ""
        }
 
    }
    func configureTextField(item : UITextField){
        
        item.placeholder = "무엇을 구매하실건가요?"
        item.backgroundColor = .systemGray5
        
    }
    
    func configureUI(){
       
        
        
        chooseButton.setTitle("추가", for: .normal)
        chooseButton.backgroundColor = .systemGray4
        chooseButton.layer.cornerRadius = 10
        chooseButton.setTitleColor(.black, for: .normal)
        
        configureTextField(item: shoppingTextField)
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"ShoppingTableViewCell") as! ShoppingTableViewCell
        cell.configureUI()
        cell.backgroundColor = .systemGray5
        cell.layer.cornerRadius = 5
        cell.listLabel.text = shoppingList[indexPath.row]
        
        
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //배열 삭제 후 테이블뷰 갱신
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        
        }
    }

   
    
}
