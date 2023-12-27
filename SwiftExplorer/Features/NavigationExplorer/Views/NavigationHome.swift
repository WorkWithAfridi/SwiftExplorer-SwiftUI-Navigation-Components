//
//  NavigationHome.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct NavigationHome: View {
    @EnvironmentObject var navigationController : NavigationController
    var body: some View {
        List{
            Text("Components")
                .onTapGesture {
                    navigationController.path.append(Route.components)
                }
            Text("Page 2")
            Text("Page 3")
            Text("Page 4")
            Text("Page 5")
        }
    }
}

#Preview {
    NavigationHome()
}
