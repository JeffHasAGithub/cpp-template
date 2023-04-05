CXX := clang++
CXXFLAGS ?= -std=c++17 -Wall -Weffc++ -Wextra -Wsign-conversion -Werror -pedantic-errors
INCLUDES ?= -Iinclude

EXE = $(BINDIR)/main
OBJS = $(addprefix $(OBJDIR)/, main.o greeting.o)

BINDIR = bin
SRCDIR = src
OBJDIR = $(SRCDIR)/obj

$(EXE): $(OBJS)
	@mkdir -p $(dir $@)
	$(CXX) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) -c $(INCLUDES) $(CXXFLAGS) -o $@ $^

clean:
	rm -rf $(BINDIR) $(OBJDIR)

.PHONY: clean
