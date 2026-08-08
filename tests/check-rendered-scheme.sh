#!/usr/bin/env bash
set -euo pipefail

scheme="${1:?usage: check-rendered-scheme.sh PATH}"

jq -e . "$scheme" >/dev/null

jq -e '
    [.rules[].name]
    | group_by(.)
    | map(select(length > 1))
    | length == 0
' "$scheme" >/dev/null

jq -e '
    [.rules[].scope] as $scopes
    | [
        "entity.name",
        "entity.other.inherited-class",
        "entity.name.section",
        "entity.name.tag",
        "entity.other.attribute-name",
        "variable",
        "variable.language",
        "variable.parameter",
        "variable.function",
        "constant",
        "constant.numeric",
        "constant.language",
        "constant.character.escape",
        "storage.type",
        "storage.modifier",
        "support",
        "keyword",
        "keyword.control",
        "keyword.operator",
        "keyword.declaration",
        "string",
        "comment",
        "invalid",
        "invalid.deprecated"
    ]
    | all(. as $required | any($scopes[]; contains($required)))
' "$scheme" >/dev/null

if rg -q '\{\{|<\*|\*>' "$scheme"; then
    printf 'unresolved template expression in %s\n' "$scheme" >&2
    exit 1
fi

printf 'validated %s\n' "$scheme"
