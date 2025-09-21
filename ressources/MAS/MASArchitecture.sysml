package MASArchitecture {

  // Use the same requirements you defined in your thesis/model
  private import MASRequirements::*;

  // Tiny, untyped port (same style as your main model)
  port def TaskIO { in item task; out item result; }

  // --- Elements named exactly like in the thesis ---
  part def Orchestrator     { port api : TaskIO; }

  // specialist roles
  part def ResearcherAgent  { port io  : TaskIO; }
  part def AnalystAgent     { port io  : TaskIO; }
  part def ReviewerAgent    { port io  : TaskIO; }
  part def WriterAgent      { port io  : TaskIO; }

  // integration & governance
  part def MCPAdapter       { port io  : TaskIO; }   // MCP
  part def A2AGateway       { port io  : TaskIO; }   // A2A
  part def PolicyEngine     { port io  : TaskIO; }   // FR09 (policy)
  part def ApprovalGate     { port io  : TaskIO; }   // FR10 (human approval)
  part def AuditLog         { port io  : TaskIO; }   // observability & audit

  // --- Minimal high-level system (no extra nesting) ---
  part def MAS_Figure {
    part orchestrator : Orchestrator;

    // roles
    part researcher : ResearcherAgent;
    part analyst    : AnalystAgent;
    part reviewer   : ReviewerAgent;
    part writer     : WriterAgent;

    // integration & governance
    part mcp      : MCPAdapter;
    part a2a      : A2AGateway;
    part policy   : PolicyEngine;
    part approval : ApprovalGate;
    part auditLog : AuditLog;
  }

  // --- One instance + obvious connections only ---
  part system : MAS_Figure {
    // Orchestrator coordinates specialists
    connect orchestrator.api to researcher.io;
    connect orchestrator.api to analyst.io;
    connect orchestrator.api to reviewer.io;
    connect orchestrator.api to writer.io;

    // Orchestrator touches integration / governance / audit
    connect orchestrator.api to mcp.io;
    connect orchestrator.api to a2a.io;
    connect orchestrator.api to policy.io;
    connect orchestrator.api to approval.io;
    connect orchestrator.api to auditLog.io;
  }

  // --- Small, manager-friendly satisfy set (maps to your thesis text) ---
  part satisfactionContext {
    // orchestration core
    satisfy requirement FR01 by system.orchestrator;

    // roles (one-liners, easy to defend)
    satisfy requirement FR12 by system.researcher;   // evidence at decisions
    satisfy requirement FR07 by system.analyst;      // tool failure handling
    satisfy requirement FR11 by system.reviewer;     // compliance mapping & drift checks
    satisfy requirement FR13 by system.reviewer;     // rule-enforced decision points
    satisfy requirement FR14 by system.reviewer;     // decision trace in review
    satisfy requirement FR14 by system.writer;       // trace carried into outputs

    // governance & risk
    satisfy requirement FR09 by system.policy;       // decoupled policy engine
    satisfy requirement C01  by system.policy;       // segregation of duties
    satisfy requirement C03  by system.policy;       // bounded decision autonomy
    satisfy requirement FR10 by system.approval;     // human approval/escalation

    // interoperability
    satisfy requirement FR18 by system.mcp;          // integration connectors
    satisfy requirement FR19 by system.mcp;          // agent tool adapters
    satisfy requirement FR21 by system.mcp;          // data transformation
    satisfy requirement FR06 by system.a2a;          // inter-agent protocol
    satisfy requirement FR20 by system.a2a;          // inter-org interoperability

    // observability & audit
    satisfy requirement FR15 by system.auditLog;     // event logging pipeline
    satisfy requirement FR17 by system.auditLog;     // replay
    satisfy requirement C02  by system.auditLog;     // audit logging & retention
  }

} // end package
