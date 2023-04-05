CXX := clang++
CXXFLAGS ?= -std=c++17 -Wall -Weffc++ -Wextra -Wsign-conversion -Werror -pedantic-errors
INCLUDES ?= -Iinclude

EXE = $(BINDIR)/main
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
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(TSTDIR)/test_main.cpp $^ -o $(TEST)

clean:
	rm -rf $(BINDIR) $(OBJDIR)

.PHONY: clean
