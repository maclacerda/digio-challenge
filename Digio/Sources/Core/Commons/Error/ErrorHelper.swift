//
//  ErrorHelper.swift
//  DigioApp
//
//  Created by Marcos Ferreira on 26/08/24.
//

import Dispatch

private let outputQueue: DispatchQueue = {
    let queue = DispatchQueue(
        label: "com.digio.DigioCore.outputQueue",
        qos: .userInteractive,
        target: .global(qos: .userInteractive)
    )

    defer {
        setupAtExitHandler()
    }

    return queue
}()

private func setupAtExitHandler() {
    atexit {
        outputQueue.sync(flags: .barrier) {}
    }
}

/**
 A thread-safe, newline-terminated version of `fatalError(...)` that doesn't leak
 the source path from the compiled binary.
 */
public func queuedFatalError(_ string: String, file: StaticString = #file, line: UInt = #line) -> Never {
    outputQueue.sync {
        fflush(stdout)
        let file = "\(file)".bridge().lastPathComponent
        fputs("\(string): file \(file), line \(line)\n", stderr)
    }

    abort()
}
