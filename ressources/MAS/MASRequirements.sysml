package MASRequirements {
  private import Requirements::*;

  // --- Multi-Agent System ---
  part def MAS;

  // ==================================================
  // Governance & Compliance
  // ==================================================
  package GovernanceAndCompliance {

    requirement def FR_09_PolicyEngine {
      attribute id = "FR-09";
      attribute title = "Policy engine";
      attribute intent = "Functional";
      attribute cluster = "GovernanceAndCompliance";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Analysis"; // to be refined in §5
      subject soi : MAS;
      doc /* The system shall provide a decoupled policy evaluation component that can validate, veto, or redirect workflow executions and agent actions at runtime. */
    }

    requirement def FR_10_RiskBasedApprovalsAndEscalation {
      attribute id = "FR-10";
      attribute title = "Risk-based approvals & escalation";
      attribute intent = "Functional";
      attribute cluster = "GovernanceAndCompliance";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall require human approval and/or escalation for actions or decisions exceeding defined risk or impact thresholds. */
    }

    requirement def FR_11_ComplianceMappingAndDriftChecks {
      attribute id = "FR-11";
      attribute title = "Compliance mapping & drift checks";
      attribute intent = "Functional";
      attribute cluster = "GovernanceAndCompliance";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Analysis";
      subject soi : MAS;
      doc /* The system shall map actions and policies to applicable regulations or internal rules and perform runtime checks to detect and block compliance drift. */
    }

    requirement def C_01_SegregationOfDuties {
      attribute id = "C-01";
      attribute title = "Segregation of duties";
      attribute intent = "Constraint";
      attribute cluster = "GovernanceAndCompliance";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Inspection";
      subject soi : MAS;
      doc /* Enforce role-based access control and segregation of duties for configuration changes and sensitive actions. */
    }

    requirement def C_02_AuditLoggingAndRetention {
      attribute id = "C-02";
      attribute title = "Audit logging & retention";
      attribute intent = "Constraint";
      attribute cluster = "GovernanceAndCompliance";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Inspection";
      subject soi : MAS;
      doc /* Produce tamper-evident audit trails of agent actions, policy decisions, and configuration changes, retained according to the applicable compliance policy. */
    }
  }

  // ==================================================
  // Decision Quality
  // ==================================================
  package DecisionQuality {

    requirement def FR_12_EvidenceBasedDecisionSupport {
      attribute id = "FR-12";
      attribute title = "Evidence-based decision support";
      attribute intent = "Functional";
      attribute cluster = "DecisionQuality";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall aggregate relevant data at decision points to support evidence-based choices and reduce errors. */
    }

    requirement def FR_13_RuleEnforcedDecisionPoints {
      attribute id = "FR-13";
      attribute title = "Rule-enforced decision points";
      attribute intent = "Functional";
      attribute cluster = "DecisionQuality";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* The system shall enforce business rules and role responsibilities at decision points to ensure consistent, auditable outcomes. */
    }

    requirement def C_03_BoundedDecisionAutonomy {
      attribute id = "C-03";
      attribute title = "Bounded decision autonomy";
      attribute intent = "Constraint";
      attribute cluster = "DecisionQuality";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Analysis";
      subject soi : MAS;
      doc /* Constrain agent decision-making to clearly scoped authority levels aligned with organizational objectives. */
    }
  }

  // ==================================================
  // Orchestration & Modularity
  // ==================================================
  package OrchestrationAndModularity {

    requirement def FR_01_ProcessOrchestrationEngine {
      attribute id = "FR-01";
      attribute title = "Process orchestration engine";
      attribute intent = "Functional";
      attribute cluster = "OrchestrationAndModularity";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall execute workflow models by dispatching tasks to human or software actors according to model control flow and business rules. */
    }

    requirement def FR_02_ParameterizedSubprocesses {
      attribute id = "FR-02";
      attribute title = "Parameterized subprocesses";
      attribute intent = "Functional";
      attribute cluster = "OrchestrationAndModularity";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Analysis";
      subject soi : MAS;
      doc /* The system shall support parameterized subprocesses and rules so behavioral variants can be expressed without altering the underlying process structure. */
    }

    requirement def FR_03_HumanMachineTaskOrchestration {
      attribute id = "FR-03";
      attribute title = "Human–machine task orchestration";
      attribute intent = "Functional";
      attribute cluster = "OrchestrationAndModularity";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall coordinate both human and automated tasks within the same orchestrated process model. */
    }

    requirement def C_04_ModularProcessUnits {
      attribute id = "C-04";
      attribute title = "Modular process units";
      attribute intent = "Constraint";
      attribute cluster = "OrchestrationAndModularity";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Inspection";
      subject soi : MAS;
      doc /* Structure workflows as modular subprocesses or services that can be reused and reconfigured without redesign. */
    }

    requirement def C_05_InterfaceBasedComposition {
      attribute id = "C-05";
      attribute title = "Interface-based composition";
      attribute intent = "Constraint";
      attribute cluster = "OrchestrationAndModularity";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Analysis";
      subject soi : MAS;
      doc /* Expose clear process and service interfaces compatible with established interoperability standards to enable composition across heterogeneous systems and organizations. */
    }
  }

  // ==================================================
  // Exception Handling & Coordination
  // ==================================================
  package ExceptionHandlingAndCoordination {

    requirement def FR_04_ExceptionDetectionAndRouting {
      attribute id = "FR-04";
      attribute title = "Exception detection & routing";
      attribute intent = "Functional";
      attribute cluster = "ExceptionHandlingAndCoordination";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* The system shall detect deviations from the nominal process and route cases to defined exception subprocesses. */
    }

    requirement def FR_05_EscalationToHumanAuthority {
      attribute id = "FR-05";
      attribute title = "Escalation to human authority";
      attribute intent = "Functional";
      attribute cluster = "ExceptionHandlingAndCoordination";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall escalate unresolved or unmodeled exceptions to designated human roles with clear ownership. */
    }

    requirement def FR_06_InterAgentCommunicationProtocol {
      attribute id = "FR-06";
      attribute title = "Inter-agent communication protocol";
      attribute intent = "Functional";
      attribute cluster = "ExceptionHandlingAndCoordination";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* The system shall specify message formats and interaction rules for agent collaboration (e.g., direct messaging or shared memory; event-bus/blackboard where asynchronous exchange is required). */
    }

    requirement def FR_07_ToolFailureHandlingInExceptions {
      attribute id = "FR-07";
      attribute title = "Tool failure handling in exceptions";
      attribute intent = "Functional";
      attribute cluster = "ExceptionHandlingAndCoordination";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* The system shall validate tool/API outputs and trigger defined recovery or fallback steps when invocations fail. */
    }

    requirement def FR_08_ConflictResolution {
      attribute id = "FR-08";
      attribute title = "Conflict resolution";
      attribute intent = "Functional";
      attribute cluster = "ExceptionHandlingAndCoordination";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall provide mechanisms for agents to resolve task or decision conflicts (e.g., delegation to a planner, negotiation, or voting). */
    }

    requirement def C_06_ExplicitCoordinationModel {
      attribute id = "C-06";
      attribute title = "Explicit coordination model";
      attribute intent = "Constraint";
      attribute cluster = "ExceptionHandlingAndCoordination";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Analysis";
      subject soi : MAS;
      doc /* Define and enforce a coordination structure (e.g., hierarchical planner–specialists or decentralized collaboration) for multi-agent work. */
    }
  }

  // ==================================================
  // Observability & Traceability
  // ==================================================
  package ObservabilityAndTraceability {

    requirement def FR_14_DecisionTraceAndRationale {
      attribute id = "FR-14";
      attribute title = "Decision trace & rationale";
      attribute intent = "Functional";
      attribute cluster = "ObservabilityAndTraceability";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Inspection";
      subject soi : MAS;
      doc /* The system shall persist a human-readable decision trace for automated or assisted decisions, including inputs, tool/API calls and results, and concise rationale summaries. */
    }

    requirement def FR_15_EventLoggingPipeline {
      attribute id = "FR-15";
      attribute title = "Event logging pipeline";
      attribute intent = "Functional";
      attribute cluster = "ObservabilityAndTraceability";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Inspection";
      subject soi : MAS;
      doc /* The system shall instrument the workflow engine and agents to emit structured, timestamped events for key actions (e.g., prompts, tool/API invocations and results, plan/decision commits, and state changes). */
    }

    requirement def FR_16_DashboardsAndAlerts {
      attribute id = "FR-16";
      attribute title = "Dashboards & alerts";
      attribute intent = "Functional";
      attribute cluster = "ObservabilityAndTraceability";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall provide real-time dashboards and alerting for observability metrics (e.g., execution latency, error/anomaly rates, blocked actions). */
    }

    requirement def FR_17_ReplayForPostHocAnalysis {
      attribute id = "FR-17";
      attribute title = "Replay for post-hoc analysis";
      attribute intent = "Functional";
      attribute cluster = "ObservabilityAndTraceability";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall support reconstruction and replay of workflow and agent interactions from logged events to enable root-cause analysis and explanation of outcomes. */
    }

    requirement def C_07_AgentStatusSelfReporting {
      attribute id = "C-07";
      attribute title = "Agent status self-reporting";
      attribute intent = "Constraint";
      attribute cluster = "ObservabilityAndTraceability";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* Require agents to periodically self-report status and progress (e.g., current task, step outcome, next planned action). */
    }
  }

  // ==================================================
  // Tool Integration
  // ==================================================
  package ToolIntegration {

    requirement def FR_18_IntegrationConnectors {
      attribute id = "FR-18";
      attribute title = "Integration connectors";
      attribute intent = "Functional";
      attribute cluster = "ToolIntegration";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Demonstration";
      subject soi : MAS;
      doc /* The system shall provide connectors to integrate heterogeneous applications and data sources required by the workflows. */
    }

    requirement def FR_19_AgentToolAdapters {
      attribute id = "FR-19";
      attribute title = "Agent tool adapters";
      attribute intent = "Functional";
      attribute cluster = "ToolIntegration";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* The system shall expose a uniform adapter interface for agents and workflows to invoke external tools, APIs, databases, or RPA scripts. */
    }

    requirement def FR_20_InterOrganizationalInteroperability {
      attribute id = "FR-20";
      attribute title = "Inter-organizational interoperability";
      attribute intent = "Functional";
      attribute cluster = "ToolIntegration";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Analysis";
      subject soi : MAS;
      doc /* The system shall support protocol and interface interoperability suitable for cross-organizational workflows. */
    }

    requirement def FR_21_DataTransformationLayer {
      attribute id = "FR-21";
      attribute title = "Data transformation layer";
      attribute intent = "Functional";
      attribute cluster = "ToolIntegration";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* The system shall provide mapping and transformation capabilities to reconcile data across integrated systems. */
    }

    requirement def C_08_InterfaceContractsAndSchemas {
      attribute id = "C-08";
      attribute title = "Interface contracts & schemas";
      attribute intent = "Constraint";
      attribute cluster = "ToolIntegration";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Inspection";
      subject soi : MAS;
      doc /* Define input/output contracts and validate request/response schemas at adapter boundaries. */
    }

    requirement def C_09_InvocationSafeguards {
      attribute id = "C-09";
      attribute title = "Invocation safeguards";
      attribute intent = "Constraint";
      attribute cluster = "ToolIntegration";
      attribute source = "Consolidation §4.2 / Appendix A.1";
      attribute plannedVerification = "Test";
      subject soi : MAS;
      doc /* Enforce adapter-level safeguards (e.g., timeouts, retries, idempotency keys). */
    }
  }
}
