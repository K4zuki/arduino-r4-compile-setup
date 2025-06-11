all: firmware

# -*-*-*- Constants -*-*-*-*-
SKETCH_STORAGE := sketch
IMAGE := arduino-cli-runner
DOCKER := docker run --rm -v $(PWD):/arduino $(IMAGE)
BOARD:=arduino:renesas_uno:minima

# -*-*-*- User variables defaults -*-*-*-*-
SKETCH:=sketch1
BUILD_PATH:=build

# -*-*-*- User variables override -*-*-*-*-
include Makefile.in

docker:
	docker build -t $(IMAGE) .

initdir:
	mkdir -p $(SKETCH_STORAGE)

new: initdir
	$(DOCKER) sketch new $(SKETCH_STORAGE)/$(SKETCH)

attach: new
	$(DOCKER) board attach -b $(BOARD) $(SKETCH_STORAGE)/$(SKETCH)

init: attach

firmware:
	$(DOCKER) compile --verbose --build-path $(BUILD_PATH) --fqbn $(BOARD) $(SKETCH_STORAGE)/$(SKETCH)
