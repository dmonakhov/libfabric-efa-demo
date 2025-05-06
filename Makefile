CXX       = g++
LIBFABRIC_HOME ?= build/libfabric
CUDA_HOME ?= /usr/local/cuda
CXXFLAGS  = -Wall -Werror -std=c++17 -march=native -O2 -g -I$(LIBFABRIC_HOME)/include -I$(CUDA_HOME)/include
LDFLAGS   = -L$(LIBFABRIC_HOME)/lib -L$(CUDA_HOME)/lib64
LDLIBS    = -lfabric -lpthread -lcudart -lcuda
BINARIES  = build/4_hello \
			build/5_reverse \
			build/6_write \
			build/7_queue \
			build/8_topo \
			build/9_multinet \
			build/10_warmup \
			build/11_multithread \
			build/12_pin \
			build/13_shard \
			build/14_batch \
			build/15_lazy

export LD_LIBRARY_PATH := $(PWD)/$(LIBFABRIC_HOME)/lib:$(LD_LIBRARY_PATH)

.PHONY: all clean

all: $(BINARIES)

clean:
	rm -rf $(BINARIES)

build/%: src/%.cpp $(LIBFABRIC_HOME)/lib/libfabric.so
	$(CXX) $(CXXFLAGS) -o $@ $< $(LDFLAGS) $(LDLIBS)
