// TokenUsage.swift
// Swarm Framework
//
// Token usage statistics for inference calls.

import Foundation

// MARK: - TokenUsage

/// Token usage statistics for a generation.
///
/// Tracks input and output token counts for monitoring
/// and cost estimation purposes.
public struct TokenUsage: Sendable, Equatable, Codable {
    /// Number of tokens in the input/prompt.
    public let inputTokens: Int

    /// Number of tokens in the output/response.
    public let outputTokens: Int

    /// Input tokens served from the provider's prompt cache (subset of inputTokens).
    public let cachedTokens: Int?

    /// Output tokens used for internal reasoning (subset of outputTokens; e.g. o-series models).
    public let reasoningTokens: Int?

    /// Total tokens used (input + output).
    public var totalTokens: Int {
        inputTokens + outputTokens
    }

    /// Creates token usage statistics.
    /// - Parameters:
    ///   - inputTokens: Input token count.
    ///   - outputTokens: Output token count.
    ///   - cachedTokens: Cached input tokens (optional).
    ///   - reasoningTokens: Reasoning output tokens (optional).
    public init(
        inputTokens: Int,
        outputTokens: Int,
        cachedTokens: Int? = nil,
        reasoningTokens: Int? = nil
    ) {
        self.inputTokens = inputTokens
        self.outputTokens = outputTokens
        self.cachedTokens = cachedTokens
        self.reasoningTokens = reasoningTokens
    }
}

// MARK: - TokenUsage + CustomStringConvertible

extension TokenUsage: CustomStringConvertible {
    public var description: String {
        "TokenUsage(input: \(inputTokens), output: \(outputTokens), total: \(totalTokens))"
    }
}
