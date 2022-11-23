//
//  BeerCell.swift
//  lesson5412
//
//  Created by ake11a on 2022-11-12.
//

import UIKit
import SnapKit
import RealmSwift

class BeerCell: UITableViewCell {
    
    private var controller: BeerCellController!
    
    let realm = try! Realm()
    
    lazy var beerNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(addFavoritesTap))
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        controller = BeerCellController(view: self)
        
        addSubview(beerNameLabel)
        beerNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(250)
        }
        
        addSubview(likeImageView)
        likeImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.height.width.equalTo(50)
        }
    }
    
    @objc func addFavoritesTap() {
        controller.addFavourite(title: beerNameLabel.text!)
    }
}

