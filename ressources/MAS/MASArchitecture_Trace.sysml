package MASArchitectureTrace {

  // Reuse your clean figure parts + your requirement IDs
  private import MASArchitectureFigure::*;
  private import MASRequirements::*;

  // Reuse the same simple system from the figure
  part system : MAS_Figure;

  // Minimal, jury-friendly mapping (only the key FR/Cs)
  part satisfactionContext {

    // Core orchestration
    satisfy requirement FR01 by system.orchestrator;

    // Roles
    satisfy requirement FR12 by system.researcher;   // evidence at decisions
    satisfy requirement FR07 by system.analyst;      // tool failure handling
    satisfy requirement FR11 by system.reviewer;     // compliance checks
    satisfy requirement FR13 by system.reviewer;     // rule-enforced gates
    satisfy requirement FR14 by system.reviewer;     // decision trace during review
    satisfy requirement FR14 by system.writer;       // trace carried into outputs

    // Governance & risk
    satisfy requirement FR09 by system.policy;       // policy engine
    satisfy requirement C01  by system.policy;       // segregation of duties
    satisfy requirement C03  by system.policy;       // bounded autonomy
    satisfy requirement FR10 by system.approval;     // human approvals/escalation

    // Interoperability (integration layer)
    satisfy requirement FR18 by system.mcp;          // integration connectors
    satisfy requirement FR19 by system.mcp;          // agent/tool adapters
    satisfy requirement FR21 by system.mcp;          // data transformation
    satisfy requirement FR06 by system.a2a;          // inter-agent protocol
    satisfy requirement FR20 by system.a2a;          // inter-org interoperability

    // Observability & audit
    satisfy requirement FR15 by system.auditLog;     // event logging pipeline
    satisfy requirement FR17 by system.auditLog;     // replay
    satisfy requirement C02  by system.auditLog;     // audit logging & retention
  }
}
