#!/usr/bin/env bash

export ERL_TOP="$(pwd)"
./configure --with-ssl="${PREFIX}" --prefix="${PREFIX}"
make
make release_tests
cd "${ERL_TOP}/release/tests/test_server"
${ERL_TOP}/bin/erl -s ts install -s ts smoke_test batch -s init stop
cd ${ERL_TOP}
make install
