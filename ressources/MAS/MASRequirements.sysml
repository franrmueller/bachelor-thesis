package MASRequirements {
  private import Requirements::*;

  // --- Subject system referenced by requirements ---
  part def MAS {
    part orchestrator;
    part agents[*];
    part integrations {
      part mcp;       // MCP adapter layer
      part a2a;       // A2A gateway
      part auditLog;  // immutable audit trail
    }
    part planner;
    part compliance;
    part toolProxy;
    part observer;
  }

  // --- Categories used in thesis ---
  requirement def FunctionalRequirement;
  requirement def Constraint;

  // --- Functional requirements (FR-01..FR-21) ---
  requirement def <'FR-01'> ProcessOrchestrationEngine :> FunctionalRequirement {
    doc /* The system shall execute workflow models by dispatching tasks to human or software actors according to model control flow and business rules. */
  }
  requirement def <'FR-02'> ParameterizedSubprocesses :> FunctionalRequirement {
    doc /* The system shall support parameterized subprocesses and rules so behavioral variants can be expressed without altering the underlying process structure. */
  }
  requirement def <'FR-03'> HumanMachineTaskOrchestration :> FunctionalRequirement {
    doc /* The system shall coordinate both human and automated tasks within the same orchestrated process model. */
  }
  requirement def <'FR-04'> ExceptionDetectionAndRouting :> FunctionalRequirement {
    doc /* The system shall detect deviations from the nominal process and route cases to defined exception subprocesses. */
  }
  requirement def <'FR-05'> EscalationToHumanAuthority :> FunctionalRequirement {
    doc /* The system shall escalate unresolved or unmodeled exceptions to designated human roles with clear ownership. */
  }
  requirement def <'FR-06'> InterAgentCommunicationProtocol :> FunctionalRequirement {
    doc /* The system shall specify message formats and interaction rules for agent collaboration (e.g., direct messaging or shared memory; event-bus/blackboard where asynchronous exchange is required). */
  }
  requirement def <'FR-07'> ToolFailureHandlingInExceptions :> FunctionalRequirement {
    doc /* The system shall validate tool/API outputs and trigger defined recovery or fallback steps when invocations fail. */
  }
  requirement def <'FR-08'> ConflictResolution :> FunctionalRequirement {
    doc /* The system shall provide mechanisms for agents to resolve task or decision conflicts (e.g., delegation to a planner, negotiation, or voting). */
  }
  requirement def <'FR-09'> PolicyEngine :> FunctionalRequirement {
    doc /* The system shall provide a decoupled policy evaluation component that can validate, veto, or redirect workflow executions and agent actions at runtime. */
  }
  requirement def <'FR-10'> RiskBasedApprovalsAndEscalation :> FunctionalRequirement {
    doc /* The system shall require human approval and/or escalation for actions or decisions exceeding defined risk or impact thresholds. */
  }
  requirement def <'FR-11'> ComplianceMappingAndDriftChecks :> FunctionalRequirement {
    doc /* The system shall map actions and policies to applicable regulations or internal rules and perform runtime checks to detect and block compliance drift. */
  }
  requirement def <'FR-12'> EvidenceBasedDecisionSupport :> FunctionalRequirement {
    doc /* The system shall aggregate relevant data at decision points to support evidence-based choices and reduce errors. */
  }
  requirement def <'FR-13'> RuleEnforcedDecisionPoints :> FunctionalRequirement {
    doc /* The system shall enforce business rules and role responsibilities at decision points to ensure consistent, auditable outcomes. */
  }
  requirement def <'FR-14'> DecisionTraceAndRationale :> FunctionalRequirement {
    doc /* The system shall persist a human-readable decision trace for automated or assisted decisions, including inputs, tool/API calls and results, and concise rationale summaries. */
  }
  requirement def <'FR-15'> EventLoggingPipeline :> FunctionalRequirement {
    doc /* The system shall instrument the workflow engine and agents to emit structured, timestamped events for key actions (e.g., prompts, tool/API invocations and results, plan/decision commits, and state changes). */
  }
  requirement def <'FR-16'> DashboardsAndAlerts :> FunctionalRequirement {
    doc /* The system shall provide real-time dashboards and alerting for observability metrics (e.g., execution latency, error/anomaly rates, blocked actions). */
  }
  requirement def <'FR-17'> ReplayForPostHocAnalysis :> FunctionalRequirement {
    doc /* The system shall support reconstruction and replay of workflow and agent interactions from logged events to enable root-cause analysis and explanation of outcomes. */
  }
  requirement def <'FR-18'> IntegrationConnectors :> FunctionalRequirement {
    doc /* The system shall provide connectors to integrate heterogeneous applications and data sources required by the workflows. */
  }
  requirement def <'FR-19'> AgentToolAdapters :> FunctionalRequirement {
    doc /* The system shall expose a uniform adapter interface for agents and workflows to invoke external tools, APIs, databases, or RPA scripts. */
  }
  requirement def <'FR-20'> InterOrganizationalInteroperability :> FunctionalRequirement {
    doc /* The system shall support protocol and interface interoperability suitable for cross-organizational workflows. */
  }
  requirement def <'FR-21'> DataTransformationLayer :> FunctionalRequirement {
    doc /* The system shall provide mapping and transformation capabilities to reconcile data across integrated systems. */
  }

  // --- Constraints (C-01..C-09) ---
  requirement def <'C-01'> SegregationOfDuties :> Constraint {
    doc /* Enforce role-based access control and segregation of duties for configuration changes and sensitive actions. */
  }
  requirement def <'C-02'> AuditLoggingAndRetention :> Constraint {
    doc /* Produce tamper-evident audit trails of agent actions, policy decisions, and configuration changes, retained according to the applicable compliance policy. */
  }
  requirement def <'C-03'> BoundedDecisionAutonomy :> Constraint {
    doc /* Constrain agent decision-making to clearly scoped authority levels aligned with organizational objectives. */
  }
  requirement def <'C-04'> ModularProcessUnits :> Constraint {
    doc /* Structure workflows as modular subprocesses or services that can be reused and reconfigured without redesign. */
  }
  requirement def <'C-05'> InterfaceBasedComposition :> Constraint {
    doc /* Expose clear process and service interfaces compatible with established interoperability standards to enable composition across heterogeneous systems and organizations. */
  }
  requirement def <'C-06'> ExplicitCoordinationModel :> Constraint {
    doc /* Define and enforce a coordination structure (e.g., hierarchical planner–specialists or decentralized collaboration) for multi-agent work. */
  }
  requirement def <'C-07'> AgentStatusSelfReporting :> Constraint {
    doc /* Require agents to periodically self-report status and progress (e.g., current task, step outcome, next planned action). */
  }
  requirement def <'C-08'> InterfaceContractsAndSchemas :> Constraint {
    doc /* Define input/output contracts and validate request/response schemas at adapter boundaries. */
  }
  requirement def <'C-09'> InvocationSafeguards :> Constraint {
    doc /* Enforce adapter-level safeguards (e.g., timeouts, retries, idempotency keys). */
  }

  // Package-scope usages (for grouping)
  requirement FR01 : ProcessOrchestrationEngine;
  requirement FR02 : ParameterizedSubprocesses;
  requirement FR03 : HumanMachineTaskOrchestration;
  requirement FR04 : ExceptionDetectionAndRouting;
  requirement FR05 : EscalationToHumanAuthority;
  requirement FR06 : InterAgentCommunicationProtocol;
  requirement FR07 : ToolFailureHandlingInExceptions;
  requirement FR08 : ConflictResolution;
  requirement FR09 : PolicyEngine;
  requirement FR10 : RiskBasedApprovalsAndEscalation;
  requirement FR11 : ComplianceMappingAndDriftChecks;
  requirement FR12 : EvidenceBasedDecisionSupport;
  requirement FR13 : RuleEnforcedDecisionPoints;
  requirement FR14 : DecisionTraceAndRationale;
  requirement FR15 : EventLoggingPipeline;
  requirement FR16 : DashboardsAndAlerts;
  requirement FR17 : ReplayForPostHocAnalysis;
  requirement FR18 : IntegrationConnectors;
  requirement FR19 : AgentToolAdapters;
  requirement FR20 : InterOrganizationalInteroperability;
  requirement FR21 : DataTransformationLayer;

  requirement C01 : SegregationOfDuties;
  requirement C02 : AuditLoggingAndRetention;
  requirement C03 : BoundedDecisionAutonomy;
  requirement C04 : ModularProcessUnits;
  requirement C05 : InterfaceBasedComposition;
  requirement C06 : ExplicitCoordinationModel;
  requirement C07 : AgentStatusSelfReporting;
  requirement C08 : InterfaceContractsAndSchemas;
  requirement C09 : InvocationSafeguards;

  // Group
  requirement MAS_Spec {
    doc /* Consolidated MAS requirement set for the architecture. */

    require FR01; require FR02; require FR03; require FR04; require FR05;
    require FR06; require FR07; require FR08; require FR09; require FR10;
    require FR11; require FR12; require FR13; require FR14; require FR15;
    require FR16; require FR17; require FR18; require FR19; require FR20; require FR21;

    require C01; require C02; require C03; require C04; require C05;
    require C06; require C07; require C08; require C09;
  }
}
