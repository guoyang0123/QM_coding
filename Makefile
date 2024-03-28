#
# **************************************************************
#        An orca external invoker for cluster in molecules
#               Created by Yang Guo & Yuqi Wang
# **************************************************************
#

CXX      := g++
CXXFLAGS := -pedantic-errors -Wall -Wextra
LDFLAGS  := -L/usr/lib -lstdc++ -DEIGEN_USE_MKL_ALL -L/opt/intel/mkl/lib/intel64 -L/opt/intel/lib/intel64 -Wl,--no-as-needed -lmkl_rt -lpthread -lm -ldl
BUILD    := ./build
OBJ_DIR  := $(BUILD)/objects
APP_DIR  := $(BUILD)/apps
TARGET   := main
INCLUDE  := -Iinclude/ -I/opt/intel/mkl/include 
SRC      :=                      \
   $(wildcard src/tools/*.cpp)   \
   $(wildcard src/*.cpp)         \

OBJECTS := $(SRC:%.cpp=$(OBJ_DIR)/%.o)

all: build $(APP_DIR)/$(TARGET)

$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ -c $<

$(APP_DIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) $(LDFLAGS) -o $(APP_DIR)/$(TARGET) $(OBJECTS)

.PHONY: all build clean debug release

build:
	@mkdir -p $(APP_DIR)
	@mkdir -p $(OBJ_DIR)

debug: CXXFLAGS += -DDEBUG -g
debug: all

release: CXXFLAGS += -O2
release: all

clean:
	-@rm -rvf $(OBJ_DIR)/*
	-@rm -rvf $(APP_DIR)/*
