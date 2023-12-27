//
//  RouteManager.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import Foundation
import SwiftUI

enum Route{
    case home
    case components
    case popover
    case popUpMenu
}

struct GetView: View {
    var route: Route
    var body: some View {
        switch route {
        case .home:
            NavigationHome()
        case .components:
            ComponentsView()
        case .popover:
            PopoverView()
        case .popUpMenu:
            PopUpMenuView()
        default:
            ContentUnavailableView("404", systemImage: "globe", description: Text("Invalid route! :(").font(.footnote))
        }
    }
}