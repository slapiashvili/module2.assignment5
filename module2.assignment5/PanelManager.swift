//
//  PanelManager.swift
//  module2.assignment5
//
//  Created by Salome Lapiashvili on 29.10.23.
//

import UIKit

class PanelManager {
    
    private var panels: [Panel]
    
    static let shared = PanelManager()
    
    
    init() {
        let defaultImage = UIImage(named: "defaultImage")!
        
        panels = [
            
            Panel(panelImage: UIImage(named: "beauty.And.Rage") ?? defaultImage, panelDescription: "Beauty and Rage"),
            Panel(panelImage: UIImage(named: "corpse.Tree") ?? defaultImage, panelDescription: "The Corpse Tree"),
            Panel(panelImage: UIImage(named: "dark.Woods.") ?? defaultImage, panelDescription: "The Dark Woods"),
            Panel(panelImage: UIImage(named: "distance.Between.Us") ?? defaultImage, panelDescription: "The Distance Between Us"),
            Panel(panelImage: UIImage(named: "fading.Away") ?? defaultImage, panelDescription: "Faiding Away"),
            Panel(panelImage: UIImage(named: "femto") ?? defaultImage, panelDescription: "Femto"),
            Panel(panelImage: UIImage(named: "gutss.Longsword") ?? defaultImage, panelDescription: "Guts's Legendary Longsword"),
            Panel(panelImage: UIImage(named: "hundred.Dead.Men") ?? defaultImage, panelDescription: "A hundred dead men"),
            Panel(panelImage: UIImage(named: "just.Like.A.Painting") ?? defaultImage, panelDescription: "Just like a painting"),
            Panel(panelImage: UIImage(named: "mozgus.Vs.Guts") ?? defaultImage, panelDescription: "Mozgus vs Guts"),
            Panel(panelImage: UIImage(named: "monsters.All.Around") ?? defaultImage, panelDescription: "Monsters All Around"),
            Panel(panelImage: UIImage(named: "rickert.And.Griffith") ?? defaultImage, panelDescription: "Rickert and Griffith"),
            Panel(panelImage: UIImage(named: "sacrifice.Mark") ?? defaultImage, panelDescription: "Sacrifice Mark")
        ]
    }
    
    func getAllPanels() -> [Panel] {
        return panels
    }
    
    func addPanel(image: UIImage, description: String) {
        let newPanel = Panel(panelImage: image, panelDescription: description)
        panels.append(newPanel)
    }
    
}
