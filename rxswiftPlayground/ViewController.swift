//
//  ViewController.swift
//  rxswiftPlayground
//
//  Created by pineone on 2022/07/11.
//

import UIKit
import RxSwift


class ViewController: UIViewController {
    // Observable은 swift에서 제공하는 sequence와 동일함.
    // sequence는 Collection Type(Array, Set, Dictionary)세 상속해주는 친구
    // sequence의 특징 : 한번에 하나씩 단계별 진행할수 있는 값 목록
    // Observable 특징 : 비동기적으로 이벤트를 생성해낸다
    // 3가지 유형의 이벤트. : .next / .completed / .error
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeSubscribe()
    }
     
    func makeSubscribe(){
        // subscribe를 이용하면 이벤트를 방출 할 수 있다.
        // 이벤트 방출 : 6번 (onNext_5 + onComplete_1)
        Observable.of(1,2,3,4,5)
            .subscribe {
                print("scribe_eventInt : \($0)")
            }
        // 원하는 이벤트만 방출 : 5번 (onNext)
        Observable.of(1,2,3,4,5)
            .subscribe {
                if let element =  $0.element{
                print("scribe_element : \(element)")
                }
            }
        Observable.of(1,2,3,4,5)
            .subscribe(onNext: {
                print("scribe_element_short : \($0)")
            })
        
        
        
        // just, of, from
        // just : 하나의 요소만 방출
        Observable<Int>.just(1)
            .subscribe(onNext: {print("just : \($0)")})
        
        // of : 하나이상의 요소를 방출, 각 한번씩
        Observable<Int>.of(1,2,3,4,5)
            .subscribe(onNext: {print("of : \($0)")})
        
        // of : 하나이상의 요소를 방출 , Array로 넣으면 배열 자체로 한번만
        Observable.of([1,2,3,4,5])
            .subscribe(onNext: {print("of : \($0)")})
        
        // from : 배열만 받아서 각요소들을 방출
        Observable.from([1,2,3,4,5])
            .subscribe(onNext: {print("from : \($0)")})

    }
    


}

