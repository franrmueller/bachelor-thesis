package MASTraceability {

  private import MASRequirements::*;
  
  part def Orchestrator;
  part def PlannerAgent;
  part def ResearcherAgent;
  part def AnalystAgent;
  part def ReviewerAgent;
  part def WriterAgent;
  part def Compliance;
  part def Integrations { part mcp; part a2a; part toolProxy; }
  part def Observer;
  part def AuditLog;

  // Test cases
  verification def <'TC-01'> NominalWorkflow {
    objective {
      verify <'FR-01'>; // "execute workflow models" end-to-end orchestration is achieved.
      verify <'FR-02'>; // "parameterized subprocesses" are applied without structure change.
      verify <'FR-18'>; // "integration connectors" used to reach required external systems.
    }
  }
  verification def <'TC-02'> PolicyDenialGate {
    objective {
      verify <'FR-09'>; // Policy engine "validate, veto, or redirect" enforced at runtime.
      verify <'FR-10'>; // "human approval" required for high-risk actions.
    }
  }
  verification def <'TC-03'> ToolTimeoutRetry {
    objective {
      verify <'C-09'>;  // Adapter "timeouts, retries, idempotency keys" enforced to bound side effects.
      verify <'FR-07'>; // "recovery or fallback steps" upon tool/API failure.
    }
  }
  verification def <'TC-04'> AuditReplayIntegrity {
    objective {
      verify <'FR-15'>; // "structured, timestamped events" emitted for key actions.
      verify <'FR-17'>; // "reconstruction and replay" of interactions from logs.
    }
  }
  verification def <'TC-05'> LowConfidenceEscalation {
    objective {
      verify <'FR-05'>; // "escalate unresolved... to human roles" when confidence low.
      verify <'C-03'>;  // "bounded decision autonomy" respected before escalation.
    }
  }

  // <<satisfy>> links

  // Orchestration & Modularity
  satisfy <'FR-01'> by Orchestrator;                 // process orchestration engine
  satisfy <'FR-02'> by Orchestrator;                 // parameterized subprocesses
  satisfy <'FR-02'> by PlannerAgent;                 // planner contributes parameterization
  satisfy <'C-04'>  by Orchestrator;                 // modular process units
  satisfy <'C-05'>  by Orchestrator;                 // interface-based composition (structural governance)

  // Tool Integration
  satisfy <'FR-18'> by Integrations.mcp;             // integration connectors
  satisfy <'FR-18'> by Integrations.a2a;             // integration connectors
  satisfy <'FR-18'> by Integrations.toolProxy;       // integration connectors
  satisfy <'FR-19'> by Integrations.toolProxy;       // agent tool adapters (uniform adapter interface)
  satisfy <'FR-21'> by Orchestrator;                 // data transformation layer applied at orchestration boundary
  satisfy <'C-08'>  by Integrations.toolProxy;       // interface contracts and schemas validated at adapter boundaries
  satisfy <'C-09'>  by Orchestrator;                 // invocation safeguards orchestrated globally
  satisfy <'C-09'>  by Integrations.toolProxy;       // invocation safeguards enforced locally at adapters

  // Governance & Compliance
  satisfy <'FR-09'> by Compliance;                   // policy engine
  satisfy <'FR-10'> by Compliance;                   // risk-based approvals and escalation
  satisfy <'FR-10'> by ReviewerAgent;                // reviewer gates high-impact actions
  satisfy <'FR-11'> by Compliance;                   // compliance mapping and drift checks
  satisfy <'C-01'>  by Compliance;                   // segregation of duties

  // Decision Quality
  satisfy <'FR-12'> by AnalystAgent;                 // evidence-based decision support
  satisfy <'FR-12'> by AuditLog;                     // evidence aggregation trace
  satisfy <'FR-13'> by Orchestrator;                 // rule-enforced decision points
  satisfy <'C-03'>  by Compliance;                   // bounded decision autonomy

  // Observability & Traceability
  satisfy <'FR-14'> by AnalystAgent;                 // decision trace and rationale authored
  satisfy <'FR-14'> by ReviewerAgent;                // decision trace and rationale reviewed
  satisfy <'FR-14'> by AuditLog;                     // decision trace persisted
  satisfy <'FR-15'> by Observer;                     // event logging pipeline instrumentation
  satisfy <'FR-15'> by AuditLog;                     // event sink and storage
  satisfy <'FR-17'> by AuditLog;                     // replay support
  satisfy <'C-07'>  by Observer;                     // agent status self-reporting

  // Exception Handling & Coordination
  satisfy <'FR-04'> by Orchestrator;                 // exception detection and routing
  satisfy <'FR-05'> by ReviewerAgent;                // escalation to human authority
  satisfy <'FR-06'> by Orchestrator;                 // inter-agent communication protocol
  satisfy <'FR-07'> by Integrations.toolProxy;       // tool failure handling via adapters
  satisfy <'FR-08'> by PlannerAgent;                 // conflict resolution via planning
  satisfy <'FR-08'> by ReviewerAgent;                // conflict resolution via adjudication
  satisfy <'C-06'>  by PlannerAgent;                 // explicit coordination model anchored in planner role
}
