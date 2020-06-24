NAME ?= ROMNAME

DATE := $(shell date "+%Y%m%d-%H%M")

DEVICE :=DEVICENAME

ZIP := $(NAME)-$(DEVICE)-$(DATE).zip

EXCLUDE := Makefile

normal: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf system.new.dat.br
	@echo "Cleaned Up."
