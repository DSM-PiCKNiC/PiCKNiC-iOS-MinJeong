# Lifecycles

앱의 생명주기 (lifecycle) = 앱의 시작부터 종료까지의 상태와 그 변화를 나타냄

## App-based lifecycle (iOS 12 이하 / scene 기능 지원하지 않는 앱)

- 앱이 전체 UI를 관리함 → 앱의 생명주기 == UI의 생명주기
- 앱이 실행될 때 `UIApplication`의 인스턴스가 만들어지며, `UIApplicationDelegate` 객체에게 생명주기 이벤트를 보냄

![400](https://docs-assets.developer.apple.com/published/9c1b7e06f4aafb7cb32cf9a923f84e01/media-3233333@2x.png)

**launch** - `application(_:willFinishLaunchingWithOptions:)`, `application(_:didFinishLaunchingWithOptions:)`
- 13 이상에서도 호출
- 필요한 작업 - 앱 실행 준비 (리소스 확인, 초기 설정 등)

**active** - `applicationDidBecomeActive(_:)`
**inactive** - `applicationWillResignActive(_:)`
- active와 inactive - 둘 다 앱이 작동 중인 상태이나, inactive 상태에서는 이벤트를 받지 않음
- 임시 중단 (알림 등) 또는 background 상태로 진입할 때
- 필요한 작업 - 타이머 정지/재개 등의 작업 관리

**background** - `applicationDidEnterBackground(_:)`
- background 진입 이후 앱이 언제든지 종료될 수 있으므로 데이터 저장 등의 작업은 그 이전에 하는 것이 권장됨
- 최대한 빨리 리턴해야 함 - 5초 정도 이후에는 리턴하지 않으면 강제종료
	- 또는 background task 기능을 통해 background 에서 작업 실시 가능
- 필요한 작업 - 리소스 해제 등
	- 리소스를 많이 쓰는 background 앱부터 종료시킴

**foreground** - `applicationWillEnterForeground(_:)`
- 필요한 작업 - background 에서 실시했던 작업을 되돌려 앱이 다시 작동될 수 있도록 하기

**suspended**
- 앱이 작동하지 않는 상태
- 자동적으로 종료될 수 있음

## Scene-based lifecycle (iOS 13 이상)

- 하나의 scene이 한 UI의 인스턴스를 나타냄 → 한 앱에 여러 scene 존재 가능
- `UIApplication`이 만들어지는 것은 동일하나,
  `UIApplicationDelegate` 객체가 아닌 `UISceneDelegate` 객체를 통해 scene의 생명주기 이벤트를 보냄

![|400](https://docs-assets.developer.apple.com/published/bb875ff5b6507138789b710fc57afaf1/media-3233330@2x.png)  

`scene(_:willConnectTo:options:)`
- 앱에 scene이 추가될 때

**active** - `sceneDidBecomeActive(_:)`
**inactive** - `sceneWillResignActive(_:)`
**foreground** - `sceneWillEnterForeground(_:)`
**background** - `sceneDidEnterBackground(_:)`
- 앱 기반과 비슷하다

`sceneDidDisconnect(_:)`
- 앱에서 scene이 제거됐을 때

## 예시

`AppDelegate.swift`:
```swift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("willFinishLaunchingWithOptions")
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("didFinishLaunchingWithOptions")
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
```

`SceneDelegate.swift`:
```swift
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("scene connect")
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        print("sceneDidDisconnect")
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("sceneDidBecomeActive")
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive")
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("sceneWillEnterForeground")
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("sceneDidEnterBackground")
    }
}
```

앱 실행
```
willFinishLaunchingWithOptions
didFinishLaunchingWithOptions
scene connect
sceneWillEnterForeground
sceneDidBecomeActive
```

control center 활성화 → 해제
```
sceneWillResignActive
sceneDidBecomeActive
```

홈 화면 이동 → 복귀
```
sceneWillResignActive
sceneDidEnterBackground
sceneWillEnterForeground
sceneDidBecomeActive
```

앱 종료
```
sceneWillResignActive
sceneDidEnterBackground
sceneDidDisconnect
```

## Resources

- [Exploring the Application Life Cycle](https://cocoacasts.com/understanding-scene-based-applications-exploring-the-application-life-cycle?source=post_page-----b97ceda76e27---------------------------------------)
- 공식문서
