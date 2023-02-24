# NetworkManager

Custom encapsulation network request method

## Usage

```swift
import RxSwift

final class ContentViewModel: ObservableObject {
    let disposeBag = DisposeBag()
    
    func getNetworking() {
        NetworkManager(HomeService.home)
            .asObservable(progress: { progress in
                
                debugPrint("progress = \(progress)")
            })
            .subscribe(onNext: { json in
                debugPrint("queue = \(Thread.current)")
                let userinfo = UserInfo(json)
                debugPrint(userinfo)
            }, onError: { error in
                debugPrint(error)
            })
            .disposed(by: self.disposeBag)
    }
}
```

## custom parsing method

Just replace the replaceable in the NetworkResponse.swift file

```swift
    /// The method can be replaced according to the needs of the project
    /// - Parameters:
    ///   - jsonAny: response data
    ///   - observer: observer
    public func replaceable(_ jsonAny: Any, observer: AnyObserver<JSON>) {
//        guard let _ = jsonAny as? [String: Any] else {
//            observer.onError(NetworkError.jsonToDictionaryFailed(message: "Failed to convert JSON to dictionary"))
//            return
//        }
//        let code = dict["code"] as? Int ?? -1
//        let msg = dict["msg"] as? String ?? "null"
//        if code != 0 {
//            observer.onError(NetworkError.exception(message: msg))
//            return
//        }
        let json = JSON(jsonAny)
        observer.onNext(json)
        observer.onCompleted()
    }
```
