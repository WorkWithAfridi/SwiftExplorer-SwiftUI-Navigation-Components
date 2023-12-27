//
//  PopoverView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct PopoverView: View {
    @State private var showPopover = false
    @EnvironmentObject private var navigationController : NavigationController
    var body: some View {
        VStack{
            Button(action: {
                showPopover.toggle()
            }, label: {
                Text("Show Popover")
            })
            Divider()
            PopToRootButton()
            Divider()
            Button(action: {
                navigationController.pop()
            }, label: {
                Text("Show Components")
            })
        }
        .popover(isPresented: $showPopover, content: {
            Text("This is a popover in SwiftUI")
        })
        .navigationTitle(
            Text("Popover"))
    }
}

#Preview {
    PopoverView()
}
