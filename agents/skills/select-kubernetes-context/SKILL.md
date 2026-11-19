---
name: select-kubernetes-context
description: >-
  Selects and activates the correct kubectl context for CDON or Fyndiq by platform
  (cdon|fyndiq) and environment (prod|integration|sandbox|dev). Lists local
  contexts, matches names to the requested pair, switches with kubectl config
  use-context, or aborts with an explanation when ambiguous or missing. Use when
  the user asks to switch Kubernetes context, select kube context, use fyndiq/cdon
  prod/integration/sandbox/dev, or align kubectl with a platform and environment.
---

# Select Kubernetes Context

Use this workflow whenever kubectl must target a specific **platform** and **environment**. Do not guess a context name from memory—derive it from `kubectl config get-contexts` on the machine.

## Valid inputs

| Dimension | Allowed values |
|-----------|----------------|
| **Platform** | `cdon`, `fyndiq` only |
| **Environment** | `prod`, `integration`, `sandbox`, `dev` |

**Environment synonyms** (normalize to `dev` before matching):

- `local`, `minikube`, `colima` → `dev`

Reject any other platform or environment label; tell the user and stop.

## 1. Resolve platform

Infer in order; stop at the first clear signal:

1. **User message** — explicit `cdon` / `fyndiq` (word or token).
2. **Repository or path** — e.g. workspace under `fyndiq/*` → `fyndiq`; CDON-specific repos → `cdon`.
3. **If still unknown** — ask the user: “Use platform **cdon** or **fyndiq**?” Do not proceed without an answer.

## 2. Resolve environment

Infer in order:

1. **User message** — `prod`, `production`, `integration`, `sandbox`, `dev`, `development`, `local`, `minikube`, `colima`.
2. Map synonyms: `local` / `minikube` / `colima` → **`dev`**. Map `production` → **`prod`**.
3. **If still unknown** — ask: “Use environment **prod**, **integration**, **sandbox**, or **dev**?”

## 3. List contexts on this machine

Run:

```bash
kubectl config get-contexts
```

Collect every **context name** (first column after the current-marker `*`). Optionally note the **CLUSTER** column (often a `gke_<project>_<region>_<cluster>` string) for matching—same rules apply to both name and cluster text.

## 4. Match platform + environment to exactly one context

Work **case-insensitively** on context name and cluster string combined.

### Platform gate

- **`fyndiq`**: the string must contain `fyndiq`.
- **`cdon`**: the string must contain `cdon`.

If a row matches **both** `fyndiq` and `cdon`, treat as ambiguous.

### Environment gate

Apply to the same text. A row qualifies for:

| Canonical | Match if text contains any of |
|-----------|----------------------------------|
| `prod` | `prod`, `production`, `-prod`, `_prod` — but **not** if it clearly denotes non-production only (e.g. `nonprod` as the sole env signal). Prefer rows that align with “production” clusters used by the org. |
| `integration` | `integration`, `-integration`, `_integration` |
| `sandbox` | `sandbox` |
| `dev` | `dev`, `development`, `local`, `minikube`, `colima`, `docker-desktop`, `kind`, `k3d`, `microk8s` |

**Conflict rule:** If multiple rows pass both gates, **do not pick arbitrarily**. List the candidates and stop with: user must choose or rename contexts.

**Zero matches:** Print the resolved `platform` + `environment`, print the listed contexts, and stop: no suitable context on this machine.

## 5. Switch context

Only after exactly one context is selected:

```bash
kubectl config use-context "<chosen-context-name>"
```

Confirm:

```bash
kubectl config current-context
```

Optional sanity check (cluster column — pattern often used across Fyndiq tooling):

```bash
kubectl config get-contexts "$(kubectl config current-context)" --no-headers
```

## 6. Abort conditions (no `use-context`)

- Platform or environment invalid or unresolved after asking.
- Zero matching contexts.
- More than one matching context without a safe tie-break (always stop and list candidates).

In every abort case, say what was inferred, what was searched for, and show relevant `kubectl config get-contexts` output so the user can fix kubeconfig or clarify.
