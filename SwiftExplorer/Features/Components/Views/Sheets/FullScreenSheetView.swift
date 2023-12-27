//
//  FullScreenSheetView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 27/12/23.
//

import SwiftUI

struct FullScreenSheetView: View {
    @State private var showFullScreenSheet = false
    @EnvironmentObject private var navigationController : NavigationController
    var body: some View {
        NavigationView{
            VStack{
                Button(action: {
                    showFullScreenSheet.toggle()
                }, label: {
                    Text("Show Sheet")
                })
                .fullScreenCover(isPresented: $showFullScreenSheet, content: {
                    Text("This is a base sheet")
                    Text("close")
                        .onTapGesture {
                            showFullScreenSheet.toggle()
                        }
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
    FullScreenSheetView()
}
