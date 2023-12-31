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
    case sheetsView
    case baseSheet
    case fullScreenSheet
    case dialogView
    case customActionSheet
    case customAlertDialog
    case apiView
    case coinList
    case invalidRoute
    case pickerView
    case photoPicker
    case cameraPhotoPicker
    case videoPicker
    case filePicker
    case modifierListView
    case measurementFormatter
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
        case .sheetsView:
            SheetsView()
        case .baseSheet:
            BaseSheetView()
        case .fullScreenSheet:
            FullScreenSheetView()
        case .dialogView:
            DialogsView()
        case .customActionSheet:
            CustomActionSheet()
        case .customAlertDialog:
            CustomAlertDialog()
        case .apiView:
            ApiView()
        case .coinList:
            CoinListView()
        case .pickerView:
            PickerView()
        case .photoPicker:
            PhotoSelectorView()
        case .cameraPhotoPicker:
            CameraPhotoPickerView()
        case .modifierListView:
            ModifierListView()
        case .measurementFormatter:
            MeasurementFormatterView()
        default:
            ContentUnavailableView("404", systemImage: "globe", description: Text("Invalid route! :(").font(.footnote))
        }
    }
}
