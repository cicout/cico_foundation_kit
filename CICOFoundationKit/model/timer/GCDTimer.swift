//
//  GCDTimer.swift
//  CICOFoundationKit
//
//  Created by Ethan.Li on 2020/7/17.
//  Copyright © 2020 cico. All rights reserved.
//

import Foundation

public class GCDTimer {
    private var timer: DispatchSourceTimer?
    
    deinit {
        print("\(self) deinit")
        self.stop()
    }
    
    public init(interval: TimeInterval, repeats: Bool, queue: DispatchQueue, eventClosure: (() -> Void)?) {
        self.timer = DispatchSource.makeTimerSource(queue: queue)
        
        let repeating: TimeInterval = repeats ? interval : .infinity
        
        self.timer?.schedule(deadline: DispatchTime.now() + interval, repeating: repeating)
        
        self.timer?.setEventHandler { [weak self] in
            eventClosure?()
            
            if !repeats {
                self?.stop()
            }
        }
        
        self.timer?.resume()
    }
    
    public convenience init(mainThreadTimerInterval: TimeInterval, repeats: Bool, eventClosure: (() -> Void)?) {
        self.init(interval: mainThreadTimerInterval, repeats: repeats, queue: DispatchQueue.main, eventClosure: eventClosure)
    }
    
    public convenience init(globalTimerInterval: TimeInterval, repeats: Bool, eventClosure: (() -> Void)?) {
        self.init(interval: globalTimerInterval, repeats: repeats, queue: DispatchQueue.global(), eventClosure: eventClosure)
    }
    
    public func suspend() {
        self.timer?.suspend()
    }
    
    public func resume() {
        self.timer?.resume()
    }

    public func stop() {
        self.timer?.cancel()
        self.timer = nil
    }
}
