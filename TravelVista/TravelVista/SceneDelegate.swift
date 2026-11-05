//
//  SceneDelegate.swift
//  TravelVista
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // Initialisée automatiquement par UIKit à partir du storyboard déclaré dans Info.plist (UISceneStoryboardFile)
    var window: UIWindow?

    // Appelée quand la scène (l'écran de l'app) se connecte, juste après la création de la fenêtre
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Remplace l'écran initial du storyboard (ListViewController) par la nouvelle vue SwiftUI ListView
        window?.rootViewController = UIHostingController(rootView: ListView())
    }
}
