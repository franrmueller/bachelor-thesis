package MASArchitectureFigure {

  // (No requirements imported here — this file is just the structure for the figure)

  // Tiny untyped port (same style as your main model)
  port def TaskIO { in item task; out item result; }

  // --- Elements named exactly as in the thesis ---
  part def Orchestrator   { port api : TaskIO; }

  // Specialist roles
  part def ResearcherAgent { port io : TaskIO; }
  part def AnalystAgent    { port io : TaskIO; }
  part def ReviewerAgent   { port io : TaskIO; }
  part def WriterAgent     { port io : TaskIO; }

  // Integration & governance
  part def MCPAdapter     { port io : TaskIO; }   // MCP
  part def A2AGateway     { port io : TaskIO; }   // A2A
  part def PolicyEngine   { port io : TaskIO; }
  part def ApprovalGate   { port io : TaskIO; }
  part def AuditLog       { port io : TaskIO; }

  // --- Simple high-level system (no nesting tricks) ---
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

    // Orchestrator interfaces with integration/governance/observability
    connect orchestrator.api to mcp.io;
    connect orchestrator.api to a2a.io;
    connect orchestrator.api to policy.io;
    connect orchestrator.api to approval.io;
    connect orchestrator.api to auditLog.io;
  }

} // end package
