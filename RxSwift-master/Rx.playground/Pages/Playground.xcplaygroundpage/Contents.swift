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
    
    Observable.of("🐶", "🐱", "🐭", "🐹")
        .startWith("1️⃣")
        .startWith("2️⃣")
        .startWith("3️⃣", "🅰️", "🅱️")
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("merge") {
    let disposeBag = DisposeBag()
    
    let subject1 = PublishSubject<String>()
    let subject2 = PublishSubject<String>()
    
    Observable.of(subject1, subject2)
        .merge()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    
    subject1.onNext("🅰️")
    
    subject1.onNext("🅱️")
    
    subject2.onNext("①")
    
    subject2.onNext("②")
    
    subject1.onNext("🆎")
    
    subject2.onNext("③")
}

example("zip") {
    let disposeBag = DisposeBag()
    
    let stringSubject = PublishSubject<String>()
    let intSubject = PublishSubject<Int>()
    
    Observable.zip(stringSubject, intSubject) { stringElement, intElement in
            "\(stringElement) \(intElement)"
        }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    
    stringSubject.onNext("🅰️")
    stringSubject.onNext("🅱️")
    
    intSubject.onNext(1)
    intSubject.onNext(2)

    stringSubject.onNext("🆎")
    intSubject.onNext(3)
}

example("combineLatest") {
    let disposeBag = DisposeBag()
    
    let stringSubject = PublishSubject<String>()
    let intSubject = PublishSubject<Int>()
    
    Observable.combineLatest(stringSubject, intSubject) { stringElement, intElement in
            "\(stringElement) \(intElement)"
        }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    
    stringSubject.onNext("🅰️")
    
    stringSubject.onNext("🅱️")
    intSubject.onNext(1)

    intSubject.onNext(2)
    
    stringSubject.onNext("🆎")
}

example("Array.combineLatest") {
    let disposeBag = DisposeBag()
    
    let stringObservable = Observable.just("🔴")
    let fruitObservable = Observable.from(["🍎", "🍐", "🍊"])
    let animalObservable = Observable.of("🐶", "🐱", "🐭", "🐹")
    
    
    
    Observable.combineLatest([stringObservable, fruitObservable, animalObservable]) {
            "\($0[0]) \($0[1]) \($0[2])"
        }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("switchLatest") {
    let disposeBag = DisposeBag()
    
    let subject1 = BehaviorSubject(value: "⚽️")
    let subject2 = BehaviorSubject(value: "🍎")
    
    let variable = Variable(subject1)
    
    variable.asObservable()
        .switchLatest()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    
    subject1.onNext("🏈")
    subject1.onNext("🏀")
    
    variable.value = subject2
    
    subject1.onNext("⚾️")
    
    subject2.onNext("🍐")
}


// MARK: Transforming Operators

example("map") {
    let disposeBag = DisposeBag()
    Observable.of(1, 2, 3)
        .map { $0 * $0 }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("flatMap and flatMapLatest") {
    let disposeBag = DisposeBag()
    
    struct Player {
        var score: Variable<Int>
    }
    
    let 👦🏻 = Player(score: Variable(80))
    let 👧🏼 = Player(score: Variable(90))
    let ren = Player(score: Variable(91))
    
    let player = Variable(👦🏻)
    
    player.asObservable()
        .flatMap { $0.score.asObservable() }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
    
    👦🏻.score.value = 85
    
    player.value = 👧🏼
    
    👦🏻.score.value = 95
    
    👧🏼.score.value = 100
    
    player.value = ren
    
    👦🏻.score.value = 92
    
    👧🏼.score.value = 93
    
    ren.score.value = 94
}


// MARK: Filtering and Conditional Operators

example("filter") {
    let disposeBag = DisposeBag()
    
    Observable.of(
        "🐱", "🐰", "🐶",
        "🐸", "🐱", "🐰",
        "🐹", "🐸", "🐱")
        .filter { $0 == "🐱" }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("distinctUntilChanged") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐷", "🐱", "🐱", "🐱", "🐵", "🐱")
        .distinctUntilChanged()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("elementAt") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .elementAt(3)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("single") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .single()
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("single with conditions") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .single { $0 == "🐸" }
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .single { $0 == "🐰" }
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .single { $0 == "🔵" }
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("take") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .take(3)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("takeLast") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .takeLast(3)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("takeWhile") {
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .takeWhile { $0 < 4 }
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("takeUntil") {
    let disposeBag = DisposeBag()
    
    let sourceSequence = PublishSubject<String>()
    let referenceSequence = PublishSubject<String>()
    
    sourceSequence
        .takeUntil(referenceSequence)
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    
    sourceSequence.onNext("🐱")
    sourceSequence.onNext("🐰")
    sourceSequence.onNext("🐶")
    
    referenceSequence.onNext("🔴")
    
    sourceSequence.onNext("🐸")
    sourceSequence.onNext("🐷")
    sourceSequence.onNext("🐵")
}

example("skip") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .skip(2)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("skipWhile") {
    let disposeBag = DisposeBag()
    
    Observable.of(1, 2, 3, 4, 5, 6)
        .skipWhile { $0 < 4 }
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("skipWhileWithIndex") {
    let disposeBag = DisposeBag()
    
    Observable.of("🐱", "🐰", "🐶", "🐸", "🐷", "🐵")
        .skipWhileWithIndex({ (element, index) in
            index < 3
        })
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("skipUntil") {
    let disposeBag = DisposeBag()
    
    let sourceSequence = PublishSubject<String>()
    let referenceSequence = PublishSubject<String>()
    
    sourceSequence
        .skipUntil(referenceSequence)
        .subscribe(onNext: { print($0)})
        .disposed(by: disposeBag)
    
    sourceSequence.onNext("🐱")
    sourceSequence.onNext("🐱")
    sourceSequence.onNext("🐶")
    
    referenceSequence.onNext("🔴")
    
    sourceSequence.onNext("🐸")
    sourceSequence.onNext("🐷")
    sourceSequence.onNext("🐵")
}


// MARK: Mathematical and Aggregate Operators

example("toArray") {
    let disposeBag = DisposeBag()
    
    Observable.range(start: 1, count: 10)
        .toArray()
        .subscribe { print($0) }
        .disposed(by: disposeBag)
}

example("reduce") {
    let disposeBag = DisposeBag()
    
    Observable.of(10, 100, 1000)
        .reduce(1, accumulator: +)
        .subscribe(onNext: { print($0) })
        .disposed(by: disposeBag)
}

example("concat") {
    let disposeBag = DisposeBag()
    
    let subject1 = BehaviorSubject(value: "🍎")
    let subject2 = BehaviorSubject(value: "🐶")
    
    let variable = Variable(subject1)
    
    variable.asObservable()
        .concat()
        .subscribe { print($0) }
        .disposed(by: disposeBag)
    
    subject1.onNext("🍐")
    subject1.onNext("🍊")
    
    variable.value = subject2
    
    subject2.onNext("I would be ignored")
    subject2.onNext("🐱")
    
    subject1.onCompleted()
    
    subject2.onNext("🐭")
}


// MARK: Connectable Operators

func sampleWithoutConnectableOperators() {
    printExampleHeader(#function)
    
    let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
    
    _ = interval
        .subscribe(onNext: { print("Subscription: 1, Event: \($0)") })
    
    delay(5) {
        _ = interval
            .subscribe(onNext: { print("Subscription: 2, Event: \($0)") })
    }
}

//sampleWithoutConnectableOperators()

func sampleWithPublish() {
    printExampleHeader(#function)
    
    let intSequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        .publish()
    
    _ = intSequence
        .subscribe(onNext: { print("Subscription 1:, Event: \($0)") })
    
    delay(2) {
        _ = intSequence.connect()
    }
    
    delay(4) {
        _ = intSequence
            .subscribe(onNext: { print("Subscription 2:, Event: \($0)") })
    }
    
    delay(6) {
        _ = intSequence
            .subscribe(onNext: { print("Subscription 3:, Event: \($0)") })
    }
}

//sampleWithPublish()

func sampleWithReplayBuffer() {
    printExampleHeader(#function)
    
    let intSequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        .replay(3)
    
    _ = intSequence
        .subscribe(onNext: { print("Subscription 1:, Event: \($0)") })
    
    delay(2) {
        _ = intSequence.connect()
    }
    
    delay(4) {
        _ = intSequence
            .subscribe(onNext: { print("Subscription 2:, Event: \($0)") })
    }
    
    delay(8) {
        _ = intSequence
            .subscribe(onNext: { print("Subscription 3:, Event: \($0)") })
    }
}

//sampleWithReplayBuffer()

func sampleWithMulticast() {
    printExampleHeader(#function)
    
    let subject = PublishSubject<Int>()
    
    _ = subject
        .subscribe(onNext: { print("Subject: \($0)") })
    
    let intSequence = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        .multicast(subject)
    
    _ = intSequence
        .subscribe(onNext: { print("\tSubscription 1:, Event: \($0)") })
    
    delay(2) {
        _ = intSequence.connect()
    }

    delay(4) {
        _ = intSequence
            .subscribe(onNext: { print("\tSubscription 2:, Event: \($0)") })
    }
    
    delay(6) {
        _ = intSequence
            .subscribe(onNext: { print("\tSubscription 3:, Event: \($0)") })
    }
}

//sampleWithMulticast()



