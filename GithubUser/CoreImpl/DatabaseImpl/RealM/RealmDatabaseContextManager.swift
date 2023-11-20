//
//  RealmDatabaseContextManager.swift
//  GithubUser
//
//  Created by Jabran Siddiqui on 19/11/2023.
//

import RealmSwift
import Foundation

// MARK: Extension on Storable for RealM DB object
/*
 Object is RealM object
 */
extension Object: Storable { }

// MARK: Realm Database Context Manager
/*
 Manage the operation of RealM DB
 */

public class RealmDatabaseContextManager : DatabaseContext {
    
    // Properties
    private var realm: Realm?
    // Initialize Realm
    /// - Parameter realm: Realm Object
    init(realm: Realm? = try? Realm()) {
        self.realm = realm
    }
    
    
    // MARK: Write and Read Functions
    
    func fetch<T>(_ model: T.Type, predicate: NSPredicate?, sorted: Sorted?, completion: (([T]) -> Void)) where T : Storable {
        do {
            guard let realm = self.realm else {
                throw AppErrors.dbIsNotInit
            }
            guard let castType = model as? Object.Type else {
                throw AppErrors.unknown
            }
            var result: Results<Object>
            if let predicate = predicate {
                result = realm.objects(castType).filter(predicate)
            } else {
                result = realm.objects(castType)
            }
            let typeArray: [T] = result.toArray(type: model)
            completion(typeArray)
        } catch _ {
            
        }
    }
    
    func save(object: Storable) throws {
        guard let realm = self.realm else {
            throw AppErrors.dbIsNotInit
        }
        guard let object = object as? Object else {
            throw AppErrors.unknown
        }
        do {
            try realm.write {
                realm.add(object)
            }
        } catch let excep {
            throw AppErrors.other(excep)
        }
        
    }
    func delete<T>(_ model: T.Type, predicate: NSPredicate?) throws where T : Storable {
        guard let realm = self.realm else {
            throw AppErrors.dbIsNotInit
        }
        guard let castType = model as? Object.Type else {
            throw AppErrors.unknown
        }
        var result: Results<Object>
        if let predicate = predicate {
            result = realm.objects(castType).filter(predicate)
        } else {
            result = realm.objects(castType)
        }
        do {
            try realm.write {
                realm.delete(result)
            }
        } catch let excep {
            throw AppErrors.other(excep)
        }
    }
}
