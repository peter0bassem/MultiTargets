//
//  Resource.swift
//
//
//  Created by iCommunity app on 09/09/2024.
//

import Foundation
import UtilLayer

public class Resource<T> {
    public var data: T?
    public var status: APIStatus
    public var message: String?
    
    public init(data: T? = nil, status: APIStatus, message: String? = nil) {
        self.data = data
        self.status = status
        self.message = message
    }
    
    public class Loading: Resource {
        public init() {
            super.init(status: .LOADING)
        }
    }
    
    public class Success: Resource {
        public init(data: T? = nil) {
            super.init(data: data, status: .SUCCESS)
        }
    }
    
    public class Error: Resource {
        public init(message: String?) {
            super.init(status: .ERROR, message: message)
        }
    }
    
    public class Failed: Resource {
        public init(message: String? = nil, data: T? = nil) {
            super.init(data: data, status: .FAILED, message: message)
        }
    }
    
    public class EMPTY: Resource {
        public init() {
            super.init(status: .EMPTY)
        }
    }
}
