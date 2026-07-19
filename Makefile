.PHONY: test test-shacl-shacl

KURRA ?= kurra
SHACL_SHACL := resources/validators/abis/items/shacl-shacl.ttl
GEOSPARQL_SHACL := resources/validators/abis/items/geo.ttl
VALPUB_SHACL := resources/validators/abis/items/validator.shacl.ttl
SHACL_VALID_EXAMPLE := resources/validators/bdr/items/cats.ttl
SHACL_INVALID_EXAMPLE := tests/shacl-shacl/invalid-multiple-paths.ttl

test: test-shacl-shacl

test-shacl-shacl:
	$(KURRA) shacl validate -s $(VALPUB_SHACL) $(SHACL_SHACL)
	$(KURRA) shacl validate -s $(VALPUB_SHACL) $(GEOSPARQL_SHACL)
	$(KURRA) shacl validate -s $(SHACL_SHACL) $(SHACL_VALID_EXAMPLE)
	@output="$$($(KURRA) shacl validate -s $(SHACL_SHACL) $(SHACL_INVALID_EXAMPLE) 2>&1)"; \
	printf '%s\n' "$$output"; \
	case "$$output" in \
		*"The data is NOT valid"*) \
			echo "SHACL-SHACL correctly rejected the known-invalid regression fixture" ;; \
		*) \
			echo "ERROR: SHACL-SHACL accepted the known-invalid regression fixture"; \
			exit 1 ;; \
	esac
