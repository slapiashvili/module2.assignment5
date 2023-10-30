//
//  PanelCell.swift
//  module2.assignment5
//
//  Created by Salome Lapiashvili on 29.10.23.
//

import UIKit


class PanelCell: UITableViewCell {
    var panelImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier", size: 17)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        addSubview(panelImageView)
        addSubview(descriptionLabel)
        
        
        NSLayoutConstraint.activate([
            panelImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            panelImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            panelImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            panelImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            descriptionLabel.topAnchor.constraint(equalTo: panelImageView.bottomAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
