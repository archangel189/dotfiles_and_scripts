#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

SCRIPT_PATH=bin/makefile
TEST_PATH=tests/makefile

@test "make help - should print help for Makefile with one target" {
    run bash $SCRIPT_PATH/make-help.sh $TEST_PATH/Makefile-1
    [ "$status" -eq 0 ]

    expected="build                                    Build AppSpace API"
    assert_equal "$output" "$expected"
}

@test "make help - should sort targets and print help for Makefile with multiple targets" {
    run bash $SCRIPT_PATH/make-help.sh $TEST_PATH/Makefile-2
    [ "$status" -eq 0 ]

    expected="build                                    Build AppSpace API
deploy                                   Deploy AppSpace API"
    assert_equal "$output" "$expected"
}
