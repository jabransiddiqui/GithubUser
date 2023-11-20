//
//  RealmDatabaseExtension.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 19/11/2023.
//

import RealmSwift

// Uncomment this for clone
protocol DetachableObject: AnyObject {
    /// Clone of Realm Object
    func detached() -> Self
}
extension Results {
    /// Convert Realm Arrat To Swift Array
    /// - Parameter type: Realm Array
    /// - Returns: Swift Array
    func toArray<T>(type: T.Type) -> [T] {
        return compactMap { $0 as? T }
        
    }
}

extension Object: DetachableObject {
    func detached() -> Self {
        let detached = type(of: self).init()
        for property in objectSchema.properties {
            guard let value = value(forKey: property.name) else {
                continue
            }
            if let detachable = value as? DetachableObject {
                detached.setValue(detachable.detached(), forKey: property.name)
            } else { // Then it is a primitive
                detached.setValue(value, forKey: property.name)
            }
        }
        return detached
    }
}

extension Array where Element: DetachableObject {
    func detached() -> [Element] {
        var result = [Element]()
        forEach {
            result.append($0.detached())
        }
        return result
    }
}
