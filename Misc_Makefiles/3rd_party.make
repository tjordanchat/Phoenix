
_sonar = $(shell which sonar)
_jq = $(shell which jq)
all: 
	@echo "sonar $(_sonar)"
	@echo "jq $(_jq)"
