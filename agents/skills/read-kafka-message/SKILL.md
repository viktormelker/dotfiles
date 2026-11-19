---
name: read-kafka-message
description: >-
  Reads a Kafka message by ID via the fyndiq/utils avrocat helper script. Ensures
  kubectl targets the right cluster first using select-kubernetes-context (platform
  cdon|fyndiq and env prod|integration|sandbox|dev), then runs read-message.sh with
  -t topic (always required) and the entity ID used as the message key. Use when the user asks to read a
  Kafka message, decode an event from a topic, inspect avrocat payload, or dump a
  message by ID from shop.*, purchase.*, inventory.*, etc.
---

# Read Kafka Message

End-to-end flow: **correct Kubernetes context** → **invoke** `scripts/read-message/read-message.sh` with **`-t <bounded_context>.<entity>.<type>`** (mandatory for this workflow) and the **entity ID** (see section 3).

## Prerequisites

- `kubectl` working and kubeconfig that includes the target cluster.
- `jq` installed (the script formats JSON output).
- Cluster runs an **avrocat** pod (`app=avrocat`).

## 1. Resolve platform and environment

**Read and follow** `agent/skills/tasks/select-kubernetes-context/SKILL.md` completely: infer or confirm **platform** (`cdon` \| `fyndiq`) and **environment**, list contexts, select exactly one match, run `kubectl config use-context`, confirm `kubectl config current-context`.

If context selection **aborts**, stop — do not run the read-message script.

## 2. Resolve Kafka topic (required)

### Topic name shape

Every topic follows:

```text
<bounded_context>.<entity>.<type>
```

Examples: `inventory.article.events`, `purchase.order.commands`, `shop.review.events`.

The **bounded context** and **entity** identify the domain object; the **type** is usually `commands` or `events` (or a stream-specific name such as `snapshot`).

The user **must** supply a topic name. Valid names are the entries in the `choices` array at the top of `scripts/read-message/read-message.sh`.

- If the topic is missing or unclear, ask for it — **do not** rely on interactive `fzf` inside the script.
- If the topic is not in that list, tell the user and stop (or ask them to pick a listed topic).

**Always pass the topic with `-t`** when invoking the script so the topic picker is never shown.

## 3. Resolve message ID

### What “message ID” means

The value passed to the script as the **message ID** is always the **identifier of the `<entity>` segment** in the topic name — the same ID you would use in APIs or DB rows for that entity (often exposed as a field like `{entity}_id` on payloads).

| Topic | Entity segment | Typical source field for the ID |
|-------|----------------|----------------------------------|
| `inventory.article.events` | `article` | `article_id` |
| `purchase.order.commands` | `order` | `order_id` |

**Rule of thumb:** strip the topic to `<bounded_context>.<entity>.<type>`; the message ID is the **entity’s** primary identifier. Map the middle segment to the conventional ID name (`article` → `article_id`, `order` → `order_id`, `merchant` → `merchant_id`, etc.). For hyphenated or compound middle segments (e.g. `share-cart`), infer the matching ID from the user’s context or ask.

The script passes this value through to `just read_message <topic> <message_id>` inside avrocat.

- If the user gave an order reference but no topic, infer or confirm the topic and use **`order_id`** as the message ID when the topic is `purchase.order.*`.
- If the user did not provide an ID, ask before running.
- **Do not** run the script without a message ID in non-interactive flows — the script would block on `read -p` when stdin is not a TTY.

## 4. Optional: Avro headers

If the user wants headers (script flag `-H`), include `-H` on the same invocation as `-t` and the message ID (e.g. `bash … -H -t "<topic>" "<message-id>"`).

## 5. Run the script

Resolve the path to the **fyndiq/utils** checkout:

- If the current workspace is `utils`, run from the **repository root**:
  ```bash
  bash scripts/read-message/read-message.sh -t "<topic>" "<message-id>"
  ```
- Otherwise use an absolute or known path to `scripts/read-message/read-message.sh` inside the user’s utils clone.

**With headers:**

```bash
bash scripts/read-message/read-message.sh -H -t "<topic>" "<message-id>"
```

Do **not** omit `-t`. Every invocation described by this skill includes an explicit topic.

## 6. Failure handling

- **No avrocat pod:** script exits with an error — confirm context (wrong cluster/env) and that avrocat is deployed.
- **jq missing:** install `jq` or report the script’s error text.

For background on the script, see `scripts/read-message/README.md`.
