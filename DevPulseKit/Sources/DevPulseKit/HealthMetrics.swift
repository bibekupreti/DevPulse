//
//  HealthMetrics.swift
//  DevPulseKit
//
//  Created by Bibek upreti on 06/05/2026.
//

import Foundation

public struct HealthMetrics: Codable {
    
    // MARK: - Heart
    public let heartRate: Double
    public let heartRateVariability: Double
    public let restingHeartRate: Double
    
    // MARK: - Sleep
    public let sleepHours: Double
    public let sleepQuality: SleepQuality
    
    // MARK: - Activity
    public let minutesSinceLastMovement: Int
    public let stepsToday: Int
    public let activeEnergyBurned: Double
    
    // MARK: - Context
    public let timestamp: Date
    public let minutesSinceLastWaterReminder: Int
    
    public init(
        heartRate: Double,
        heartRateVariability: Double,
        restingHeartRate: Double,
        sleepHours: Double,
        sleepQuality: SleepQuality,
        minutesSinceLastMovement: Int,
        stepsToday: Int,
        activeEnergyBurned: Double,
        timestamp: Date = .now,
        minutesSinceLastWaterReminder: Int = 0
    ) {
        self.heartRate = heartRate
        self.heartRateVariability = heartRateVariability
        self.restingHeartRate = restingHeartRate
        self.sleepHours = sleepHours
        self.sleepQuality = sleepQuality
        self.minutesSinceLastMovement = minutesSinceLastMovement
        self.stepsToday = stepsToday
        self.activeEnergyBurned = activeEnergyBurned
        self.timestamp = timestamp
        self.minutesSinceLastWaterReminder = minutesSinceLastWaterReminder
    }
    
    // MARK: - Computed helpers
    public var heartRateDeviation: Double {
        guard restingHeartRate > 0 else { return 0 }
        return ((heartRate - restingHeartRate) / restingHeartRate) * 100
    }
    
    public var isHRVLow: Bool {
        return heartRateVariability < 20
    }
    
    public var isSleepDeprived: Bool {
        return sleepHours < 6
    }
    
    public var hasBeeenSittingTooLong: Bool {
        return minutesSinceLastMovement > 60
    }
    
    public var needsWaterReminder: Bool {
        return minutesSinceLastWaterReminder > 90
    }
    
    public var timeOfDay: TimeOfDay {
        let hour = Calendar.current.component(.hour, from: timestamp)
        switch hour {
        case 5..<12:  return .morning
        case 12..<17: return .afternoon
        case 17..<21: return .evening
        default:      return .night
        }
    }
}

public enum SleepQuality: String, Codable {
    case poor    = "Poor"
    case fair    = "Fair"
    case good    = "Good"
    case great   = "Great"
}

public enum TimeOfDay: String, Codable {
    case morning   = "Morning"
    case afternoon = "Afternoon"
    case evening   = "Evening"
    case night     = "Night"
}
