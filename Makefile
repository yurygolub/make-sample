BINARY=main.exe
DIRSRC=src
DIROBJ=obj
DIRBIN=bin

CC=clang
OPT=-O0
# generate files that encode make rules for the .h dependencies
DEPFLAGS=-MP -MD

# List of C Sources and corresponding objects
SRC_C=$(wildcard $(DIRSRC)/*.c)
OBJECTS=$(patsubst $(DIRSRC)/%.c,$(DIROBJ)/%.o,$(SRC_C))
DEPFILES=$(patsubst $(DIRSRC)/%.c,$(DIROBJ)/%.d,$(SRC_C))

# automatically add the -I onto each include directory
CFLAGS=-I$(DIRSRC) $(OPT) $(DEPFLAGS)

all: $(DIRBIN)/$(BINARY)

$(DIRBIN)/$(BINARY): $(OBJECTS)
	@if not exist $(DIRBIN) mkdir $(DIRBIN)
	$(CC) -o $@ $^

# only want the .c file dependency here, thus $< instead of $^.
#
$(DIROBJ)/%.o: $(DIRSRC)/%.c
	@if not exist $(DIROBJ) mkdir $(DIROBJ)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rd /q /s $(DIROBJ) $(DIRBIN)

# @ silences the printing of the command
# $(info ...) prints output
diff:
	$(info The status of the repository, and the volume of per-file changes:)
	@git status
	@git diff --stat

# include the dependencies
-include $(DEPFILES)

# add .PHONY so that the non-targetfile - rules work even if a file with the same name exists.
.PHONY: all clean diff
