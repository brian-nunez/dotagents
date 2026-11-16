---
name: go-library-dx
description: >-
  Design or review the public API of a Go library for developer experience.
  Use when creating a Go library or module, adding or changing exported API,
  designing a library with pluggable backends or drivers, or reviewing how a
  Go library feels to use.
---

# Go library DX

The **call site** is the product. A library is judged by the code its users
write: how few concepts they learn, how hard misuse is, how loudly mistakes
fail, and how little changes when they switch backends. Usage patterns are
held to the highest strictness. Internals are held to correctness, tests, and
clarity, and stay free to rewrite.

Hold every decision to one question: what does this make the caller write?

## 1. Write the call sites first

Before any internals, write the caller's code for every primary task the
library exists for: open or construct, the common operations, error
handling, cleanup, and testing code that uses the library. Write them as
real Go in `example_test.go` (`func Example...`), so they compile and run
as documentation.

Cover the **golden path** (the few lines most users will write) and the
first two things that go wrong (a missing value, a failed backend call).

Completion criterion: every primary task has a compiling `Example`, and
each golden path fits in a handful of lines with no setup the library could
have defaulted.

## 2. Hold the call sites to the usage rules

Read [`usage-rules.md`](references/usage-rules.md) and apply every rule to the
examples from step 1. Each rule pairs a good call site with the bad one it
replaces: a call site shaped like a bad example fails the rule. Rewrite the
examples, never the rules, until each one passes. For a library with more than one backend, driver, or provider, also
read [`backends.md`](references/backends.md) and apply every rule there.

Completion criterion: every rule in each file you read is marked pass, or
marked not applicable with a one-line reason, with the call site that shows
it.

## 3. Build the internals behind the call sites

Implement whatever makes the approved call sites true. Internals follow the
repository's conventions and are judged on correctness and tests. Keep them
unexported unless a call site needs them: every exported identifier is a
promise.

When an internal limit forces a change to a call site, stop and redesign
the call site in step 2. The call site wins every conflict with the
internals.

Completion criterion: the step 1 examples pass unchanged as tests.

## 4. Lock the usage in

- Keep the step 1 examples as `Example` tests, so the documentation cannot
  drift from the API.
- A library with backends ships a conformance suite that every backend runs
  (see [`backends.md`](references/backends.md)).
- The README opens with the golden path, then the tasks in the order a user
  meets them, and documents behavior a caller can observe: defaults, errors,
  concurrency, and every place where backends differ.
- godoc on every exported identifier says what the caller gets and what the
  caller owns, including zero-value and concurrency behavior.

Completion criterion: `go test ./...` runs every example, and the README
alone lets a new user install, use, and handle errors.

## 5. Review

For a design review or a change to exported API, report each usage rule as
pass, fail, or not applicable, with the call site as evidence. A failure is
a usage defect: list it ahead of any internal finding, and propose the
corrected call site in code. Internal findings follow, ranked by risk.

Completion criterion: every rule has a verdict and evidence, and every
failure comes with a corrected call site.
