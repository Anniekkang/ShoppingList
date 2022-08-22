//
//  ShoppingTableViewCell.swift
//  ShoppingList
//
//  Created by 나리강 on 2022/08/22.
//

import UIKit
import Kingfisher

class ShoppingTableViewCell: UITableViewCell {

 
    @IBOutlet weak var checkboxImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var listLabel: UILabel!
    
    
    
    func configureUI(){
        checkboxImageView.image = UIImage(systemName: "checkmark.square")
        checkboxImageView.tintColor = .black
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.setTitle("", for: .normal)
        favoriteButton.tintColor = .black
        listLabel.backgroundColor = .clear
        listLabel.font = .systemFont(ofSize: 15)
        listLabel.textColor = UIColor.black
        listLabel.textAlignment = .left
        
        
        
    }
    
    
}
