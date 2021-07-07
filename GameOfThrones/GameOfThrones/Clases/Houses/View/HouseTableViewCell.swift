//
//  HousesTableViewCell.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 07/07/21.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    
    var house:House? {
        didSet {
            guard let house = house else {return}
            if let region = house.region {
                houseImageView.image = UIImage(named: region)
            }
            
            if let title = house.title {
                titleLabel.text = " \(title) "
            }
            
            if let name = house.name {
                nameLabel.text = name
            }
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    let houseImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor =  #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(houseImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(titleLabel)
        self.contentView.addSubview(containerView)
        
        houseImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        houseImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        houseImageView.widthAnchor.constraint(equalToConstant:50).isActive = true
        houseImageView.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.houseImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:80).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo:self.containerView.widthAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

