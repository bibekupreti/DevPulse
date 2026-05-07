//
//  StateSnapshot.swift
//  DevPulseKit
//
//  Created by Bibek upreti on 06/05/2026.
//

import Foundation

public struct StateSnapshot: Codable, Identifiable {
    public let id: UUID
    public let state: DevState
    public let metrics: HealthMetrics
    public let timestamp: Date
    public let recommendations: [String]
    public let exercises: [String]
    
    public init(
        id: UUID = UUID(),
        state: DevState,
        metrics: HealthMetrics,
        timestamp: Date = .now,
        recommendations: [String] = [],
        exercises: [String] = []
    ) {
        self.id = id
        self.state = state
        self.metrics = metrics
        self.timestamp = timestamp
        self.recommendations = recommendations
        self.exercises = exercises
    }
    
    public var formattedTime: String {
        timestamp.formatted(date: .omitted, time: .shortened)
    }
    
    public var formattedDate: String {
        timestamp.formatted(date: .abbreviated, time: .omitted)
    }
}
