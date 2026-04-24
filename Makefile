CXX      = g++
# Προσθήκη -O2 για optimization και στάνταρ flags
CXXFLAGS = -Wall -Wextra -std=c++17 -O2

COMMON_OBJ  = common.o
COORD_OBJ   = jms_coord.o
CONSOLE_OBJ = jms_console.o
POOL_OBJ    = jms_pool.o

all: jms_coord jms_console jms_pool

jms_coord: $(COORD_OBJ) $(COMMON_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

jms_console: $(CONSOLE_OBJ) $(COMMON_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

jms_pool: $(POOL_OBJ) $(COMMON_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp common.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f *.o jms_coord jms_console jms_pool

.PHONY: all clean
