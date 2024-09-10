package main

import rego.v1

doc := {
	"bomFormat": "CycloneDX",
    "specVersion": "1.6"
}

result1 := json.match_schema(doc, cyclonedx_schema)

result2 := json.match_schema(doc, simple_schema)

results := [result1, result2]
