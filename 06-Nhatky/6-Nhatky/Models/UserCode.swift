//
//  UserCode.swift
//  6-Nhatky
//
//  Created by quynhlx on 2019/12/21.
//  Copyright © 2019 Le Xuan Quynh. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct UserCode: Identifiable {
    let id: String
    var code: String?
    var isEnable: String?    
    
    init(code: String?, isEnable: String?) {
        self.code = code
        self.isEnable = isEnable
        self.id = code ?? ""
    }
    
    init?(snapshot: DataSnapshot) {
        guard
        let value = snapshot.value as? [String: AnyObject],
        let code = value["code"] as? String,
        let isEnable = value["isEnable"] as? String
        else {
            return nil
        }
      
        self.code = code
        self.isEnable = isEnable
        self.id = code
    }
    
    func toAnyObject() -> Any {
        return [           
            "code": code,
            "isEnable": isEnable
        ]
    }
}
