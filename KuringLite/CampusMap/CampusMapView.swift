//
//  CampusMapView.swift
//  KuringLite
//
//  Created by Hamlit Jason on 2022/08/24.
//

import SwiftUI
import kuring_campus_map_ios

struct CampusMapView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let campusMapViewController = CampusMapViewController()
        return campusMapViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
