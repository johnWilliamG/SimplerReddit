//
//  NetworkTask.swift
//  RedditImageBantz
//
//  Created by Galloway, John (Associate Software Developer) on 22/04/2017.
//  Copyright © 2017 Galloway, John (Associate Software Developer). All rights reserved.
//

import Foundation

protocol NetworkTask {
    
    /// Determines whether the task is running.
    var isRunning: Bool { get }
    
    /// Start the task
    func start()
    
    /// Resume a currently suspended or non-started task.
    func resume()
    
    /// Cancels the task.
    func cancel()
}
