EI_SDK?=edge-impulse-sdk
PYTHON_CROSS_PATH?=

UNAME_S := $(shell uname -s)

CC ?= gcc
CXX ?= g++

CFLAGS +=  -Wall -Wno-strict-aliasing
CFLAGS += -I.
CFLAGS += -Isource
CFLAGS += -Imodel-parameters
CFLAGS += -Itflite-model
CFLAGS += -Ithird_party/
CFLAGS += -Iutils/
CFLAGS += -O3
CFLAGS += -DNDEBUG
CFLAGS += -DEI_CLASSIFIER_ENABLE_DETECTION_POSTPROCESS_OP=1
ifeq (${CC}, clang)
	CFLAGS += -Wno-asm-operand-widths
endif
CXXFLAGS += -std=c++14
LDFLAGS += -lm -lstdc++

CSOURCES = 
CXXSOURCES = main.cpp
CCSOURCES =

LIBEDGEIMPULSE_PATH = ./libedgeimpulse
CFLAGS += -I ${LIBEDGEIMPULSE_PATH}/include

LDFLAGS += -L ${LIBEDGEIMPULSE_PATH}/lib
LDFLAGS += -Wl,-R ${LIBEDGEIMPULSE_PATH}/lib -ledgeimpulse

# Host specific
ifeq ($(OS),Windows_NT)
	MKDIR_BUILD = if not exist build mkdir build
else
	MKDIR_BUILD = mkdir -p build
endif

#end host specific

all: executable

.PHONY: executable clean

COBJECTS := $(patsubst %.c,%.o,$(CSOURCES))
CXXOBJECTS := $(patsubst %.cpp,%.o,$(CXXSOURCES))
CCOBJECTS := $(patsubst %.cc,%.o,$(CCSOURCES))

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

%.o: %.cc
	$(CXX) $(CFLAGS) $(CXXFLAGS) -c $^ -o $@

%.o: %.cpp
	$(CXX) $(CFLAGS) $(CXXFLAGS) -c $^ -o $@

executable: $(COBJECTS) $(CXXOBJECTS) $(CCOBJECTS)
	$(MKDIR_BUILD)
	$(warning LDFLAGS is now $(LDFLAGS))
	$(CXX) -o build/$@  $(COBJECTS) $(CXXOBJECTS) $(CCOBJECTS) $(LDFLAGS)

clean:
	rm -f $(COBJECTS)
	rm -f $(CCOBJECTS)
	rm -f $(CXXOBJECTS)
	rm -f build/executable
