//
//  PopUpMenuView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct PopUpMenuView: View {
    @EnvironmentObject private var navigationController : NavigationController
    var body: some View {
        VStack{
            Text("PopUpMenu")
            Divider()
            PopToRootButton()
            Divider()
            Button(action: {
                navigationController.pop()
            }, label: {
                Text("Show Components")
            })
        }
        .navigationTitle("PopUpMenu View")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Menu {
                    Button(action: {}) {
                        Label("Create a file", systemImage: "doc")
                    }
                    
                    Button(action: {}) {
                        Label("Create a folder", systemImage: "folder")
                    }
                } label: {
                    Label("Add", systemImage: "ellipsis.circle")
                }
            }
        }
    }
}

#Preview {
    PopUpMenuView()
}
