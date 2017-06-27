//
//  ViewController.swift
//  Study
//
//  Created by syswin on 2017/6/22.
//  Copyright © 2017年 syswin. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let scheduler = SerialDispatchQueueScheduler(qos: .default)
//        let serialScheduler = SerialDispatchQueueScheduler(qos: .default)
//        let subscription = Observable<Int>.interval(0.3, scheduler: scheduler)
//            .observeOn(serialScheduler)
//            .subscribe { event in
//                print(event)
//        }
//        
////        Thread.sleep(forTimeInterval: 3.0)
//        
//        subscription.dispose()
        
       _ = myJust(2)
                .subscribe(onNext: { (n) in
                    print(n)
                })
        
        
        let sequence = [1,2,3,4,5]
        _ = myFrom(sequence)
                .subscribe(onNext: { n in
                    print(n)
                })
        
        let counter = myInterval(0.1)
        print("Started --- ")
        let subscription = counter
            .subscribe(onNext: { n in
                print(n)
            })
        Thread.sleep(forTimeInterval: 0.7)
        subscription.dispose()
        print("Ended")
    }
    
    func myJust<E>(_ element: E) -> Observable<E> {
        return Observable.create({ (observer) in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        })
    }
    
    func myFrom<E>(_ sequence: [E]) -> Observable<E> {
        return Observable.create{ observer in
            for element in sequence {
                observer.on(.next(element))
            }
            
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func myInterval(_ interval: TimeInterval) -> Observable<Int> {
        return Observable.create { observer in
            print("Subscribed")
            let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
            timer.scheduleRepeating(deadline: DispatchTime.now() + interval, interval: interval)
            
            let cancel = Disposables.create {
                print("Disposed")
                timer.cancel()
            }
            
            var next = 0
            timer.setEventHandler {
                if cancel.isDisposed {
                    return
                }
                observer.on(.next(next))
                next += 1
            }
            timer.resume()
            
            return cancel
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

