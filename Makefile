CXX = g++
CXXFLAGS = -std=c++17 -I./src

SRC_DIR = src
MODELS_DIR = $(SRC_DIR)/models
OUT_DIR = out
BIN_DIR = $(OUT_DIR)
OBJ_DIR = $(OUT_DIR)/obj

TARGET = $(BIN_DIR)/vote_program
SEED_DATA = $(SRC_DIR)/seed_data.json
SEED_DATA_OUT = $(BIN_DIR)/seed_data.json

SRCS = $(SRC_DIR)/main.cpp \
       $(SRC_DIR)/Vote.cpp \
       $(MODELS_DIR)/Ballot.cpp \
       $(MODELS_DIR)/Candidate.cpp \
       $(MODELS_DIR)/Election.cpp \
       $(MODELS_DIR)/Officer.cpp \
       $(MODELS_DIR)/Voter.cpp

HEADERS = $(SRC_DIR)/Vote.h \
	  $(MODELS_DIR)/Ballot.h \
	  $(MODELS_DIR)/Candidate.h \
	  $(MODELS_DIR)/Election.h \
	  $(MODELS_DIR)/Officer.h \
	  $(MODELS_DIR)/Voter.h

OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(filter $(SRC_DIR)/%.cpp,$(SRCS))) \
       $(patsubst $(MODELS_DIR)/%.cpp,$(OBJ_DIR)/models/%.o,$(filter $(MODELS_DIR)/%.cpp,$(SRCS)))

all: $(TARGET) $(SEED_DATA_OUT)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR)/models

$(TARGET): $(OBJS) | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -o $@ $^
	@echo "Build successfully"

$(SEED_DATA_OUT): $(SEED_DATA) | $(OBJ_DIR)
	cp $(SEED_DATA) $(SEED_DATA_OUT)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(HEADERS) | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/models/%.o: $(MODELS_DIR)/%.cpp $(HEADERS) | $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OUT_DIR)

run: all
	cd $(BIN_DIR) && ./vote_program

rebuild: clean all

.PHONY: all clean run rebuild
