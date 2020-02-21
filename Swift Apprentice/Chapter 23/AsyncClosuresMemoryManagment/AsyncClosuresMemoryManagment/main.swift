//
//  main.swift
//  AsyncClosuresMemoryManagment
//
//  Created by Felipe on 01-12-19.
//  Copyright © 2019 Felipe. All rights reserved.
//

import Foundation


class Tutorial {
    let title: String
    unowned let author: Author
    lazy var createDescription: () -> String = { [unowned self] in
        return "\(self.title) by \(self.author.name)"
    }
    weak var editor: Editor?
    init(title: String, author: Author) {
        self.title = title
        self.author = author

    }
    deinit {
        print("Goodbye Tutorial \(title)!")
    }
}

class Editor {
    let name: String
    var tutorials: [Tutorial] = []
    init(name: String) {
        self.name = name
    }

    deinit {
        print("Goodbye Editor \(name)!")
    }
}

class Author {
    let name: String
    var tutorials: [Tutorial] = []
    init(name: String) {
        self.name = name

    }
    deinit {
        print("Goodbye Author \(name)!")
    }
}

do{
    let editor = Editor(name: "Ray")
    let author = Author(name: "Cosmin")
    let tutorial = Tutorial(title: "Memory Managment", author: author)
    print(tutorial.createDescription())
    tutorial.editor = editor
    editor.tutorials.append(tutorial)
}
//
//
//var counter = 0
//var f = { print(counter) }
//counter = 1
//f()
//
//counter = 0
//f = { [c = counter] in print(c) }
//counter = 1
//f()
//
//counter = 0
//f = { [counter] in print(counter) }
//counter = 1
//f()
//


func log(message: String) {
    let thread = Thread.current.isMainThread ? "Main" : "Background"
    print("\(thread) thread: \(message)")
}
//2
func addNumbers(upTo range: Int) -> Int {
    log(message: "Adding numbers...")
    return (1...range).reduce(0, +)
    
}

let queue = DispatchQueue(label: "queue")


func execute<Result>(backgroundWork: @escaping () -> Result,
                     mainWork: @escaping (Result) -> ()) {
        queue.async {
            let result = backgroundWork() // 3
            DispatchQueue.main.async {
                mainWork(result)
            }
        }
    }

execute(backgroundWork: { addNumbers(upTo: 100) }, mainWork: {
    log(message: "The sum is \($0)")
    
})
