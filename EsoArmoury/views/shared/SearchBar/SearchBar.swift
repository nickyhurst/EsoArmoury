//
//  SearchBar.swift
//  EsoArmoury
//
//  Created by walnut on 8/28/19.
//  Copyright © 2019 walnut. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    //var onSearchButtonClicked: (() -> Void)? = nil
    
    class Coordinator: NSObject, UISearchBarDelegate {
        //let control: SearchBar
        @Binding var text: String
        
//       init(_ control: SearchBar) {
//            self.control = control
//        }
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            //control.text = searchText
            text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
        
//        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//            control.onSearchButtonClicked?()
//        }
        
    }
    
    func makeCoordinator() -> SearchBar.Coordinator {
            return Coordinator(text: $text)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searchBar.setShowsCancelButton(true, animated: true)
        
    }
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.resignFirstResponder()
//    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar{
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Armor Title"
        searchBar.showsCancelButton = false
        searchBar.returnKeyType = .done
        searchBar.enablesReturnKeyAutomatically = false
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
