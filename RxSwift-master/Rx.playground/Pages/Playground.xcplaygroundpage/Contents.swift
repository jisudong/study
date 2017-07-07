/*:
 > # IMPORTANT: To use **Rx.playground**:
 1. Open **Rx.xcworkspace**.
 1. Build the **RxSwift-macOS** scheme (**Product** → **Build**).
 1. Open **Rx** playground in the **Project navigator**.
 1. Show the Debug Area (**View** → **Debug Area** → **Show Debug Area**).
 */
import RxSwift
/*:
 # Try Yourself
 
 It's time to play with Rx 🎉
 */
playgroundShouldContinueIndefinitely()

example("Try yourself") {
  // let disposeBag = DisposeBag()
  _ = Observable.just("Hello, RxSwift!")
    .debug("Observable")
    .subscribe()
    // .disposed(by: disposeBag) // If dispose bag is used instead, sequence will terminate on scope exit
}


// MARK: Creating and Subscribing to Observables

example("never") {
    let disposeBag = DisposeBag()
    Observable<String>.never()
        .subscribe { _ in
            print("this will never be printed")
        }
        .disposed(by: disposeBag)
}


example("empty") {
    let disposeBag = DisposeBag()
    Observable<Int>.empty()
        .subscribe { event in
            print(event)
        }
        .disposed(by: disposeBag)
}

example("just") {
    let disposeBag = DisposeBag()
    Observable.just("🔴")
        .subscribe({ (event) in
            print(event)
        })
        .disposed(by: disposeBag)
}

example("of") {
    let disposeBag = DisposeBag()
    Observable.of("🐶", "🐱", "🐭", "🐹")
        .subscribe(onNext: { element in
            print(element)
        })
        .disposed(by: disposeBag)
}

example("from") {
    let disposeBag = DisposeBag()
    Observable.from(["🐶", "🐱", "🐭", "🐹"])
        .subscribe(onNext: {  print($0) })
        .disposed(by: disposeBag)
}

example("create") {
    let disposeBag = DisposeBag()
    let myJust = { (element: String) -> Observable<String> in
        return Observable.create { observer in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    myJust("🔴")
        .subscribe({ print($0) })
        .disposed(by: disposeBag)
}

example("range") {
    let disposeBag = DisposeBag()
    Observable.range(start: 1, count: 10)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("repeatElement") {
    let disposeBag = DisposeBag()
    Observable.repeatElement("🔴")
        .take(3)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("generate") {
    let disposeBag = DisposeBag()
    Observable.generate(
            initialState: 0,
            condition: { $0 < 3 },
            iterate: { $0 + 1 }
        )
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("deferred") {
    let disposeBag = DisposeBag()
    var count = 1
    
    let deferredSequence = Observable<String>.deferred {
        print("creating \(count)")
        count += 1
        
        return Observable.create { observer in
            observer.onNext("🐶")
            observer.onNext("🐱")
            observer.onNext("🐵")
            return Disposables.create()
        }
    }
    
    deferredSequence
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    
    deferredSequence
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("error") {
    let disposeBag = DisposeBag()
    Observable<Int>.error(TestError.test)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("doOn") {
    let disposeBag = DisposeBag()
    Observable.of("🍎", "🍐", "🍊", "🍋")
        .do(
            onNext: { print("Intercepted", $0) },
            onError: { print("Intercepted error", $0) },
            onCompleted: { print("Completed") }
        )
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}


// MARK: Working with Subject

extension ObservableType {
    func addObserver(_  id: String) -> Disposable {
        return subscribe { print("Subscription;", id, "Event:", $0) }
    }
}

example("PublishSubject") {
    let disposeBag = DisposeBag()
    let subject = PublishSubject<String>()
    
    subject.addObserver("1").disposed(by: disposeBag)
    subject.onNext("🐶")
    subject.onNext("🐱")
    
    subject.addObserver("2").disposed(by: disposeBag)
    subject.onNext("🅰️")
    subject.onNext("🅱️")
}

example("ReplaySubject") {
    let disposeBag = DisposeBag()
    let subject = ReplaySubject<String>.create(bufferSize: 1)
    
    subject.addObserver("1").disposed(by: disposeBag)
    subject.onNext("🐶")
    subject.onNext("🐱")
    
    subject.addObserver("2").disposed(by: disposeBag)
    subject.onNext("🅰️")
    subject.onNext("🅱️")
}

example("BehaviorSubject") {
    let disposeBag = DisposeBag()
    let subject = BehaviorSubject(value: "🔴");
    
    subject.addObserver("1").disposed(by: disposeBag)
    subject.onNext("🐶")
    subject.onNext("🐱")
    
    subject.addObserver("2").disposed(by: disposeBag)
    subject.onNext("🅰️")
    subject.onNext("🅱️")
    
    subject.addObserver("3").disposed(by: disposeBag)
    subject.onNext("🍐")
    subject.onNext("🍊")
}

example("Variable") {
    let disposeBag = DisposeBag()
    let variable = Variable("🔴")
    
    variable.asObservable().addObserver("1").disposed(by: disposeBag)
    variable.value = "🐶"
    variable.value = "🐱"

    variable.asObservable().addObserver("2").disposed(by: disposeBag)
    variable.value = "🅰️"
    variable.value = "🅱️"
}


// MARK: Combination Operators

example("startWith") {
    let disposeBag = DisposeBag()
    
    Observable.of("", "", "", "")
        .startWith("")
        .startWith("")
        .startWith("", "", "")
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}



