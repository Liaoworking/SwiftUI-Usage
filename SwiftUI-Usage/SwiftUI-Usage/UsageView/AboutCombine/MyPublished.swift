//
//  MyPublished.swift
//  SwiftUI-Usage
//
//  Created by liaoing on 2022/7/14.
//  Copyright © 2022 Run Liao. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
@propertyWrapper
public struct MyPublished<Value> {
    public var wrappedValue: Value {
        willSet {  // 修改 wrappedValue 之前
            publisher.subject.send(newValue)
        }
    }
    
    public var projectedValue: Publisher {
        publisher
    }
    
    private var publisher: Publisher
    
    public struct Publisher: Combine.Publisher {
        public typealias Output = Value
        public typealias Failure = Never
        
        var subject: CurrentValueSubject<Value, Never> // PassthroughSubject 会缺少初始话赋值的调用
        
        public func receive<S>(subscriber: S) where S: Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            subject.subscribe(subscriber)
        }
        
        init(_ output: Output) {
            subject = .init(output)
        }
    }
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
        publisher = Publisher(wrappedValue)
    }
    
    public static subscript<OuterSelf: ObservableObject>(
        _enclosingInstance observed: OuterSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<OuterSelf, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<OuterSelf, Self>
    ) -> Value {
        get {
            observed[keyPath: storageKeyPath].wrappedValue
        }
        set {
            if let subject = observed.objectWillChange as? ObservableObjectPublisher {
                subject.send() // 修改 wrappedValue 之前
                observed[keyPath: storageKeyPath].wrappedValue = newValue
            }
        }
    }
    
}


struct TestMyPublished {
    
    func test() {
        
        let object = MyPublishedModel()

        let c1 = object.objectWillChange.sink(receiveValue: {
            print("object will changed")
        })
        let c2 = object.$name.sink{
            print("name will get new value \($0)")
        }

        object.name = "bob"

    }
    
}

class MyPublishedModel: ObservableObject {
    @MyPublished var name = "fat" // 将 MyPublished 替换成 Published 将获得同样的结果
    init() {}
}

