//
//  PopToRootButton.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct PopToRootButton: View {
    @EnvironmentObject private var navigationController : NavigationController
    var body: some View {
        Button(action: {
            navigationController.popToRoot()
        }, label: {
            Text("Pop To Root")
        })
    }
}

#Preview {
    PopToRootButton()
}
