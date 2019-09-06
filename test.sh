#!/usr/bin/env sh

set -o xtrace

echo ============= Clean cache
./gradlew --stop
rm -rf .gradle/

echo ============= Full build
./gradlew --scan --no-daemon -i clean build

echo ============= Incremental build
./gradlew --scan --no-daemon -i build

echo ============= Releaase
./gradlew --scan --no-daemon -i release

echo ============= Build after release
./gradlew --scan --no-daemon -i clean build

echo ============= Clean cache
./gradlew --stop
rm -rf .gradle/

echo ============= Build after cache cleanup
./gradlew --no-daemon clean build
