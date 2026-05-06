//
//  DevState.swift
//  DevPulseKit
//
//  Created by Bibek upreti on 06/05/2026.
//

public enum DevState: String, Codable, CaseIterable {
    case focus    = "Focus"
    case fatigue  = "Fatigue"
    case overload = "Overload"
    case recovery = "Recovery"
    
    public var emoji: String {
        switch self {
        case .focus:    return "🟢"
        case .fatigue:  return "🟡"
        case .overload: return "🔴"
        case .recovery: return "🔵"
        }
    }
    
    public var description: String {
        switch self {
        case .focus:    return "Good cognitive readiness"
        case .fatigue:  return "Early tiredness detected"
        case .overload: return "Needs rest"
        case .recovery: return "Recovering well"
        }
    }
    
    public var urgency: AlertUrgency {
        switch self {
        case .focus:    return .none
        case .fatigue:  return .low
        case .overload: return .high
        case .recovery: return .medium
        }
    }
}

public enum AlertUrgency: String, Codable {
    case none   = "None"
    case low    = "Low"
    case medium = "Medium"
    case high   = "High"
    
    public var shouldInterrupt: Bool {
        switch self {
        case .none, .low: return false
        case .medium, .high: return true
        }
    }
}
