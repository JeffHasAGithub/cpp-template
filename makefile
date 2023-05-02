CXX := clang++
CXXFLAGS ?= -std=c++20 -Wall -Weffc++ -Wextra -Wsign-conversion -pedantic-errors
INCLUDES ?= -Iinclude

EXE = $(BINDIR)/prog
TEST = $(BINDIR)/test
OBJS = $(addprefix $(OBJDIR)/, main.o greeting.o)

BINDIR = bin
SRCDIR = src
TSTDIR = tests
OBJDIR = $(SRCDIR)/obj

$(EXE): $(OBJS)
	@mkdir -p $(dir $@)
	$(CXX) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) -c $(CXXFLAGS) $(INCLUDES) -o $@ $^

test: $(filter-out $(OBJDIR)/main.o, $(OBJS))
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(wildcard $(TSTDIR)/*.cpp) $^ -o $(TEST)

clean:
	@rm -rf $(BINDIR) $(OBJDIR)

.PHONY: clean
