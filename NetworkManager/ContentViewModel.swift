//
//  ContentViewModel.swift
//  NetworkManager
//
//  Created by qihoo on 2023/2/24.
//

import SwiftUI
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
