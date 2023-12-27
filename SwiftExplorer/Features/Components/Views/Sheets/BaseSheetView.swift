//
//  BaseSheetView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct BaseSheetView: View {
    @State private var showBaseSheet = false
    @EnvironmentObject private var navigationController : NavigationController
    var body: some View {
        NavigationView{
            VStack{
                Button(action: {
                    showBaseSheet.toggle()
                }, label: {
                    Text("Show Sheet")
                })
                .sheet(isPresented: $showBaseSheet, content: {
                    Text("This is a base sheet")
                })
                Divider()
                PopToRootButton()
                Divider()
                Button(action: {
                    navigationController.popNViews(N: 2)
                }, label: {
                    Text("Show Components")
                })
            }
        }
        .navigationTitle(Text("Base Sheets"))
    }
}

#Preview {
    BaseSheetView()
}
