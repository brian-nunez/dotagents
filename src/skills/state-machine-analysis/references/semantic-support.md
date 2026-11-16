# Semantic support extension: Go

Use semantic tools when available to improve navigation and evidence collection. This
is an optional extension to source-based discovery, not a prerequisite for the report.
Only Go has a supported discovery adapter in this version. The adapter here is guidance
for available tools, not a bundled executable or a dependency on `local-review`.

## Capability preflight

Inspect the environment's available navigation tools and their supported scope. Record
server/tool identity and version when obtainable, workspace/module roots, build settings,
loaded packages, and failed queries. Check definitions, references, implementations,
symbols, and file/package context independently; availability varies by interface.

If native `gopls` MCP is already available, its tools may include `go_workspace`,
`go_search`, `go_file_context`, `go_package_api`, `go_symbol_references`, and
`go_diagnostics`. Inspect advertised schemas rather than assuming names, arguments, or
response formats. A standard LSP client is also suitable. Diagnostic output is evidence
about tool/package health; compiler success is not a prerequisite for inspecting source.

Use existing read/navigation capabilities. Installation or configuration changes are
separate work; absence of a server is a coverage limitation and triggers source fallback.
Starting/querying a server can involve package loading and caches: respect repository
execution/network permissions, and never equate an allowlist with a process sandbox.

## Collect evidence

1. Anchor each candidate to an exact declaration position and qualified identity.
   Name search seeds candidates; same-named results do not prove symbol identity.
2. Resolve references and candidate implementations; retain source locations and raw
   evidence references. Inspect source to distinguish reads/writes/guards and applicability.
3. Follow package/context information to additional in-scope surfaces. Explicitly load
   relevant files/packages when the server loads lazily; empty results alone cannot prove
   absence of references or machines.
4. Account for each Go module and build/configuration variant. Use appropriate workspace
   context; an isolated module view can help diagnose loading failures but may change
   cross-module semantics. Record that distinction instead of silently replacing views.
5. Normalize results into the shared evidence register: revision, location, semantic
   identity, query kind/scope, result, supported assertion, and limitations. Keep errors,
   partial results, parse failures, and uninspected modules visible in the coverage ledger.

Bound query concurrency and duration. On failure, preserve collected evidence, downgrade
coverage, and continue source inspection. Distinguish **no matches**, **unsupported**,
**failed**, **truncated**, and **not inspected**. Treat prose-parsed results as potentially
incomplete unless the adapter can establish full parsing; preserve provenance.

References do not supply a complete call/data-flow graph. Following a call does not prove
the branch is reachable; implementation lookup does not resolve runtime dependency wiring.
Cross-application event/HTTP/SQL links require contract and source evidence independently.

## Future adapter seam

Keep language-specific collection in a separate reference or adapter. A future adapter
must declare its languages and capabilities, discover state representations and uses,
resolve semantic identities where supported, and emit the same evidence/coverage fields.
It may provide stronger compiler or data-flow evidence without changing machine IDs,
transition contracts, uncertainty labels, or report structure. Add languages only when
requested and behaviorally evaluated. Non-Go internals remain uninspected external
boundaries now; their observable contracts can still participate in a Go journey.

## Design provenance

The useful patterns from [local-review](https://github.com/brian-nunez/local-review/tree/b111c701b9f556a328b97b3aadbe57fa5e5d1427)
are syntax seeds, persistent semantic sessions, reference/implementation evidence, and
visible lookup failures. Adapt its changed-declaration scope to whole-scope discovery.
Keep uncertain candidates instead of using review-confidence suppression, and inspect
relevant generated persistence/protocol code. Its impact neighborhood is not a state
machine extractor. No code or runtime dependency from that project is required here.
