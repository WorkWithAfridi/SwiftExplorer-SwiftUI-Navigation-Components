//
//  NavigationController.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import Foundation
import SwiftUI

class NavigationController : ObservableObject {
    @Published var path = NavigationPath()
    
    func popToRoot(){
        path = NavigationPath()
    }
    
    func to(route : Route){
        path.append(route)
    }
    
    func pop(){
        path.removeLast()
    }
    
    func popNViews(N: Int){
        path.removeLast(N)
    }
}
