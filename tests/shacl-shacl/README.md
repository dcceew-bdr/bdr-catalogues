# SHACL-SHACL regression fixtures

These fixtures guard against replacing the local 2017 SHACL-SHACL validator
with an empty or metadata-only graph.

Run the regression check from the repository root:

```sh
make test-shacl-shacl
```

The test requires `kurra`. It checks that:

1. the local SHACL-SHACL artefact conforms to the vendored Validator
   Publication Profile validator (`validator.shacl.ttl`);
2. the current BDR validator is accepted by SHACL-SHACL; and
3. `invalid-multiple-paths.ttl` is rejected by SHACL-SHACL.
