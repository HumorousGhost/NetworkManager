import Foundation
import Moya
import RxSwift
import SwiftyJSON

open class NetworkManager<T> where T: TargetType {
    private let provider: MoyaProvider<T>
    private let targetType: T
    
    init(_ target: T) {
        self.provider = MoyaProvider<T>()
        self.targetType = target
    }
    
    func asObservable(progress: ((Double) -> Void)? = .none) -> Observable<JSON> {
        return Observable.create { observer -> Disposable in
            self._request(self.targetType, progress: { pro in
                if progress != nil {
                    DispatchQueue.main.async {
                        progress?(pro.progress)
                    }
                }
            }, observer: observer)
            return Disposables.create()
        }
        .observe(on: MainScheduler.instance)
    }
    
    private func _request(_ target: T, progress: ProgressBlock?, observer: AnyObserver<JSON>) {
        self.provider.request(self.targetType, callbackQueue: DispatchQueue(label: "com.network.callback"), progress: progress) { result in
            switch result {
            case .success(let response):
                response.resultProcessing(target, observer: observer)
            case .failure(let error):
                observer.onError(error)
            }
        }
    }
}
