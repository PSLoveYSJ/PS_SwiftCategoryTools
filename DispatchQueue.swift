//
//  DispatchQueue.swift
//  AboutModel
//
//  Created by Peng on 2019/5/23.
//  Copyright © 2019 PengShuai. All rights reserved.
//

import Foundation


extension DispatchQueue {
    
    /// 全局异步延时操作
    ///
    /// - Parameters:
    ///   - after: 延时时间
    ///   - handler: 执行任务
    public func ps_after(after:Double, handler:@escaping ()->Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + after) {
            handler();
        }
    }
    
    private static var _oncerToken = [String]()
    
    /// DispatchQueue  once
    ///
    /// - Parameters:
    ///   - token: token
    ///   - block: 代码块
    static func ps_once(token : String, block: @escaping () -> Void) {
        
        objc_sync_enter(self)
        
        defer {
            objc_sync_exit(self)
        }
        if _oncerToken.contains(token) {
            return
        }
        _oncerToken.append(token)
        block()
    }
    
    
}
