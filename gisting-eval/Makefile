# Copy-pasted from "Recursive Make Considered Harmful":
MODULES = abc fyll_inn generated
all:
	for dir in $(MODULES); do \
		(cd $$dir; ${MAKE} all); \
	done
