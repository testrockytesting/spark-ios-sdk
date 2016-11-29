// Copyright 2016 Cisco Systems Inc
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

class Utils {
    
    static func waitBefore(interval: TimeInterval, closure: () -> Void) {
        Thread.sleep(forTimeInterval: interval)
        closure()
    }
    
    static func waitAfter(interval: TimeInterval, closure: () -> Void) {
        closure()
		Thread.sleep(forTimeInterval: interval)
	}
    
    static func wait(interval: TimeInterval) {
		Thread.sleep(forTimeInterval: interval)
	}
    
    static private let SecClass = kSecClass as String
    static private let SecClassGenericPassword = kSecClassGenericPassword as String
    static private let SecClassInternetPassword = kSecClassInternetPassword as String
    static private let SecClassCertificate = kSecClassCertificate as String
    static private let SecClassKey = kSecClassKey as String
    static private let SecClassIdentity = kSecClassIdentity as String
    static private let SecItemClasses: [String] = [SecClassGenericPassword, SecClassInternetPassword, SecClassCertificate, SecClassKey, SecClassIdentity]
    
    static func clearSecureData() {
        for secItemClass in SecItemClasses {
            SecItemDelete([SecClass: secItemClass] as CFDictionary)
        }
    }
}
