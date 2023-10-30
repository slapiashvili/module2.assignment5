//
//  Panel.swift
//  module2.assignment5
//
//  Created by Salome Lapiashvili on 29.10.23.
//

import UIKit

struct Panel {
    
    var panelImage: UIImage
    var panelDescription: String
    
    init(panelImage: UIImage? = nil, panelDescription: String? = "") {
        self.panelImage = panelImage ?? UIImage.default
        self.panelDescription = panelDescription ?? ""
    }
}
