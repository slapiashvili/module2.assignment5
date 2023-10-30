//
//  SearchManager.swift
//  module2.assignment5
//
//  Created by Salome Lapiashvili on 29.10.23.
//

import UIKit

class SearchManager {
    
    var allPanels: [Panel]
    private(set) var filteredPanels: [Panel]
    private var currentSearchQuery: String = ""
    
    var isFiltering: Bool {
        return !currentSearchQuery.isEmpty
    }
    
    init(panels: [Panel]) {
        self.allPanels = panels
        self.filteredPanels = panels
    }
    
    func searchPanels(for query: String) {
        currentSearchQuery = query
        if query.isEmpty {
            filteredPanels = allPanels
        } else {
            filteredPanels = allPanels.filter { $0.panelDescription.lowercased().contains(query.lowercased()) }
        }
    }
    
    func deletePanel(at index: Int) {
        guard index >= 0 && index < allPanels.count else {
            return
        }
        allPanels.remove(at: index)
        
        if isFiltering {
            filteredPanels = allPanels.filter { $0.panelDescription.lowercased().contains(currentSearchQuery.lowercased()) }
        }
    }
    
    func movePanel(from startIndex: Int, to endIndex: Int) {
        guard startIndex >= 0, endIndex >= 0,
              startIndex < allPanels.count, endIndex < allPanels.count else {
            return
        }
        
        let panel = allPanels.remove(at: startIndex)
        allPanels.insert(panel, at: endIndex)
        
        if isFiltering {
            filteredPanels = allPanels.filter { $0.panelDescription.lowercased().contains(currentSearchQuery.lowercased()) }
        }
    }
}
