# Check platform.
ifeq ($(OS),Windows_NT)
# Check if posix shell.
ifneq ($(strip $(filter %sh,$(basename $(realpath $(SHELL))))),)
POSIXSHELL := 1
else
POSIXSHELL :=
endif

else
# Not on windows.
POSIXSHELL := 1

endif

ifneq ($(POSIXSHELL),)
# Set posix variables.
CMDSEP := ;
PATHSEP := /
CP := cp
EXT :=

else
# Set windows variables.
CMDSEP := &
PATHSEP := \\
CP := copy
EXT := .exe

endif
# Set build variables.
SERVER_NAME=server
AI_NAME=ai
CUI_NAME=cui
GUI_NAME=gui
GOPATH=$(shell go env GOPATH)
# Build.
build:
	go install github.com/isangeles/fire@latest
	go install github.com/isangeles/ignite@latest
	go install github.com/isangeles/burnsh@latest
	go install github.com/isangeles/mural@latest
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}fire${EXT} ${SERVER_NAME}${EXT}
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}ignite${EXT} ${AI_NAME}${EXT}
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}burnsh${EXT} ${CUI_NAME}${EXT}
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}mural${EXT} ${GUI_NAME}${EXT}
	git clone https://github.com/isangeles/elwynn data/modules/elwynn
# Update.	
up:
	go install github.com/isangeles/fire@latest
	go install github.com/isangeles/ignite@latest
	go install github.com/isangeles/burnsh@latest
	go install github.com/isangeles/mural@latest
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}fire${EXT} ${SERVER_NAME}${EXT}
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}ignite${EXT} ${AI_NAME}${EXT}
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}burnsh${EXT} ${CUI_NAME}${EXT}
	${CP} ${GOPATH}${PATHSEP}bin${PATHSEP}mural${EXT} ${GUI_NAME}${EXT}
	cd data/modules/elwynn${CMDSEP} git pull origin master
