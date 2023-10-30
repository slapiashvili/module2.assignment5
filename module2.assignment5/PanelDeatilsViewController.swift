//
//  PanelDeatilsViewController.swift
//  module2.assignment5
//
//  Created by Salome Lapiashvili on 30.10.23.
//

import UIKit

class PanelDetailViewController: UIViewController {
    
    var panelImage: UIImage?
    var panelDescription: String?
    
    
    private let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 15
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Courier", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBlueGray
        setupViews()
    }
    
    
    func setupViews() {
        view.addSubview(imageView)
        view.addSubview(descriptionLabel)
        
        imageView.image = panelImage
        descriptionLabel.text = panelDescription
        descriptionLabel.textAlignment = .center
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
