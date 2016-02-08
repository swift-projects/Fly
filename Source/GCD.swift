//
//  GCD.swift
//  Fly
//
//  Created by xxxAIRINxxx on 2016/02/02.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public enum GCD {
    case Main
    case Background
    case UserInteractive
    case UserInitiated
    case Utility
    case Default
    case Custom(queue: dispatch_queue_t)
    
    public var queue : dispatch_queue_t {
        switch self {
        case .Main:
            return dispatch_get_main_queue()
        case .Background:
            return dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0)
        case .UserInteractive:
            return dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)
        case .UserInitiated:
            return dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)
        case .Utility:
            return dispatch_get_global_queue(QOS_CLASS_UTILITY, 0)
        case .Default:
            return dispatch_get_global_queue(QOS_CLASS_DEFAULT, 0)
        case .Custom(let queue):
            return queue
        }
    }
}
