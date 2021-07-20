//
//  UserDefaultsHelper.swift
//  FastrAppiOS
//
//  Created by Deepak Kumar on 7/19/21.
//  Copyright © 2021 Deepak Kumar. All rights reserved.
//

import Foundation

struct TestResultItem {
    var faceResult: Bool
    var balanceResult: Bool
    var tapResult: Bool
}

class UserDefaultHelper {
    
    let currentEntryIdKey = "currentEntryId"
    var currentEntryId = 0
    let balanceChangeKey = "hasBalanceChange"
    let leftTapKey = "leftFingerTaps"
    let rightTapKey = "rightFingerTaps"
    let tapsDiffThreshold = 0.5
    
    init() {
        currentEntryId = UserDefaults.standard.value(forKey: currentEntryIdKey) as? Int ?? 0
    }
    
    func setBalanceResult(result: Bool) {
        let balanceKeyString = "\(balanceChangeKey)_\(currentEntryId)"
        UserDefaults.standard.setValue(result, forKey: balanceKeyString)
    }
    
    func setLeftHandTapResult(result: [Double]) {
        let leftTapsKey = "\(leftTapKey)_\(currentEntryId)"
        UserDefaults.standard.setValue(result, forKey: leftTapsKey)
    }
    
    func setRightHandTapResult(result: [Double]) {
        let rightTapsKey = "\(rightTapKey)_\(currentEntryId)"
        UserDefaults.standard.setValue(result, forKey: rightTapsKey)
    }
    
    private func getBalanceResult(entryId: Int) -> Bool {
        return UserDefaults.standard.value(forKey: "\(balanceChangeKey)_\(entryId)") as? Bool ?? false
    }
    
    private func getTapResult(entryId: Int) -> Bool {
        let leftTaps = UserDefaults.standard.value(forKey: "\(leftTapKey)_\(entryId)") as? [Double] ?? []
        let rightTaps = UserDefaults.standard.value(forKey: "\(rightTapKey)_\(entryId)") as? [Double] ?? []
        for i in 0...leftTaps.count {
            let leftTap = leftTaps[i]
            let rightTap = rightTaps[i]
            if (abs(leftTap - rightTap) > tapsDiffThreshold) {
                return true
            }
        }
        return false
    }
    
    func appendEntryId() {
        currentEntryId+=1
        UserDefaults.standard.setValue(currentEntryId, forKey: currentEntryIdKey)
        currentEntryId = UserDefaults.standard.value(forKey: currentEntryIdKey) as? Int ?? 0
    }
    
    func retrieveAllTestResults() -> [TestResultItem] {
        var results: [TestResultItem] = []
        for n in 0...currentEntryId {
            let faceResultForEntry = false
            let balanceResultForEntry = getBalanceResult(entryId: n)
            let tapResultForEntry = getTapResult(entryId: n)
            results.append(TestResultItem(faceResult: faceResultForEntry, balanceResult: balanceResultForEntry, tapResult: tapResultForEntry))
        }
        return results
    }
}
