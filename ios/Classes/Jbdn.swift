//
//  Jbdn.swift
//  flutter_root_detection
//
//  Created by Alann Maulana on 15/01/21.
//

import Foundation
import UIKit

class Jbdn: NSObject {
    static func ijb() -> Bool {
#if !(TARGET_IPHONE_SIMULATOR)
        if let file = fopen("/Applications/Cydia.app", "r") {
            fclose(file)
            return true
        }
        
        if let file = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r") {
            fclose(file)
            return true
        }
        
        if let file = fopen("/bin/bash", "r") {
            fclose(file)
            return true
        }
        
        if let file = fopen("/usr/sbin/sshd", "r") {
            fclose(file)
            return true
        }
        
        if let file = fopen("/etc/apt", "r") {
            fclose(file)
            return true
        }
        
        if let file = fopen("/usr/bin/ssh", "r") {
            fclose(file)
            return true
        }
        
        let fileManager = FileManager.default;

        if fileManager.fileExists(atPath: "/Applications/Cydia.app") {
            return true
        } else if fileManager.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") {
            return true
        } else if fileManager.fileExists(atPath: "/bin/bash") {
           return true
        } else if fileManager.fileExists(atPath: "/usr/sbin/sshd") {
           return true
        } else if fileManager.fileExists(atPath: "/etc/apt") {
           return true
        } else if fileManager.fileExists(atPath: "/usr/bin/ssh") {
           return true
        }
        
        // Check if the app can access outside of its sandbox
        let string: String = ".";
        
        do {
            try string.write(toFile: "/private/jailbreak.txt", atomically: true, encoding: String.Encoding.utf8)
            try fileManager.removeItem(atPath: "/private/jailbreak.txt")
        } catch _ {
            return true
        }
        
        // Check if the app can open a Cydia's URL scheme
        if let url = URL(string: "cydia://package/com.example.package"), UIApplication.shared.canOpenURL(url) {
            return true
        }
#endif
        return false
    }
}
