SERVER_NAME=server
AI_NAME=ai
CUI_NAME=cui
GUI_NAME=gui
GOPATH=$(shell go env GOPATH)

build:
	go install github.com/isangeles/fire@latest
	go install github.com/isangeles/ignite@latest
	go install github.com/isangeles/burnsh@latest
	go install github.com/isangeles/mural@latest
	cp ${GOPATH}/bin/fire ${SERVER_NAME}
	cp ${GOPATH}/bin/ignite ${AI_NAME}
	cp ${GOPATH}/bin/burnsh ${CUI_NAME}
	cp ${GOPATH}/bin/mural ${GUI_NAME}
	git clone https://github.com/isangeles/elwynn data/modules/elwynn
	
up:
	go install github.com/isangeles/fire@latest
	go install github.com/isangeles/ignite@latest
	go install github.com/isangeles/burnsh@latest
	go install github.com/isangeles/mural@latest
	cp ${GOPATH}/bin/fire ${SERVER_NAME}
	cp ${GOPATH}/bin/ignite ${AI_NAME}
	cp ${GOPATH}/bin/burnsh ${CUI_NAME}
	cp ${GOPATH}/bin/mural ${GUI_NAME}
	cd data/modules/elwynn; git pull origin master
	