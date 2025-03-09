CC = gcc -std=c99
CFLAGS = -g -I ./ -I ./include
OBJS = ./utils.o ./main.o ./dir_file.o
TARGET = pa0
SUBMIT = pa0-submission.tar.gz
OUTPUT = ./my_outputs/output*

all: $(TARGET)

$(TARGET): $(OBJS)
	gcc -g -o $@ $(OBJS)

.PHONY: clean

clean:
	rm -f $(OBJS) $(TARGET) $(SUBMIT) $(OUTPUT)

help:
	@echo "The following options are provided with Make\n\t$$ make \t\t# build main\n\t$$ make clean \t# clean the build\n\t$$ make test \t# test cases"

test: $(TARGET)

test: test_0 test_1 test_2 test_3 test_4

test_0: $(TARGET)
	@echo "Testing example0"; \
	./pa0 sample_inputs/input0/file_input sample_inputs/input0/dir_input > my_outputs/output0; \
	diff -Naur my_outputs/output0 sample_outputs/output0; \
	if [ $$? -eq 0 ]; then echo "\tTest seems correct\n"; else echo "\tResults not identical, check the diff output\n"; fi

test_1: $(TARGET)
	@echo "Testing example1"; \
	./pa0 sample_inputs/input1/file_input sample_inputs/input1/dir_input > my_outputs/output1; \
	diff -Naur my_outputs/output1 sample_outputs/output1; \
	if [ $$? -eq 0 ]; then echo "\tTest seems correct\n"; else echo "\tResults not identical, check the diff output\n"; fi

test_2: $(TARGET)
	@echo "Testing example2"; \
	./pa0 sample_inputs/input2/file_input sample_inputs/input2/dir_input > my_outputs/output2; \
	diff -Naur my_outputs/output2 sample_outputs/output2; \
	if [ $$? -eq 0 ]; then echo "\tTest seems correct\n"; else echo "\tResults not identical, check the diff output\n"; fi

test_3: $(TARGET)
	@echo "Testing example3"; \
	./pa0 sample_inputs/input3/file_input sample_inputs/input3/dir_input > my_outputs/output3; \
	diff -Naur my_outputs/output3 sample_outputs/output3; \
	if [ $$? -eq 0 ]; then echo "\tTest seems correct\n"; else echo "\tResults not identical, check the diff output\n"; fi

test_4: $(TARGET)
	@echo "Testing example4"; \
	./pa0 sample_inputs/input4/file_input sample_inputs/input4/dir_input > my_outputs/output4; \
	diff -Naur my_outputs/output4 sample_outputs/output4; \
	if [ $$? -eq 0 ]; then echo "\tTest seems correct\n"; else echo "\tResults not identical, check the diff output\n"; fi

submission:
	@echo "Generating a compressed file ($(SUBMIT)) including utils.c and dir_file.c"; \
	tar cvzf $(SUBMIT) utils.c dir_file.c

memory_check: $(TARGET)
ifndef test
	@echo "missing 'test' argument"
else
	valgrind ./pa0 sample_inputs/input${test}/file_input sample_inputs/input${test}/dir_input
endif
