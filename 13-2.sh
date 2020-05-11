#!/usr/bin/env bash
function function_B {
	echo "Function B."
}
function function_A {
	echo "$1"
}
function adder {
	echo "$(($1 + $2))"
}

# 调用函数，传参
function_A "Function A."     # Function A.
function_B                   # Function B.
adder 12 56                  # 68
