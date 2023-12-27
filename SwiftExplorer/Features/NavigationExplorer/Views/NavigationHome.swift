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
        NavigationView{
            List{
                Text("Components")
                    .onTapGesture {
                        navigationController.path.append(Route.components)
                    }
                Text("Invalid Route")
                    .onTapGesture {
                        navigationController.path.append(Route.invalidRoute)
                    }
                Text("Page 3")
                Text("Page 4")
                Text("Page 5")
            }
        }
        .navigationTitle(Text("SwiftExplorer"))
    }
}

#Preview {
    NavigationHome()
}
