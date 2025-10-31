#!/bin/bash
echo "========================================================="
echo "	basic-learning: shell script"
echo "	write: MTG"
echo "	https://github.com/analog-green/basic-learning"
echo "========================================================="

loop_with_for() {
    local arg_max=$1
    local result=0;
    echo "	[함수 loop_with_for]	result=1 + ... + $arg_max";
    for (( i=1; i<=$arg_max; i++ )); do
        result=$((result + i))
    done
    echo "	result=$result";
};
loop_with_while() {
    local arg_max=$1
    local result=0;
    local counter=1;
    echo "	[함수 loop_with_while]	result=1 + ... + $arg_max";
    while [ $counter -le $arg_max ]; do
        result=$(expr $result + $counter)
        counter=`expr $counter + 1`
    done
    echo "	result=$result";
};
loop_with_until() {
    local arg_start=$1
	local arg_max=$2
    local result=0;
    echo "	[함수 loop_with_while]	result=$arg_start + ... + $arg_max";
    until [ $arg_start -gt $arg_max ]; do
        result=$[$result + $arg_start];
        arg_start=$[$arg_start + 1]
    done
    echo "	result=$result";
}
# =========================================================

TEST_DYNAMIC_VAR="포인트-1. 쉘 스크립트 변수 출력하는 방법"
echo 'TEST_DYNAMIC_VAR="$TEST_DYNAMIC_VAR"';
echo 'TEST_DYNAMIC_VAR=$TEST_DYNAMIC_VAR';
echo "TEST_DYNAMIC_VAR=$TEST_DYNAMIC_VAR";
echo "";
echo "(TIP) 전체를 작은따옴표(')로 감싸면, 에디터에서 본 그대로이니 변수값이 출력되려면 전체를 큰따옴표로 감싸야"
echo "----------------------------------------"


echo "숫자를 입력하세요 (1~100)"
read TEST_DYNAMIC_VAR;

if [ $TEST_DYNAMIC_VAR -le 30 ]; then	# $TEST_DYNAMIC_VAR <= 30
    loop_with_for 10;
elif [ $TEST_DYNAMIC_VAR -lt 70 ]; then	# $TEST_DYNAMIC_VAR < 70
    loop_with_while 20;
else
    loop_with_until 0 $TEST_DYNAMIC_VAR
fi
echo "";
echo "(TIP) 숫자형 변수는 eq, ne, gt, ge, lt, le 인 2글자 연산자"
echo '(TIP) 조건문 체크시, 대괄호와 변수 사이에 1칸 공간 필수 - 예:  if [ $TEST_DYNAMIC_VAR -ge 30 ]; then'
echo "----------------------------------------"


echo "문자열을 입력하세요 (start / center / ???): "
read TEST_DYNAMIC_VAR;

if [ "$TEST_DYNAMIC_VAR" = "start" ]; then
    loop_with_for 20;
elif [ "$TEST_DYNAMIC_VAR" = "center" ]; then
    loop_with_while 10;
else
    loop_with_until 4 99;
fi
echo "(TIP) 문자형 변수는 =, != 인 논리연산자"
echo "(TIP) until 문 실행조건 == 거짓(False)"
echo "----------------------------------------"
