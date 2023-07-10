//
//  SceneDelegate.swift
//  SOPT_iOS_Week4
//
//  Created by 박윤빈 on 2023/05/06.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // 1.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // 2.
        self.window = UIWindow(windowScene: windowScene)
        // 3.
        let navigationController = UINavigationController(rootViewController: MainViewController())
        self.window?.rootViewController = navigationController ///스택의 최하위 부분 설정
        // 4. 화면이 나오게 해주는 코드
        self.window?.makeKeyAndVisible()
    }
    
}
