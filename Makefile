CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

build: *.cpp *.hpp
	mkdir -p build/shaders
	mkdir -p bin

	glslc shaders/simple_shader.vert -o build/shaders/simple_shader.vert.spv
	glslc shaders/simple_shader.frag -o build/shaders/simple_shader.frag.spv
	
	g++ $(CFLAGS) -o bin/vulkan_test *.cpp $(LDFLAGS)

.PHONY: exec clean shaders

exec: build
	./bin/vulkan_test

clean:
	rm -rf bin
	rm -rf build